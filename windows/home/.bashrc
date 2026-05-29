# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.3-3

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# Environments
export Cygwin_path=$(cygpath -up "$Cygwin_path")
export PATH=$Cygwin_path:$PATH

export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_CTYPE=
export LC_NUMERIC=zh_CN
export LC_TIME=zh_CN
export LC_COLLATE="zh_CN.UTF-8"
export LC_MONETARY=zh_CN
export LC_MESSAGES=
export LC_PAPER=zh_CN
export LC_NAME=zh_CN
export LC_ADDRESS=zh_CN
export LC_TELEPHONE=zh_CN
export LC_MEASUREMENT=zh_CN
export LC_IDENTIFICATION=zh_CN
export LC_ALL=

__shim_cmd_func()
{
	if [[ $# == 0 ]] || [[ $* == -*h* ]]; then
		echo "Usage:"
		echo "  shim_cmd [TARGET] [SHIM_NAME] [OPTIONS]"
		echo "Make a shim for target executable in /usr/local/bin/shim"
		echo "Shim file will be named as [SHIM_NAME].exe"
		echo "Internally called shim_exec, run \`shim_exec -h\` for its help"
		echo "[OPTIONS] will directly passed to shim_exec"
		echo "  (except -h will open help of shim_cmd)"
		return
	fi
	shim_exec "$1" "C:\\cygwin64\\usr\\local\\bin\\shim\\$2.exe" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
}
alias shim_cmd='__shim_cmd_func'

# If not running interactively, don't do anything
# [[ "$-" != *i* ]] && return

if [[ "$-" == *i* ]];then

if [[ "$PWD" == "/cygdrive/c/Windows/system32" ]];then
	cd ~
fi

# HOME="$(cygpath -au "$USERPROFILE")"
# PWD="$HOME"
# cd "$HOME"

alias ls='ls --color=auto'
alias shizuku='adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh'

# Alias about Termux ssh
alias setup-termux-ssh='adb forward tcp:8021 tcp:8022'
alias connect-termux-ssh='ssh -X -p 8021 u0_a379@localhost'
alias termux-ssh='setup-termux-ssh; connect-termux-ssh'
alias termux-ssh-remote='ssh -X -p 8022 u0_a379@192.168.1.21'
alias termux-vnc='adb forward tcp:5902 tcp:5903'

# Some Things:)
SHOW_SUS_HELLO_PROMPT=
if [[ "$SHOW_SUS_HELLO_PROMPT" ]] && [[ "$-" != *c* ]];then
	echo -e "\033[0;1;32m$(bash --version | head -n 1)"
	echo -e "\033[0;1;33m欢迎使用 \033[0;1;32mCygwin Bash \033[0;1;33m喵~"
	echo -e "\033[0;1;34m进程ID是 \033[0;1;35m$$"
	echo -e "\033[0;1;33m现在正在 \033[0;1;30m$(pwd) \033[0;1;33m目录中 \033[0;1;31m:)"
	echo -e "\033[0;1;32m输入 \`\033[0;1;36mhelp\033[0;1;32m\` 以获取帮助"
	echo -e "\033[1;5;33mHello World!\033[0m"
fi


# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Programmable completion enhancements are enabled via
# /etc/profile.d/bash_completion.sh when the package bash_completetion
# is installed.  Any completions you add in ~/.bash_completion are
# sourced last.

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Default to human readable figures
alias df='df -h'
alias du='du -h'
# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
settitle ()
{
  echo -ne "\e]2;$@\a\e]1;$@\a";
}
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func

fi

# VSCode shell Integration
if [[ "$TERM_PROGRAM" == "vscode" ]];then
	INTEGRATION_PATH='c:\Program Files\Microsoft VS Code\resources\app\out\vs\workbench\contrib\terminal\common\scripts\shellIntegration-bash.sh'
	if [[ -f "$INTEGRATION_PATH" ]];then
		. "$INTEGRATION_PATH"
	else
		. "$(code --locate-shell-integration-path bash)"
	fi
	# copilot-debug
	if which copilot-debug.bat >/dev/null 2>&1;then
		alias copilot-debug='copilot-debug.bat'
	fi
fi

# eval "$(vfox activate bash)"
