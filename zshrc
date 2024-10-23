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
ENABLE_CORRECTION="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
if [ $(uname -s 2> /dev/null) = "Darwin" ]; then
	plugins=(
		git
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

# Load my virtual environment for Ansible
alias load-ansible="source $HOME/.venv/bin/activate"

# LOL 
alias pls='sudo'
alias pls\?='eval "sudo $(fc -ln -1)"'

# Show current public IP information
alias whatsmyip="curl https://ipinfo.io"

# Test network speed with speediest-cli, but grep the stuff I actually want
alias whatsmyspeed="speedtest | grep 'Download\|Upload'"

# Navigating directories
alias cd=" cd"
alias .=" cd ..; ls"
alias ..=" cd ..; cd ..; ls"
alias ...=" cd ..; cd ..;cd ..; ls"
alias cd.="."
alias cd..=".."
alias cd...="..."
alias x="exit"
alias c="clear"

# Git sliases
alias gadd="git add"
alias gcommit="git commit"
alias gpull="git pull"
alias gpush="git push"
alias gstatus="git status"

# Make ls do some convenient things
alias ls='lsd -a'

# Make cat be pretty
alias cat="bat"

# Make grep pretty
alias grep="grep --color=auto"

# Confirm before overwriting files
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# Shortcuts for Docker
alias dc="docker-compose"

# Open working directory in vscode
alias code="code ."

# Shortcut for running Ansible playbooks as sudo
alias sap="sudo ansible-playbook"
alias ap="ansible-playbook"

# Shortcut for running Python3
#alias python="python3"

# Shortcut for running Pip3
#alias pip="pip3"

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
alias netops="cd ~/ansible/"
alias github="cd ~/Documents/GitHub"
alias baymax="cd ~/baymax"

# Packages update
if [ $(uname -s 2> /dev/null) = "Darwin" ]; then
	alias update="
	echo
	echo 'Upgrading brew packages...'
	brew update && brew upgrade
	echo
	echo 'Upgrading pipx packages...'
	pipx upgrade-all
	"
fi
if [ $(uname -s 2> /dev/null) = "Linux" ]; then
	alias update="sudo apt-get update -y && sudo apt-get upgrade -y"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

if [ $(uname -s 2> /dev/null) = "Darwin" ]; then
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Created by `pipx` on 2024-09-26 22:00:26
export PATH="$PATH:/Users/cvincent/.local/bin"

cbonsai -s 7007 -c "{}" -b 1 -p

#eval "$(starship init zsh)"
