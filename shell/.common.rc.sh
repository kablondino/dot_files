# This command does not properly work. It's meant to agnosticize this file.
#emulate -LR bash 2>/dev/null

# Default text editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Timeout for keyboard
export KEYTIMEOUT=1

# Set the TERM so that italics and color are available, even in TMUX
export TERM=xterm-256color

export LESS="--tabs=4 --LONG-PROMPT --ignore-case --RAW-CONTROL-CHARS"

# Add conda path (DEPRICATED)
#export PATH="$HOME/miniconda2/bin:$HOME/miniconda3/bin:$PATH"

# Uses this one instead
if [ -s "$HOME/miniconda3/etc/profile.d/conda.sh" \
	-o -s "$HOME/miniconda2/etc/profile.d/conda.sh" ]; then
	. "$HOME/miniconda3/etc/profile.d/conda.sh"
fi

# Set the Go path
if [ -d "$HOME/go" ]; then
	export GOPATH=$HOME/go
fi

## Aliases
alias ls='ls --color=auto'		# Always use color
alias ll='ls -lh'				# Human-readable for detailed list
alias la='ls -A'
alias sl='sl -e'
alias quit='exit'
alias tmux='tmux -2'
alias less='less -R'
alias mv='mv -i'				# Confirm move if overwriting

# Check the NCDU version, for color options
if [ -x "$(command -v ncdu)" ]; then
	ncdu_version="$(ncdu -v | cut -d" " -f2)"
	ncdu_color=1.13
	ncdu_var=$(awk -v a="$ncdu_version" -v b="$ncdu_color" \
		'BEGIN{ print(a>=b) }')
	if [ "$ncdu_var" -eq 1 ]; then
		alias ncdu="ncdu --confirm-quit --color=dark"
	else
		alias ncdu="ncdu --confirm-quit"
	fi
fi


## FUNCTIONS and procedures!
# Alias to cd and list files at once
cs() {
	cd "$@"
	ls
}

# print a separator banner as wide as the terminal
hr() {
	k=0
	while [ $k -lt $COLUMNS ]; do
		echo -ne "="
		k=$((k + 1))
	done
}

# display a list of supported colors
lscolors() {
	((cols = $COLUMNS - 4))
	s=$(printf %${cols}s)
	color_list=$(tput colors)
	j=0  # Looping counter
	while [ $j -le $((color_list)) ]; do
		echo -e $j $(tput setaf $j; tput setab $j)${s// /=}$(tput op);
		j=$((j + 1))
	done
}

# Explain command, requires curl and internet
explain() {
	if [ "$#" -eq 0 ]; then
		while read  -p "Command: " cmd; do
			curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) \
				--data-urlencode "q=$cmd"
		done
		echo "Bye!"

	elif [ "$#" -eq 1 ]; then
		curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) \
			--data-urlencode "q=$1"

	else
		echo "Usage"
		echo "explain                  interactive mode."
		echo "explain 'cmd -o | ...'   one quoted command to explain it."
	fi
}

# Run matlab script (no JVM)
matlab_run() {
	matlab -nodesktop -nosplash -nojvm -r "run('$@'); exit;" | tail -n +11
}

# Timer
timer() {
	seconds=$1

	if [ -z "$seconds" ]; then
		echo "Time in seconds not specified."
	else
		date1=$((`date +%s` + $seconds))
		while [ "$date1" -ge `date +%s` ]; do
			echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"
		done
	fi
}


# Get the OS name (ID), for checking to run neofetch
osrel=$(sed -n '/^ID=/s/^.*=//p' /usr/lib/os-release);
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)

# thefuck alias
if [ -x "$(command -v thefuck)" ]; then
	eval $(thefuck --alias)
fi

# Neofetch (does not run if SUSE is the distro, since it's slow)
# Or print out the current shell version
if [ -x "$(command -v neofetch)" ]; then
	case $osrel in
		*suse* ) printf "╔═════════════════╤"
			printf "══════════════════════════════════╗\n"
			printf "║  ${bold}Current Shell${normal}  │"
			printf "${green}%32s${normal}  ║\n" $SHELL
			printf "╚═════════════════╧══════════════════════════════════╝\n";;
		* ) neofetch;;
esac
fi

# Fortune check install and run
if [ -x "$(command -v fortune)" ]; then
	fortune
fi

# Note: WSL does not currently apply umask properly; this line fixes that
if [ "$(umask)" = "000" ]; then
  umask 022
fi

