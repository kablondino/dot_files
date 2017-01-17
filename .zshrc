# HOW TO RUN ZSH SETUP AGAIN!
#	autoload -Uz zsh-newuser-install
#	zsh-newuser-install -f

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kabv/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Default text editor
export EDITOR=$(which vim)
export VISUAL=$(which vim)

# Prompt customization
autoload -Uz promptinit
promptinit
PROMPT='%F{6}%* %B%F{1}%n%F{5}∈%F{3}%m %b%1~/ %B%F{2}▶%f%b '
RPROMPT='%F{2}⎛%!⎠'
# Extra symbols
# ∂ %F{3}ℤ∫ℍ

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias sl='sl -e'
alias tmux='tmux -2'

# Directory and file colors
test -r .dircolors && eval "$(dircolors .dircolors)"

neofetch
echo -n "Current Shell: "; echo -n "ZSH "; echo $ZSH_VERSION
