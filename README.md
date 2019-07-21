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

9. `termite/.config`; See an answer [here](https://askubuntu.com/questions/739163/how-to-install-termite) on how to install.

[Nerd Fonts](http://nerdfonts.com/) are used a lot for vim and the zsh prompt.
Alter the font in the `.Xdefaults` or `termite/.config` to avoid using them, depending on which terminal you use.


### VIM Files and Plugins
**NOTE!** Vim files are in the process of moving repositories, as Vundle will be dropped.
The repository will be different than this one, with more manual plugin management.
+ Color scheme
+ Syntax files
	+ TeX
	+ Python
+ [VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)
+ [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
+ [mgee/lightline-bufferline](https://github.com/mgee/lightline-bufferline)
+ [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
	+ Current configuration requires Nerd Fonts to show glyphs correctly for the 3 above plugins
+ [chrisbra/Colorizer](https://github.com/chrisbra/Colorizer)
+ [Konfekt/FastFold](https://github.com/Konfekt/FastFold)
+ [nelstrom/vim-markdown-folding](https://github.com/nelstrom/vim-markdown-folding)
+ [matze/vim-tex-fold](https://github.com/matze/vim-tex-fold)
+ [tmhedberg/SimpylFold](https://github.com/tmhedberg/SimpylFold)
+ [mboughaba/i3config.vim](https://github.com/mboughaba/i3config.vim)
+ [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)

### ZSH / BASH
+ Fortune
+ zsh-syntax-highlighting
+ A certain python3 application that can suggest corrected commands

### i3
+ Main terminal: Termite
+ rofi
+ bumblebee-status
+ xscreensaver
+ [light](https://github.com/haikarainen/light)
+ pactl
+ xfce4-power-manager
+ nm-applet

