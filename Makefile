default: config-vim link-tmux link-dircolors link-urxvt zsh-shell

config-vim:
	mkdir -p ~/.vim/colors && mkdir -p ~/.vim/ftplugin
	ln ./vim/colors/* ~/.vim/colors/
	ln ./vim/ftplugin/* ~/.vim/ftplugin/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln ./.vimrc ~/.vimrc
	vim +PluginInstall +qall

link-tmux:
	ln ./tmux/.tmux.conf ~/
	ln ./tmux/.tmux.conf.local ~/

link-dircolors:
	ln ./.dircolors ~/.dircolors

link-urxvt:
	ln ./.Xdefaults ~/.Xdefaults
	xrdb ~/.Xdefaults
	echo "Restart urxvt terminal"

zsh-shell:
	ln ./.zshrc ~/.zshrc
	chsh -s `which zsh`

link-termite:
	ln ./termite/config ~/.config/termite/config

