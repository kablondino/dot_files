#  ███████╗██╗    ██╗ █████╗  ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ 
#  ██╔════╝██║    ██║██╔══██╗██╔════╝ ██╔══██╗██║████╗  ██║██╔═══██╗
#  ███████╗██║ █╗ ██║███████║██║  ███╗██║  ██║██║██╔██╗ ██║██║   ██║
#  ╚════██║██║███╗██║██╔══██║██║   ██║██║  ██║██║██║╚██╗██║██║   ██║
#  ███████║╚███╔███╔╝██║  ██║╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝
#  ╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
#                                                                   
#  ███████╗███████╗██╗  ██╗██████╗  ██████╗                         
#  ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝                         
#    ███╔╝ ███████╗███████║██████╔╝██║                              
#   ███╔╝  ╚════██║██╔══██║██╔══██╗██║                              
#  ███████╗███████║██║  ██║██║  ██║╚██████╗                         
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝                         

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd notify

# Vim mode!
bindkey -v

# Key timeout
KEYTIMEOUT=1

# Proper backspace and delete keys
bindkey "^?" backward-delete-char
bindkey "[3~" delete-char


zstyle :compinstall filename '$HOME/.zshrc'

# Autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
#zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Load the aliases and exported variables set by .common.rc.sh
. ~/.common.rc.sh

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
if [ -f '/home/kablondino/google-cloud-sdk/path.zsh.inc' ]; then
	. '/home/kablondino/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/kablondino/google-cloud-sdk/completion.zsh.inc' ]; then
	. '/home/kablondino/google-cloud-sdk/completion.zsh.inc'
fi

# Load the prompt (for gcloud, to be loaded AFTER the $PATH and completion)
. ~/.prompt.zsh

