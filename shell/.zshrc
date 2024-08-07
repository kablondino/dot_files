#  ███████╗███████╗██╗  ██╗██████╗  ██████╗
#  ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#    ███╔╝ ███████╗███████║██████╔╝██║
#   ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#  ███████╗███████║██║  ██║██║  ██║╚██████╗
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd notify

# Vim mode!
bindkey -v

# Key timeout
KEYTIMEOUT=1

# Proper backspace and delete keys
bindkey "^?" backward-delete-char
bindkey "[3~" delete-char

# Edit command in full Vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^x^e' edit-command-line  # Same bindings as in bash default

# Reverse search, just like bash
bindkey '^R' history-incremental-search-backward

zstyle :compinstall filename '$HOME/.zshrc'

# Autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Load the aliases and exported variables set by common.rc.sh
. ~/dot_files/shell/common.rc.sh

# Directory and file colors
test -r ~/.dircolors && eval "$(dircolors $HOME/.dircolors)"

# Unset SSH_ASKPASS
unset SSH_ASKPASS


## ZSH-specific functions
# urlencode some text
function urlencode {
	print "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# open a web browser on google for a query
function google {
	xdg-open "https://www.google.com/search?q=`urlencode "${(j: :)@}"`"
}


# Syntax highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
	. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
	. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -d "/home/kablondino/google-cloud-sdk" ]; then
	if [ -f '/home/kablondino/google-cloud-sdk/path.zsh.inc' ]; then
		. '/home/kablondino/google-cloud-sdk/path.zsh.inc'
	fi

	# The next line enables shell command completion for gcloud.
	if [ -f '/home/kablondino/google-cloud-sdk/completion.zsh.inc' ]; then
		. '/home/kablondino/google-cloud-sdk/completion.zsh.inc'
	fi
fi

# Load the prompt (for gcloud, to be loaded AFTER the $PATH and completion)
. ~/dot_files/shell/prompt.zsh
