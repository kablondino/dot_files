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

# Load the aliases and exported variables set by .common.rc.sh
source ~/.common.rc.sh

# Load the prompt
. ~/.prompt.zsh

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
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] || [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Print current shell version
echo -n "Current Shell: "; echo -n "ZSH "; echo $ZSH_VERSION

