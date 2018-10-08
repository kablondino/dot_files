default: config-vim link-tmux link-dircolors link-urxvt zsh-shell

config-vim:
	mkdir -p ~/.vim/colors/ && mkdir -p ~/.vim/ftplugin/
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

link-Xdefaults:
	ln ./.Xdefaults ~/.Xdefaults
	xrdb ~/.Xdefaults
	echo "Restart the terminal"

zsh-shell:
	ln ./.zshrc ~/.zshrc
	chsh -s `which zsh`

link-termite:
	mkdir -p ~/.config/termite/
	ln ./termite/config ~/.config/termite/config

link-i3:
	mkdir -p ~/.config/i3/
	ln ./i3/i3.config ~/.config/i3/config

link-sage:
	mkdir -p ~/.sage/
	ln ./sage/init.sage ~/.sage/init.sage

