# This command does not properly work. It's meant to agnosticize this file.
#emulate -LR bash 2>/dev/null

# Default text editor
export EDITOR=$(which vim)
export VISUAL=$(which vim)

# Timeout for keyboard
export KEYTIMEOUT=1

# Set the TERM so that italics and color are available, even in TMUX
export TERM=xterm-256color

# Add conda path (DEPRICATED). Conda has claimed to have updated to not require this.
#export PATH="$HOME/miniconda2/bin:$HOME/miniconda3/bin:$PATH"

# Uses this one instead
if [ -s $HOME/miniconda3/etc/profile.d/conda.sh ] ||
	[ -s $HOME/miniconda2/etc/profile.d/conda.sh ]; then
	. $HOME/miniconda3/etc/profile.d/conda.sh
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

