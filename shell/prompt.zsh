# Set the prompt based on the OS
autoload -Uz promptinit
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
#zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %0.32b"

promptinit

# Set some variables for right side
local PR_USER PR_USER_OP PR_PROMPT MIDDLE_R_ENTRY PR_HOST

setopt PROMPT_SUBST

# Check for NerdFonts
if fc-list | grep -i "nerd" > /dev/null; then
	nerd_chars=("" "" "" "" "" "")
#	nerd_chars=("" "" "" "" "" "")
#	nerd_chars=("" "" "" "" "" "")
#	nerd_chars=("" "" "" "" "" "")
else
	nerd_chars=("" "" "" "" "" "")
fi

# Load gcloud's project prompt, if it's available
command -v gcloud > /dev/null && . ~/dot_files/shell/zsh-gcloud-prompt/gcloud.zsh

# Landscape colors
vim_cmd_mode="%B%F{015}%K{012}${nerd_chars[1]}%F{012}%K{015} N %k%F{015}${nerd_chars[3]}%b%k%f"
vim_ins_mode="%B%F{015}%K{022}${nerd_chars[1]}%F{022}%K{015} I %k%F{015}${nerd_chars[3]}%b%k%f"
vim_vis_mode="%B%F{057}%K{015}${nerd_chars[1]}%F{015}%K{057} V %k%F{015}${nerd_chars[3]}%b%k%f"

# Deus colors
vim_cmd_mode="%B%F{114}${nerd_chars[1]}%F{232}%K{114} N %k%F{114}${nerd_chars[3]}%b%f"
vim_ins_mode="%B%F{039}${nerd_chars[1]}%F{232}%K{039} I %k%F{039}${nerd_chars[3]}%b%f"
vim_vis_mode="%B%F{232}${nerd_chars[1]}%F{232}%K{170} V %k%F{170}${nerd_chars[3]}%b%f"


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
	PR_USER="%F{022}${nerd_chars[6]}%F{232}%K{022} %n "  # HOST corrects colors
	PR_USER_OP='%F{green}%#%f'
	PR_PROMPT='${vim_mode} '
else  # root
	PR_USER='%F{blue} %n %f '
	PR_USER_OP='%F{blue}%#%f'
	PR_PROMPT='${vim_mode} '
fi


# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then  # SSH
	MIDDLE_R_ENTRY="%F{036}%K{022}${nerd_chars[6]}%F{032}%K{036} "
	if [ -x "$(command -v gcloud)" ]; then  # Check for Google Cloud SDK
		MIDDLE_R_ENTRY="${MIDDLE_R_ENTRY}${ZSH_GCLOUD_PROMPT} "
	fi
	PR_HOST="%F{032}${nerd_chars[6]}%F{232}%K{032} %M %k%F{032}${nerd_chars[2]}%k%f"
else  # no SSH
	MIDDLE_R_ENTRY="%F{107}%K{022}${nerd_chars[6]}%F{232}%K{107} "
	if [ -x "$(command -v gcloud)" ]; then  # Check for Google Cloud SDK
		MIDDLE_R_ENTRY="${MIDDLE_R_ENTRY}${ZSH_GCLOUD_PROMPT} "
	fi
	PR_HOST="%F{148}${nerd_chars[6]}%F{232}%K{148} %M %k%F{148}${nerd_chars[2]}%k%f"
fi

local display_time="%F{204}${nerd_chars[1]}%F{232}%K{204}%*%B%F{204}%K{170}${nerd_chars[3]} %b%k%f"

# Directory expansion for showing only the last 2 directories, if too long
local current_dir='%(4~|%-1~/…/%2~|%3~)'
# Directory expansion for showing only set amount of characters in prompt
#local current_dir="%50<…<%~%<<"

# Version control colorized
local formatted_vcs_info="%F{232}%K{170}\${vcs_info_msg_0_}%B%F{170}%K{097}${nerd_chars[3]}%b%k%f"

local formatted_current_dir="%B%F{232}%K{097} ${current_dir}%k%F{097}${nerd_chars[3]}%b%k%f"

# aka exit code, U+F112
local return_code="%(?..%F{088}${nerd_chars[6]}%F{232}%K{088} %? %{[00;38;5;088m%}${nerd_chars[2]}%k%f)"
local user_host="${PR_USER}${MIDDLE_R_ENTRY}${PR_HOST}"

# TWO LINE PROMPT
PROMPT="${display_time}${formatted_vcs_info}${formatted_current_dir}
$PR_PROMPT"
RPROMPT="${return_code}${user_host}"

