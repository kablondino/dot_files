default: link-tmux link-dircolors link-termite link-Xdefaults zsh-shell

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
	@ln ./shell/.dircolors ~/.dircolors

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
	@ln ./shell/.zshrc ~/.zshrc
ifneq ($(wildcard ~/.prompt.zsh),)
	$(info Replacing previous .prompt.zsh)
	@rm ~/.prompt.zsh
else
	$(info Linking .prompt.zsh)
endif
	@ln ./shell/.prompt.zsh ~/.prompt.zsh
ifneq ($(wildcard ~/.common.rc.sh),)
	$(info Replacing previous .common.rc.sh)
	@rm ~/.common.rc.sh
else
	$(info Linking .common.rc.sh)
endif
	@ln ./shell/.common.rc.sh ~/.common.rc.sh
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
	@ln ./rofi/rofi.conf ~/.config/rofi/config

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

