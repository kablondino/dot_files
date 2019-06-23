# This command does not properly work. It's meant to agnosticize this file.
#emulate -LR bash 2>/dev/null

# Default text editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Timeout for keyboard
export KEYTIMEOUT=1

# Set the TERM so that italics and color are available, even in TMUX
export TERM=xterm-256color

export LESS="-M -I -R"

# Add conda path (DEPRICATED). Conda has claimed to have updated to not require this.
#export PATH="$HOME/miniconda2/bin:$HOME/miniconda3/bin:$PATH"

# Uses this one instead
if [ -s "$HOME/miniconda3/etc/profile.d/conda.sh" ] ||
	[ -s "$HOME/miniconda2/etc/profile.d/conda.sh" ]; then
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


## FUNCTIONS and procedures!
# Alias to cd and list files at once
function cs () {
	cd "$@" && ls
}

# print a separator banner as wide as the terminal
function hr {
	k=0
	while [ $k -lt $COLUMNS ]; do
		echo -ne "="
		k=$((k + 1))
	done
}

# display a list of supported colors
function lscolors {
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

# Run matlab script (no JVM)
function matlab_run () {
	matlab -nodesktop -nosplash -nojvm -r "run('$@'); exit;" | tail -n +11
}

# Timer
function timer () {
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

# thefuck alias
if [ -x "$(command -v thefuck)" ]; then
	eval $(thefuck --alias)
fi

# Fortune check install and run
if [ -x "$(command -v fortune)" ]; then
	fortune
fi

