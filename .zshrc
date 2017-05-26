# HOW TO RUN ZSH SETUP AGAIN!
#	autoload -Uz zsh-newuser-install
#	zsh-newuser-install -f

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall

zstyle ':completion:*' menu select

# Default text editor
export EDITOR=$(which vim)
export VISUAL=$(which vim)

# Set the TERM so that italics and color are available, even in TMUX
export TERM=xterm-256color

# ------------ Set up some variables for prompt --------------

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
	PR_USER='%U%F{green}%n%f%u'
	PR_USER_OP='%F{green}%#%f'
	PR_PROMPT='%f➤ %f'
else # root
	PR_USER='%F{red}%n%f'
	PR_USER_OP='%F{red}%#%f'
	PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
	PR_HOST='%F{red}%M%f' # SSH
else
	PR_HOST='%F{yellow}%M%f' # no SSH
fi

local return_code="%(?..%F{red}%? ↵%f)"

local display_time="%{[00;38;5;196m%}%*"
local user_host="${PR_USER}%B%F{cyan}∈%b${PR_HOST}"
local current_dir="%B%{[01;38;5;055m%}%~/%{[0m%}%b"

# Prompt customization
autoload -Uz promptinit
promptinit
# OLD PROMPT!
#PROMPT='%B%F{1}%U%n%u%F{5}∂%F{3}%m %b%1~/ %B%F{2}▶%f%b '
#RPROMPT='%B%F{2}%*'
# Extra symbols
#∈ ∂ ℤ∫ ℍ ∇

# TWO LINE PROMPT
PROMPT="╭─${display_time} ${user_host}:${current_dir}
╰─$PR_PROMPT"
RPROMPT="${return_code}"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias sl='sl -e'
alias tmux='tmux -2'
alias my_i3lock='i3lock -c 000000 -d -n'

# The Common Room Raspberry Pi
alias common_room_pi='ssh pi@25.33.244.15'

# ITER HPC
alias hpc-iter='ssh -X blondik@hpc-login4.iter.org'

# TEMPORARY for Stellarator Master Class
alias mcviewer='/home/kabv/Documents/Masters/Quartile\ 7/Stellarator\ Master\ Class/mcviewer64'

# Directory and file colors
test -r .dircolors && eval "$(dircolors $HOME/.dircolors)"

neofetch
echo -n "Current Shell: "; echo -n "ZSH "; echo $ZSH_VERSION
