# Variables for making vim
dot_vim_colors := $(wildcard ./vim/colors/*.vim)
dot_vim_ftplugin := $(wildcard ./vim/ftplugin/*.vim)
vim_colors_name := $(notdir $(dot_vim_colors))
vim_ftplugin_name := $(notdir $(dot_vim_ftplugin))
home_vim_colors := $(addprefix ~/.vim/colors/, $(vim_colors_name))
home_vim_ftplugin := $(addprefix ~/.vim/ftplugin/, $(notdir $(dot_vim_ftplugin)))


default: config-vim link-tmux link-dircolors link-termite link-Xdefaults zsh-shell

# =============================================================================

make_vim_dirs:
	$(info Making vim directories)
	@mkdir -p ~/.vim/colors/
	@mkdir -p ~/.vim/ftplugin/

# Targets for properly linking the files
# Check and link colors
~/.vim/colors/%.vim: ./vim/colors/%.vim
ifeq ($(home_vim_colors), $(wildcard (home_vim_colors)))
	$(info Replacing previous vim color files in ~/.vim/colors/)
	@rm -f $(home_vim_colors)
else
	$(info Linking all vim color files into ~/.vim/colors/)
endif
	@ln $< $(dir $@)

# Check and link ftplugin
~/.vim/ftplugin/%.vim: ./vim/ftplugin/%.vim
ifeq ($(home_vim_ftplugin), $(wildcard (home_vim_ftplugin)))
	$(info Replacing previous vim ftplugin files in ~/.vim/ftplugin/)
	@rm -f $(home_vim_ftplugin)
else
	$(info Linking all vim ftplugin files into ~/.vim/ftplugin/)
endif
	@ln $< $(dir $@)

config-vim:
ifneq ($(wildcard ~/.vimrc),)
	$(info Replacing .vimrc)
	@rm ~/.vimrc
else
	$(info Linking .vimrc)
endif
	@ln ./.vimrc ~/.vimrc

# Install Vundle
ifeq ($(wildcard ~/.vim/bundle/Vundle.vim),)
	$(info Installing Vundle)
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

	$(info Installing all plugins specified in .vimrc)
	@vim +PluginInstall +qall

# =============================================================================

link-tmux:
ifneq ($(wildcard ~/.tmux.conf),)
	$(info Replacing previous .tmux.conf)
	@rm ~/.tmux.conf
else
	$(info Linking .tmux.conf)
endif
	@ln ./tmux/.tmux.conf ~/
ifneq ($(wildcard ~/.tmux.conf.local),)
	$(info Replacing previous .tmux.conf.local)
	@rm ~/.tmux.conf.local
else
	$(info Linking .tmux.conf.local)
endif
	@ln ./tmux/.tmux.conf.local ~/

# =============================================================================

link-dircolors:
ifneq ($(wildcard ~/.dircolors),)
	$(info Replacing previous .dircolors)
	@rm ~/.dircolors
else
	$(info Linking .dircolors)
endif
	@ln ./.dircolors ~/.dircolors

# =============================================================================

link-Xdefaults:
ifneq ($(wildcard ~/.Xdefaults),)
	$(info Replacing previous .Xdefaults file)
	@rm ~/.Xdefaults
else
	$(info Linking .Xdefaults file)
endif
	@ln ./.Xdefaults ~/.Xdefaults
	$(info Reloading X server utility services.)
	@xrdb ~/.Xdefaults

# =============================================================================

zsh-shell:
ifneq ($(wildcard ~/.zshrc),)
	$(info Replacing previous .zshrc)
	@rm ~/.zshrc
else
	$(info Linking .zshrc)
endif
	@ln ./.zshrc ~/.zshrc
ifneq ($(wildcard ~/.prompt.zsh),)
	$(info Replacing previous .prompt.zsh)
	@rm ~/.prompt.zsh
else
	$(info Linking .prompt.zsh)
endif
	@ln ./.prompt.zsh ~/.prompt.zsh
ifneq ($(wildcard ~/.common.rc.sh),)
	$(info Replacing previous .common.rc.sh)
	@rm ~/.common.rc.sh
else
	$(info Linking .common.rc.sh)
endif
	@ln ./.common.rc.sh ~/.common.rc.sh
#	Check what the default shell is
ifeq ($(which $SHELL), $(which zsh))
	$(info ZSH is already set to the default shell.)
else
	$(info Enter password to change the default shell to zsh.)
	@chsh -s `which zsh`
endif
	$(info =====================================)
	$(info   Source the new .zshrc to apply it)
	$(info =====================================)

# =============================================================================

link-termite:
	@mkdir -p ~/.config/termite/
ifneq ($(wildcard ~/.config/termite/config),)
	$(info Replacing previous termite configuration file)
	@rm ~/.config/termite/config
else
	$(info Linking termite configuration file)
endif
	@ln ./termite/config ~/.config/termite/config

# =============================================================================

link-i3:
	@mkdir -p ~/.config/i3/
ifneq ($(wildcard ~/.config/i3/config),)
	$(info Replacing previous i3wm configuration file)
	@rm ~/.config/i3/config
else
	$(info Linking i3wm configuration file)
endif
	@ln ./i3/i3.config ~/.config/i3/config
ifneq ($(wildcard ~/.lock.sh),)
	$(info Replacing previous .lock.sh)
	@rm ~/.lock.sh
else
	$(info Linking .lock.sh)
endif
	@ln ./.lock.sh ~/.lock.sh
	@mkdir -p ~/.config/rofi/
ifneq ($(wildcard ~/.config/rofi/config),)
	$(info Replacing previous rofi configuration file)
	@rm ~/.config/rofi/config
else
	$(info Linking rofi.conf)
endif
	@ln ./rofi.conf ~/.config/rofi/config

# =============================================================================

link-qutebrowser:
	@mkdir -p ~/.config/qutebrowser/
ifneq ($(wildcard ~/.config/qutebrowser/config.py),)
	$(info Replacing previous qutebrowser config.py)
	@rm ~/.config/qutebrowser/config.py
else
	$(info Linking qutebrowser config.py)
endif
	@ln ./qutebrowser/config.py ~/.config/qutebrowser/config.py

# =============================================================================

link-compton:
ifneq (,)
	$(info Replacing previous compton.conf)
	@rm ~/.config/compton.conf
else
	$(info Linking compton.conf)
endif
	@ln ./compton.conf ~/.config/compton.conf

# =============================================================================

link-sage:
	@mkdir -p ~/.sage/
ifneq ($(wildcard ~/.sage/init.sage),)
	$(info Replacing previous init.sage)
	@rm ~/.sage/init.sage
else
	$(info Linking init.sage)
endif
	@ln ./sage/init.sage ~/.sage/init.sage

# =============================================================================

.PHONY: config-vim
config-vim: make_vim_dirs $(home_vim_colors) $(home_vim_ftplugin)

