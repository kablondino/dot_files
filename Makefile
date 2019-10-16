default: link-tmux link-dircolors link-termite zsh-shell

# =============================================================================

link-tmux:
	$(info Linking .tmux.conf)
	@ln -f ./.tmux/.tmux.conf ~/
	$(info Linking .tmux.conf.local)
	@ln -f ./tmux_old/.tmux.conf.local ~/

# =============================================================================

link-dircolors:
	$(info Linking .dircolors)
	@ln -f ./shell/.dircolors ~/.dircolors

# =============================================================================

zsh-shell:
	$(info Linking .zshrc)
	@ln -f ./shell/.zshrc ~/.zshrc
#	Check what the default shell is
	$(info Enter password to change the default shell to zsh.)
	@chsh -s $(command -v zsh)
	$(info ======================================)
	$(info Log out and back in to apply new shell)
	$(info ======================================)

# =============================================================================

link-termite:
	$(info Linking termite configuration file)
	@mkdir -p ~/.config/termite/
	@ln -f ./termite/config ~/.config/termite/config

# =============================================================================

link-i3:
	$(info Linking i3wm configuration file)
	@mkdir -p ~/.config/i3/
	@ln -f ./i3/i3.config ~/.config/i3/config
	$(info Linking .lock.sh)
	@ln -f ./.lock.sh ~/.lock.sh
	$(info Linking rofi.conf)
	@mkdir -p ~/.config/rofi/
	@ln -f ./rofi/rofi.conf ~/.config/rofi/config

# =============================================================================

link-qutebrowser:
	$(info Linking qutebrowser config.py)
	@mkdir -p ~/.config/qutebrowser/
	@ln -f ./qutebrowser/config.py ~/.config/qutebrowser/config.py

# =============================================================================

link-compton:
	$(info Linking compton.conf)
	@ln -f ./compton.conf ~/.config/compton.conf

# =============================================================================

link-sage:
	$(info Linking init.sage)
	@mkdir -p ~/.sage/
	@ln -f ./sage/init.sage ~/.sage/init.sage

# =============================================================================

