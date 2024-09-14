# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# update automatically without asking
zstyle ':omz:update' mode auto

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"


# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
if [ $(uname -s 2> /dev/null) = "Darwin" ]; then
	plugins=(
		git
		#tmux
		zsh-autosuggestions
		colored-man-pages
	)
fi
if [ $(uname -s 2> /dev/null) = "Linux" ]; then
	plugins=(
		git
		zsh-autosuggestions
		colored-man-pages
		zsh-syntax-highlighting
	)
fi


source $ZSH/oh-my-zsh.sh


# User configuration

# Aliases
# Reload zsh
alias reload-matrix="source ~/.zshrc"

# Show current public IP information
alias whatsmyip="curl https://ipinfo.io"

# Test network speed with speediest-cli, but grep the stuff I actually want
alias whatsmyspeed="speedtest | grep 'Download\|Upload'"

# Navigating directories
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."

# Make ls do some convenient things
alias ls='lsd -a'

# Make cat be pretty
alias cat="bat"

# Confirm before overwriting files
alias cp='cp -i'

# Shortcut for running Ansible playbooks as sudo
alias sap="sudo ansible-playbook"

# Shortcut for running Python3
alias python="python3"

# Shortcut for running Pip3
alias pip="pip3"

# Shortcut to run neofetch with custom ascii art
alias neofetch="neofetch --source ~/.config/neofetch/images/usb.txt"

# Ping, but gotta go fash
alias fastping='ping -c 4 -s 2'

# Move between directories
alias home="cd ~"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dotfiles="cd ~/.dotfiles"
alias apps="cd /Applications"
alias ansible="cd /etc/ansible/"
alias github="cd ~/Documents/GitHub"

# Packages update
if [ $(uname -s 2> /dev/null) = "Darwin" ]; then
	alias update='brew update && brew upgrade'
fi
if [ $(uname -s 2> /dev/null) = "Linux" ]; then
	alias update='sudo apt-get update -y && sudo apt-get upgrade -y'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

if [ $(uname -s 2> /dev/null) = "Darwin" ]; then
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
