#!/usr/bin/env bash

set -euo pipefail

# Set vars to find paths and files
DOTFILES="${DOTFILES:-$(cd "$(dirname "$0")" && pwd)}"
REQS="$DOTFILES/requirements"
SETUP="$DOTFILES/setup"

export DOTFILES
export REQS
export SETUP

# Ensure helper scripts are executable
chmod +x "$SETUP/unix/"*.sh 2>/dev/null || true

# Detect OS
case "$(uname -s)" in
  Darwin) OS="macos" ;;
  Linux)
    if grep -qiE "(microsoft|wsl)" /proc/version 2>/dev/null; then
      OS="wsl"
    else
      OS="linux"
    fi
    ;;
  *)
    echo
    echo "ERROR: unsupported OS: $(uname -s)" >&2
    echo
    exit 1
    ;;
esac
export OS
echo
echo "Operating System Detected: $OS"
echo

# Configure OS appropriately
case "$OS" in
  macos)
    echo
    echo "Setting up your Mac..."
    echo

    # Check for command line tools
    echo
    echo "Checking for Command Line Tools..."
    echo
    if ! xcode-select -p &>/dev/null; then
      echo
      echo "Command Line Tools not found. Installing..."
      xcode-select --install
      echo
      echo "Please complete the Command Line Tools installation in the popup window."
      echo "Press any key once installation is complete..."
      read -r -n1 -s
    else
      echo
      echo "Command Line Tools already installed."
      echo
    fi

    # Install Rosetta
    if ! /usr/bin/pgrep oahd >/dev/null 2>&1; then
      echo
      echo "Installing Rosetta 2 (optional but recommended for some apps)…"
      echo
      softwareupdate --install-rosetta --agree-to-license || true
    fi

    # Check for and install homebrew
    if ! command -v brew >/dev/null 2>&1; then
      echo
      echo "Installing Homebrew"
      echo
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # A fresh install is not on PATH yet in this shell
    for b in /opt/homebrew/bin/brew /usr/local/bin/brew; do
      if [[ -x "$b" ]]; then
        echo
        echo "Adding Homebrew to PATH"
        echo
        eval "$("$b" shellenv)"; break; fi
    done

    # Install homebrew packages
    if [[ -f "$REQS/macos/Brewfile" ]]; then
      echo
      echo "Installing homebrew packages --file=$REQS/macos/Brewfile"
      echo
      if ! brew bundle --file="$REQS/macos/Brewfile"; then
        echo
        echo "WARNING: some Homebrew packages failed to install (see errors above)."
        echo "Continuing setup. To see what's missing, run: brew bundle check --verbose --file=\"$REQS/macos/Brewfile\""
        echo
      else
        echo
        echo "Finished installing Homebrew packages"
        echo
      fi
    else
      echo
      echo "Skipping: Homebrew packages ($REQS/macos/Brewfile not found)"
      echo
    fi

    # Apply MacOS settings
    if [[ -f "$SETUP/unix/macos/macos_defaults.sh" ]]; then
      echo
      echo "Applying MacOS defaults"
      echo
      bash "$SETUP/unix/macos/macos_defaults.sh"
    else
      echo
      echo "Skipping: Applying MacOS defaults ($SETUP/unix/macos/macos_defaults.sh not found)"
      echo
    fi

    # Configure dock
    if [[ -f "$SETUP/unix/macos/dock.sh" ]]; then
      echo
      echo "Configuring the Dock"
      echo
      bash "$SETUP/unix/macos/dock.sh"
    else
      echo
      echo "Skipping: Configuring the Dock ($SETUP/unix/macos/dock.sh not found)"
      echo
    fi
    ;;
  linux|wsl)
    echo
    echo "Setting up your Linux rig..."
    echo

    # Check for apt-get, if not present assume not a supported distro
    if ! command -v apt-get >/dev/null 2>&1; then
      echo
      echo "ERROR: only apt-based distros are supported right now" >&2
      echo
      exit 1
    fi

    # Install apt-get packages
    if [[ -f "$REQS/linux/requirements.txt" ]]; then
      sudo apt-get update
      # Strip comments and blank lines, one package per line
      pkgs=()
      while IFS= read -r line; do
        line="${line%%#*}"
        line="$(echo "$line" | xargs)"
        if [[ -n "$line" ]]; then pkgs+=("$line"); fi
      done < "$REQS/linux/requirements.txt"
      if [[ ${#pkgs[@]} -gt 0 ]]; then
        sudo apt-get install -y "${pkgs[@]}"
      fi
    else
      echo
      echo "Skipping: apt packages ($REQS/linux/requirements.txt not found)"
      echo
    fi

    # Configure dock
    if [[ -f "$SETUP/unix/ubuntu/dock.sh" ]]; then
      echo
      echo "Configuring the Dock"
      echo
      bash "$SETUP/unix/ubuntu/dock.sh"
    else
      echo
      echo "Skipping: Configuring the Dock ($SETUP/unix/ubuntu/dock.sh not found)"
      echo
    fi
    ;;
esac

# Switch default shell to zsh if not already
if [[ "${SHELL:-}" != *zsh ]]; then
  ZSH_PATH="$(command -v zsh || true)"
  if [[ -n "$ZSH_PATH" ]]; then
    # chsh refuses shells not listed in /etc/shells (e.g. Homebrew's zsh)
    if ! grep -qxF "$ZSH_PATH" /etc/shells; then
      echo
      echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
      echo
    fi
    echo
    echo "Setting default shell to $ZSH_PATH"
    echo
    if sudo -n chsh -s "$ZSH_PATH" "$USER" 2>/dev/null; then
      :
    elif chsh -s "$ZSH_PATH"; then
      :
    else
      echo
      echo "WARN: chsh failed; change shell manually:"
      echo "      sudo chsh -s $ZSH_PATH $USER"
      echo
    fi
  fi
fi

# Install python packages
if [[ -f "$REQS/python/requirements.txt" ]]; then
  echo
  echo "Installing Python packages"
  echo
  VENV="${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles-venv"
  python3 -m venv "$VENV"
  "$VENV/bin/python" -m pip install --upgrade pip
  "$VENV/bin/python" -m pip install -r "$REQS/python/requirements.txt"
fi

# Configure terminal
if [[ -f "$SETUP/unix/terminal.sh" ]]; then
  echo
  echo "Setting up your terminal"
  echo
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes bash "$SETUP/unix/terminal.sh"
else
  echo
  echo "Skipping: Setting up your terminal ($SETUP/unix/terminal.sh not found)"
  echo
fi

# Nudge user to authenticate with GitHub if gh is installed but not signed in.
touch "$HOME/.gitconfig"
if command -v gh >/dev/null 2>&1; then
  if ! gh auth status >/dev/null 2>&1; then
    echo
    echo "Don't forget to run 'gh auth login' to set up GitHub SSH + credential helper"
    read -r -p "Would you like to do that now? [y/N] " REPLY
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      gh auth login
    fi
  fi
fi

# Install dotfiles with dotbot
if [[ -x "$DOTFILES/install" ]]; then
  echo
  echo "Restoring dotfiles with dotbot..."
  echo
  cd "$DOTFILES"
  ./install
else
  echo
  echo "Skipping: dotbot ($DOTFILES/install not found)"
  echo
fi

# Reboot that thang
if [[ "$OS" == "macos" || "$OS" == "linux" ]]; then
  echo
  read -r -p "Some settings may not apply until a restart is performed; do you want to reboot the system to complete setup? [y/N] " REPLY
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    sudo reboot
  else
    echo "It is recommended you perform a manual reboot at your earliest convenience to finish setup."
  fi
fi