# Set the prompt based on the OS
autoload -Uz promptinit
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
#zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %b"

promptinit

# Set some variables for right side
local PR_USER PR_USER_OP PR_PROMPT PR_HOST

setopt PROMPT_SUBST

# Check for distro release
os_var=`cat /etc/os-release | head -1 | sed 's/\"//g' | sed 's/NAME=//'`

if [[ "$os_var" == "Ubuntu" ]]; then
	# Check the UID
	if [[ $UID -ne 0 ]]; then  # normal user
		PR_USER="%F{232}%K{022} %n "  # HOST corrects colors
		PR_USER_OP='%F{green}%#%f'
		PR_PROMPT='${vim_mode} '
	else # root
		PR_USER='%F{blue} %n %f '
		PR_USER_OP='%F{blue}%#%f'
		PR_PROMPT='${vim_mode} '
	fi

	# Check if we are on SSH or not
	if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
		PR_HOST="%F{032}%K{036}%M %k%f"  # SSH
	else
		PR_HOST="%F{232}%K{148} %M %k%f"  # no SSH
	fi

	local display_time="%F{232}%K{204} %* %k%f"

	# Version control colorized
	local formatted_vcs_info="%F{232}%K{170}\${vcs_info_msg_0_} %k%f"

	# Directory expansion for showing only the last 2 directories, if too long
	local current_dir="%(4~|%-1~/…/%2~|%3~)"
	local formatted_current_dir=" %B%F{232}%K{097} ${current_dir} %b%k%f "

	# aka exit code
	local return_code="%(?..%F{232}%K{088} %? %k%f)"
	local user_host="${PR_USER}${PR_HOST}"

	PROMPT="${display_time}${formatted_vcs_info}${formatted_current_dir}"
	RPROMPT="${return_code}${user_host}"

else  # Not Ubuntu
	# Powerline colors
	#vim_cmd_mode="%{[01;38;5;022;48;5;148m%} NORMAL %{[00;38;5;148m%}%k%f"
	#vim_ins_mode="%{[01;38;5;031;48;5;015m%} INSERT %{[00;38;5;015m%}%k%f"
	#vim_vis_mode="%{[01;38;5;088;48;5;208m%} VISUAL %{[00;38;5;208m%}%k%f"

	# Landscape colors
	vim_cmd_mode="%B%F{015}%K{012}%F{012}%K{015} NORMAL %k%F{015}%b%k%f"
	vim_ins_mode="%F{015}%K{022}%B%F{022}%K{015} INSERT %k%F{015}%b%k%f"
	vim_vis_mode="%B%F{057}%K{015} VISUAL %k%F{015}%b%k%f"

	# Deus colors
	vim_cmd_mode="%F{114}%B%F{232}%K{114} NORMAL %k%F{114}%b%f"
	vim_ins_mode="%F{039}%B%F{232}%K{039} INSERT %k%F{039}%b%f"
	vim_vis_mode="%B%F{232}%K{170} VISUAL %k%F{170}%b%f"


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
	if [[ $UID -ne 0 ]]; then  # normal user
		PR_USER="%F{022}%{[00;38;5;232;48;5;022m%} %n "  # HOST corrects colors
		PR_USER_OP='%F{green}%#%f'
		PR_PROMPT='${vim_mode} '
	else  # root
		PR_USER='%F{blue} %n %f '
		PR_USER_OP='%F{blue}%#%f'
		PR_PROMPT='${vim_mode} '
	fi

	# Check if we are on SSH or not
	if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
		PR_HOST="%F{036}%K{022}%F{032}%K{036} %F{232}%K{032} %M %k%F{032}%k%f"  # SSH
	else
		PR_HOST="%F{107}%K{022}%F{148}%K{107} %F{232}%K{148} %M %k%F{148}%k%f"  # no SSH
	fi

	local display_time="%F{204}%F{232}%K{204}%*%B%F{204}%K{170} %b%k%f"

	# Directory expansion for showing only the last 2 directories, if too long
	local current_dir='%(4~|%-1~/…/%2~|%3~)'
	# Directory expansion for showing only set amount of characters in prompt
	#local current_dir="%50<…<%~%<<"

	# Version control colorized
	local formatted_vcs_info="%F{232}%K{170}\${vcs_info_msg_0_}%B%F{170}%K{097}%b%k%f"

	local formatted_current_dir="%B%F{232}%K{097} ${current_dir}%k%F{097}%b%k%f"

	# aka exit code
	local return_code="%(?..%F{088}%F{232}%K{088} %? %{[00;38;5;088m%}%k%f)"  # U+F112
	local user_host="${PR_USER}${PR_HOST}"

	# TWO LINE PROMPT
	PROMPT="${display_time}${formatted_vcs_info}${formatted_current_dir}
$PR_PROMPT"
	RPROMPT="${return_code}${user_host}"
fi
