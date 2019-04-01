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

## FUNCTIONS!
# urlencode some text
function urlencode {
	print "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# open a web browser on google for a query
function google {
	xdg-open "https://www.google.com/search?q=`urlencode "${(j: :)@}"`"
}

# print a separator banner as wide as the terminal
function hr {
	print ${(l:COLUMNS::=:)}
}

# display a list of supported colors
function lscolors {
	((cols = $COLUMNS - 4))
	s=$(printf %${cols}s)
	for i in {000..$(tput colors)}; do
		echo -e $i $(tput setaf $i; tput setab $i)${s// /=}$(tput op);
	done
}

# Explain command, requires curl and internet
explain () {
	if [ "$#" -eq 0 ]; then
		while read  -p "Command: " cmd; do
			curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
		done
		echo "Bye!"

	elif [ "$#" -eq 1 ]; then
		curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1"

	else
		echo "Usage"
		echo "explain                  interactive mode."
		echo "explain 'cmd -o | ...'   one quoted command to explain it."
	fi
}


#neofetch <- SLOW on OpenSUSE

# Syntax highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] || [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# thefuck alias
if [ -s thefuck ]; then
	eval $(thefuck --alias)
fi

# Fortune check install
if [ -s fortune ]; then
	fortune
fi

# Print current shell version
echo -n "Current Shell: "; echo -n "ZSH "; echo $ZSH_VERSION

