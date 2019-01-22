# This command does not properly work. It's meant to agnosticize this file.
#emulate -LR bash 2>/dev/null

# Default text editor
export EDITOR=$(which vim)
export VISUAL=$(which vim)

# Timeout for keyboard
export KEYTIMEOUT=1

# Set the TERM so that italics and color are available, even in TMUX
export TERM=xterm-256color

# ANACONDA
export PATH="/home/kabv/miniconda2/bin:$PATH"

## Aliases
alias ls='ls --color=auto'		# Always use color
alias ll='ls -lh'				# Human-readable for detailed list
alias la='ls -A'
alias sl='sl -e'
alias quit='exit'
alias tmux='tmux -2'
alias less='less -R'
alias mv='mv -i'				# Confirm move if overwriting

