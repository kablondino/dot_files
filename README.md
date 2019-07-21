# dotfiles

This repository contains the configurations I use.
Read over the `Makefile` and use it.

1. `.bashrc` (unused for a long time)
2. `.zshrc`
	+ `.prompt.zsh`
3. `.tmux.conf` and `.tmux.conf.local` from [Oh My Tmux!](https://github.com/gpakosz/.tmux "gpakosz GitHub Repository")
5. `.Xdefaults`
7. `.dircolors` (requires 256 colors)
8. `i3.config`, the i3gaps fork

	+ $Mod + Ctrl + Esc:				Lock screen
	+ $Mod + Ctrl + Alt + Esc:	 		Suspend
	+ $Mod + Ctrl + Shift + Alt + Esc:	Hibernate

9. `termite/.config`; See an answer [here](https://askubuntu.com/questions/739163/how-to-install-termite) on how to install.

[Nerd Fonts](http://nerdfonts.com/) are used a lot for vim (see note below about vim) and the zsh prompt.
Alter the font in the `.Xdefaults` or `termite/.config` to avoid using them, depending on which terminal you use.


### VIM Files and Plugins
**NOTE!** Vim files have moved!
It has been moved to its own repository, partially because I dropped [Vundle](https://github.com/VundleVim/Vundle.vim).
Now, Vim 8's built-in functionality is used.
Look at [my other repository](https://github.com/kablondino/.vim) to implement it.

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

