#!/usr/bin/env bash

rm ~/.zshrc ~/.zprofile ~/.zlogin ~/.zlogout ~/.zsh_history 2>/dev/null
cat << 'EOF' > ~/.zshenv
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
EOF

# Neovim, it should already be installed from requirements, but check to be safe
if ! command -v nvim >/dev/null 2>&1; then
  echo
  echo "Installing Neovim"
  echo
  case "${OS:-}" in
    macos)
      brew install neovim
      ;;
    linux|wsl)
      sudo apt-get install -y neovim
      ;;
  esac
fi

# Oh-My-ZSH
if [[ ! -d "${ZSH:-$HOME/.oh-my-zsh}" ]]; then
  echo
  echo "Installing Oh My Zsh (non-interactive)…"
  echo
  export RUNZSH=no CHSH=no KEEP_ZSHRC=yes
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo
  echo "Oh My Zsh already installed. Updating…"
  echo
  git -C "${ZSH:-$HOME/.oh-my-zsh}" pull --rebase --autostash || true
fi

# Set ZSH_CUSTOM to the standard location
ZSH_CUSTOM="${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}"

# fzf, it should already be installed from requirements, but check to be safe
if ! command -v fzf >/dev/null 2>&1; then
  echo
  echo "Installing fzf"
  echo
  case "${OS:-}" in
    macos)
      brew install fzf
      ;;
    linux|wsl)
      sudo apt-get install -y fzf
      ;;
  esac
fi

# Install a couple of ZSH plugins
# ZSH-Autosuggest
ZSH_AUTOSUGGEST_DIR="${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
if [[ ! -d "${ZSH_AUTOSUGGEST_DIR}/.git" ]]; then
  echo
  echo "Installing zsh-autosuggestions…"
  echo
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_AUTOSUGGEST_DIR}"
else
  echo
  echo "Updating zsh-autosuggestions…"
  echo
  git -C "${ZSH_AUTOSUGGEST_DIR}" pull --rebase --autostash || true
fi

# ZSH-Syntax-Highlight
ZSH_HIGHLIGHT_DIR="${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
if [[ ! -d "${ZSH_HIGHLIGHT_DIR}/.git" ]]; then
  echo
  echo "Installing zsh-syntax-highlighting…"
  echo
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_HIGHLIGHT_DIR}"
else
  echo
  echo "Updating zsh-syntax-highlighting…"
  echo
  git -C "${ZSH_HIGHLIGHT_DIR}" pull --rebase --autostash || true
fi

# Starship prompt, it should already be installed from requirements, but check to be safe
if ! command -v starship >/dev/null 2>&1; then
  echo
  echo "Installing Starship"
  echo
  case "${OS:-}" in
    macos)
      brew install starship
      ;;
    linux|wsl)
      sudo apt-get install -y starship
      ;;
  esac
fi

echo
echo "Terminal setup complete. Oh My Zsh and plugins are installed/updated."
echo