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

# Autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
#zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

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

# Powerline colors
vim_cmd_mode="%{[01;38;5;022;48;5;148m%} NORMAL %{[00;38;5;148m%}%k%f"
vim_ins_mode="%{[01;38;5;031;48;5;015m%} INSERT %{[00;38;5;015m%}%k%f"
vim_vis_mode="%{[01;38;5;088;48;5;208m%} VISUAL %{[00;38;5;208m%}%k%f"

# Landscape colors
#vim_cmd_mode="%{[01;38;5;012;48;5;015m%} NORMAL %{[00;38;5;015m%}%k%f"
#vim_ins_mode="%{[01;38;5;022;48;5;015m%} INSERT %{[00;38;5;015m%}%k%f"
#vim_vis_mode="%{[01;38;5;057;48;5;015m%} INSERT %{[00;38;5;015m%}%k%f"

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
	PR_USER="%{[00;38;5;022m%}%{[00;38;5;000;48;5;022m%} %n"	# HOST corrects colors
	PR_USER_OP='%F{green}%#%f'
	PR_PROMPT='${vim_mode} '
else # root
	PR_USER='%F{blue}%n%f'
	PR_USER_OP='%F{blue}%#%f'
	PR_PROMPT='${vim_mode} '
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
	PR_HOST='%{[00;38;5;022m%}%F{blue}%k%K{blue}%F{black} %M %f%k' # SSH
else
	PR_HOST='%{[00;38;5;022m%}%{[00;38;5;148m%}%k%{[00;38;5;000;48;5;148m%} %M %f%k' # no SSH
fi

local return_code="%(?..%{[00;38;5;088m%}%{[00;38;5;000;48;5;088m%} %? %{[00;38;5;088m%}%f%k)"	# U+F112

local display_time="%{[00;38;5;000;48;5;088m%} %* %f%k%{[00;38;5;088m%}%f%k"
local user_host="${PR_USER} ${PR_HOST}"
local current_dir="%{[01;48;5;057;38;5;000m%} %~/ %b%{[00;38;5;057m%}%f%k"

# TWO LINE PROMPT
PROMPT="${display_time}%{[01;38;5;057m%}%f%b${current_dir}
$PR_PROMPT"
#╰─
# CHROME OS and crouton do not like the right prompt!
RPROMPT="${return_code}${user_host}"

# REFRESH prompt every X seconds:
#TMOUT=2; TRAPALRM() { zle reset-prompt }

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

#neofetch <- SLOW on OpenSUSE
fortune
echo -n "Current Shell: "; echo -n "ZSH "; echo $ZSH_VERSION

