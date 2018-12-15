# dotfiles

This repository contains the configurations I use.
Read over the `Makefile` and use it.

1. `.bashrc` (unused for a long time)
2. `.zshrc`
	+ `.prompt.zsh`
3. `.tmux.conf` and `.tmux.conf.local` from [Oh My Tmux!](https://github.com/gpakosz/.tmux "gpakosz GitHub Repository")
4. `.vimrc`
5. `.Xdefaults`
6. `swagdino.vim`, color scheme and language-specific files
7. `.dircolors` (requires 256 colors)
8. `i3.config`, the i3gaps fork

	+ $Mod + Ctrl + Esc:				Lock screen
	+ $Mod + Ctrl + Alt + Esc:	 		Suspend
	+ $Mod + Ctrl + Shift + Alt + Esc:	Hibernate

9. `termite/.config`; See the answer [here](https://askubuntu.com/questions/739163/how-to-install-termite) on how to install.

[Nerd Fonts](http://nerdfonts.com/) are used a lot for vim and the zsh prompt.
Alter the font in the `.Xdefaults` to avoid using them.


### VIM Plugins Used
+ [VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)
+ [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
+ [mgee/lightline-bufferline](https://github.com/mgee/lightline-bufferline)
+ [chrisbra/Colorizer](https://github.com/chrisbra/Colorizer) (alternate is being investigated)
+ [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons) (requires Nerd Fonts)
+ [Konfekt/FastFold](https://github.com/Konfekt/FastFold)
+ [nelstrom/vim-markdown-folding](https://github.com/nelstrom/vim-markdown-folding)
+ [matze/vim-tex-fold](https://github.com/matze/vim-tex-fold)
+ [tmhedberg/SimpylFold](https://github.com/tmhedberg/SimpylFold)
+ [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)

Inspect the top of `.vimrc` for the complete current list.

### ZSH / BASH
+ Fortune
+ zsh-syntax-highlighting

### i3
+ Termite
+ rofi
+ bumblebee-status
+ xscreensaver
+ [light](https://github.com/haikarainen/light)
+ pactl
+ xfce4-power-manager
+ nm-applet

