# dotfiles

This repository contains the configurations I use.
Read over the `Makefile` and use it.

1. `.bashrc` (unused for a long time)
2. `.zshrc`
	+ `.prompt.zsh`
	+ `.common.rc.sh`
3. `.tmux.conf` and `.tmux.conf.local` from [Oh My Tmux!](https://github.com/gpakosz/.tmux "gpakosz GitHub Repository")
4. `.Xdefaults`, only for the urxvt terminal
5. `.dircolors` (requires 256 colors)
6. `i3.config`, the i3gaps fork

	+ $Mod + Ctrl + Esc:				Lock screen
	+ $Mod + Ctrl + Alt + Esc:	 		Suspend
	+ $Mod + Ctrl + Shift + Alt + Esc:	Hibernate

7. `termite/.config`; Installation of this terminal varies very widely between distributions.


## "Required" Software
[Nerd Fonts](http://nerdfonts.com/) are used a lot for vim (see note below about vim) and the zsh prompt.
Alter the font choice in the `.Xdefaults` or `termite/.config`, depending on which terminal you use.

### ZSH / BASH
+ Fortune
+ zsh-syntax-highlighting
+ A certain python3 application that can suggest corrected commands

### i3
+ Main terminal: Termite
+ rofi
+ bumblebee-status
+ i3ipc
+ redshift (with gtk)
+ [light](https://github.com/haikarainen/light)
+ pactl
+ xfce4-power-manager
+ nm-applet

### VIM Files and Plugins
**NOTE!** Vim files have moved!
It has been moved to its own repository, partially because I dropped [Vundle](https://github.com/VundleVim/Vundle.vim).
Now, Vim 8's built-in functionality is used.
Look at [my other repository](https://github.com/kablondino/.vim) to implement it.

