default: link-git link-tmux link-dircolors zsh-shell link-fastfetch

# ============================================================================

link-git:
	$(info Linking .gitconfig)
	@ln -f ./.gitconfig ~/

# =============================================================================

link-tmux:
	$(info Linking .tmux.conf)
	@ln -f ./.tmux/.tmux.conf ~/
	$(info Linking .tmux.conf.local)
	@ln -f ./my_tmux/.tmux.conf.local ~/

# =============================================================================

link-dircolors:
	$(info Linking .dircolors)
	@ln -f ./shell/.dircolors ~/.dircolors

# =============================================================================

link-fastfetch:
	$(info Linking fastfetch)
	@mkdir -p ~/.config/fastfetch
	@ln -f ./shell/fastfetch_config.jsonc ~/.config/fastfetch/config.jsonc

# =============================================================================

zsh-shell:
	$(info Linking .zshrc)
	@ln -f ./shell/.zshrc ~/.zshrc
	$(info run chsh -s $(command -v zsh) to make zsh the default shell.)

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

