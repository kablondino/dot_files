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
ifneq ($(wildcard ~/.zshrc),)
	$(info Replacing previous .zshrc)
	@rm ~/.zshrc
endif
	@ln ./.zshrc ~/.zshrc
ifneq ($(wildcard ~/.prompt.zsh),)
	$(info Replacing previous .prompt.zsh)
	@rm ~/.prompt.zsh
endif
	@ln ./.prompt.zsh ~/.prompt.zsh
ifneq ($(wildcard ~/.common.rc.sh),)
	$(info Replacing previous .common.rc.sh)
	@rm ~/.common.rc.sh
endif
	@ln ./.common.rc.sh ~/.common.rc.sh
ifneq ($(which $SHELL), $(which zsh))
	$(info Enter password to change the default shell to zsh.)
	@chsh -s `which zsh`
else
	$(info ZSH is already set to the default shell.)
endif

link-termite:
	mkdir -p ~/.config/termite/
	ln ./termite/config ~/.config/termite/config

link-i3:
	mkdir -p ~/.config/i3/
	ln ./i3/i3.config ~/.config/i3/config
	ln ./.lock.sh ~/.lock.sh

link-sage:
	mkdir -p ~/.sage/
	ln ./sage/init.sage ~/.sage/init.sage

