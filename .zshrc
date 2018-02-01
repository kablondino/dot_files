# HOW TO RUN ZSH SETUP AGAIN!
#	autoload -Uz zsh-newuser-install
#	zsh-newuser-install -f

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd notify

# Vim mode!
bindkey -v

# Proper backspace and delete keys
bindkey "^?" backward-delete-char
bindkey "[3~" delete-char


zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall

zstyle ':completion:*' menu select

# Default text editor
export EDITOR=$(which vim)
export VISUAL=$(which vim)

# Timeout for keyboard
export KEYTIMEOUT=1

# Set the TERM so that italics and color are available, even in TMUX
export TERM=xterm-256color

# Prompt customization
autoload -Uz promptinit
autoload -U colors && colors
autoload -Uz vcs_info
promptinit
# OLD PROMPT!
#PROMPT='%B%F{1}%U%n%u%F{5}∂%F{3}%m %b%1~/ %B%F{2}▶%f%b '
#RPROMPT='%B%F{2}%*'
# Extra symbols
#∈ ∂ ℤ∫ ℍ ∇

# ------------ Set up some variables for prompt --------------

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

setopt PROMPT_SUBST

vim_cmd_mode="%{[01;38;5;022;48;5;148m%} NORMAL %{$reset_color%}"
vim_ins_mode="%{[01;38;5;015;48;5;031m%} INSERT %{$reset_color%}"
vim_vis_mode="%{[01;38;5;088;48;5;208m%} VISUAL %{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
	vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
	zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
	vim_mode=${vim_ins_mode}
}
zle -N zle-line-finish

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
	PR_USER='%U%F{green}%n%f%u'
	PR_USER_OP='%F{green}%#%f'
	PR_PROMPT='%f${vim_mode} ❱ %f'
else # root
	PR_USER='%F{red}%n%f'
	PR_USER_OP='%F{red}%#%f'
	PR_PROMPT='%F{red}${vim_mode} ❱ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
	PR_HOST='%F{red}%M%f' # SSH
else
	PR_HOST='%F{yellow}%M%f' # no SSH
fi

local return_code="%(?..%F{red}%? ↵%f)"

local display_time="%{[00;38;5;196m%}%*%{$reset_color%}"
local user_host="${PR_USER}%B%F{cyan}∈%b${PR_HOST}"
local current_dir="%B%{[01;38;5;057m%}%~/%{$reset_color%}%b"

# TWO LINE PROMPT
PROMPT="%B%F{cyan}[%f%b${display_time}%B%F{cyan}]%f%b ${user_host}%B%F{cyan}❱%f%b${current_dir}
$PR_PROMPT"
#╰─
# CHROME OS and crouton do not like the right prompt!
RPROMPT="${return_code}"

# Directory and file colors
test -r ~/.dircolors && eval "$(dircolors $HOME/.dircolors)"

## Aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias sl='sl -e'
alias quit='exit'
alias tmux='tmux -2'
alias less='less -R'

# ANACONDA
export PATH="/home/kabv/anaconda2/bin:$PATH"

# The Common Room Raspberry Pi
alias common_room_pi='ssh pi@25.33.244.15'

# ITER HPC
alias hpc-iter='ssh -X blondik@hpc-login4.iter.org'

# DigitalOcean "Droplet" Login
alias digitalocean='ssh -X kabv@95.85.18.5'

# Graduation Project directory
alias grad_proj='cd ~/Documents/Masters/Graduation_Project/ && git status'

# Activate FiPy
alias fipy='source activate fipy'

# MATLAB
alias MATLAB='~/MATLAB/bin/matlab -nodesktop -nosplash'


## FUNCTIONS!
# Delete each line in a file that starts with a NON-number(digit) character
function data_clean() {
	grep "^[0-9]" $1 > $2
}

# urlencode some text
function urlencode {
	print "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# open a web browser on google for a query
function google {
	xdg-open "https://www.google.com/search?q=`urlencode "${(j: :)@}"`"
}

# print a separator banner as wide as the terminal
#function hr {
#	print ${(1:COLUMNS::=:)}
#}

#neofetch
fortune
echo -n "Current Shell: "; echo -n "ZSH "; echo $ZSH_VERSION

