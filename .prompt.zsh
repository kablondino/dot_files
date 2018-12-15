# Set the prompt based on the OS
autoload -Uz promptinit
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:git:*' actionformats "%s  %r/%S %b %m%u%c "

promptinit

# Set some variables for right side
local PR_USER PR_USER_OP PR_PROMPT PR_HOST

setopt PROMPT_SUBST

# Check for Ubuntu release for prompt (ChromeOS)
os_var=`cat /etc/os-release | head -1 | sed 's/\"//g' | sed 's/NAME=//'`
if [[ "$os_var" = "Ubuntu" ]]; then
	# Check the UID
	if [[ $UID -ne 0 ]]; then # normal user
		PR_USER="%{[00;38;5;000;48;5;022m%} %n "	# HOST corrects colors
		PR_USER_OP='%F{green}%#%f'
		PR_PROMPT='${vim_mode} '
	else # root
		PR_USER='%F{blue} %n %f '
		PR_USER_OP='%F{blue}%#%f'
		PR_PROMPT='${vim_mode} '
	fi

	# Check if we are on SSH or not
	if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
		PR_HOST="%{[00;38;5;032;48;5;036m%}%M %k%f" # SSH
	else
		PR_HOST="%{[00;38;5;000;48;5;148m%} %M %k%f" # no SSH
	fi

	local display_time="%{[00;38;5;000;48;5;204m%} %* %k%f"

	# Directory expansion for showing only the last 2 directories, if too long
	local current_dir="%(4~|%-1~/…/%2~|%3~)"
	local formatted_current_dir=" %{[01;38;5;232;48;5;097m%} ${current_dir} %k%f "

	local return_code="%(?..%{[00;38;5;000;48;5;088m%} %? %k%f)"
	local user_host="${PR_USER}${PR_HOST}"

	PROMPT="${display_time}${formatted_current_dir}"
	#╰─
	RPROMPT="${return_code}${user_host}"

else  # Not Ubuntu
	# Powerline colors
	#vim_cmd_mode="%{[01;38;5;022;48;5;148m%} NORMAL %{[00;38;5;148m%}%k%f"
	#vim_ins_mode="%{[01;38;5;031;48;5;015m%} INSERT %{[00;38;5;015m%}%k%f"
	#vim_vis_mode="%{[01;38;5;088;48;5;208m%} VISUAL %{[00;38;5;208m%}%k%f"

	# Landscape colors
	vim_cmd_mode="%{[01;38;5;015;48;012m%}%{[01;38;5;012;48;5;015m%} NORMAL %k%{[00;38;5;015m%}%k%f"
	vim_ins_mode="%{[00;38;5;015;48;022m%}%{[01;38;5;022;48;5;015m%} INSERT %k%{[00;38;5;015m%}%k%f"
	vim_vis_mode="%{[01;38;5;057;48;5;015m%} VISUAL %k%{[00;38;5;015m%}%k%f"

	# Deus colors
	vim_cmd_mode="%{[00;38;5;114m%}%{[01;38;5;000;48;5;114m%} NORMAL %k%{[00;38;5;114m%}%k%f"
	vim_ins_mode="%{[00;38;5;039m%}%{[01;38;5;000;48;5;039m%} INSERT %k%{[00;38;5;039m%}%k%f"
	vim_vis_mode="%{[01;38;5;000;48;5;170m%} VISUAL %k%{[00;38;5;170m%}%k%f"


	vim_mode=$vim_ins_mode

	function zle-keymap-select {
		vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
		zle reset-prompt
	}
	zle -N zle-keymap-select

	function zle-line-finish {
		vim_mode=${vim_ins_mode}
	}
	zle -N zle-line-finish

	# Check the UID
	if [[ $UID -ne 0 ]]; then # normal user
		PR_USER="%{[00;38;5;022m%}%{[00;38;5;000;48;5;022m%} %n "	# HOST corrects colors
		PR_USER_OP='%F{green}%#%f'
		PR_PROMPT='${vim_mode} '
	else # root
		PR_USER='%F{blue} %n %f '
		PR_USER_OP='%F{blue}%#%f'
		PR_PROMPT='${vim_mode} '
	fi

	# Check if we are on SSH or not
	if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
		PR_HOST="%{[00;38;5;036;48;5;022m%}%{[00;38;5;032;48;5;036m%} %{[00;38;5;000;48;5;032m%} %M %k%{[00;38;5;032m%}%k%f" # SSH
	else
		PR_HOST="%{[00;38;5;107;48;5;022m%}%{[00;38;5;148;48;5;107m%} %{[00;38;5;000;48;5;148m%} %M %k%{[00;38;5;148m%}%k%f" # no SSH
	fi

	local display_time="%{[00;38;5;204m%}%{[00;38;5;000;48;5;204m%}%*%{[00;38;5;204;48;5;170m%} %k%f"

	# Directory expansion for showing only the last 2 directories, if too long
	local current_dir="%(4~|%-1~/…/%2~|%3~)"
	# Directory expansion for showing only set amount of characters in prompt
	#local current_dir="%50<…<%~%<<"

	local formatted_current_dir="%{[01;38;5;000;48;5;097m%} ${current_dir}%k%f%{[01;38;5;097m%}%k%f"

	local return_code="%(?..%{[00;38;5;088m%}%{[00;38;5;000;48;5;088m%} %? %{[00;38;5;088;48;5;000m%}%k%f)"	# U+F112
	local user_host="${PR_USER}${PR_HOST}"

	# TWO LINE PROMPT
	PROMPT="${display_time}%{[01;38;5;170;48;5;097m%}${formatted_current_dir}
$PR_PROMPT"
	#╰─
	RPROMPT="${return_code}${user_host}"
fi
