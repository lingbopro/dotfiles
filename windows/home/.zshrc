##### USER CONFIGS
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
fi

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


##### GENERATED

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### Configurations for zinit
if [[ "$-" != *c* ]]; then
## Plugins
# OMZ builtin plugins
OMZ_SNIPPET_MIRROR=1
zinit_snippet_omz() {
  if [[ "$OMZ_SNIPPET_MIRROR" ]]; then
    zinit snippet https://v4.gh-proxy.org/https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/$1
  else
    zinit snippet OMZ::$1
  fi
}
zinit_snippet_omz lib/completion.zsh
zinit_snippet_omz lib/history.zsh
zinit_snippet_omz lib/key-bindings.zsh
zinit_snippet_omz lib/theme-and-appearance.zsh
zinit_snippet_omz plugins/screen/screen.plugin.zsh
# zinit_snippet_omz plugins/npm/npm.plugin.zsh
zinit_snippet_omz plugins/nvm/nvm.plugin.zsh
zinit_snippet_omz plugins/yarn/yarn.plugin.zsh
# Other plugins
zinit light romkatv/zsh-defer
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
# zinit light zsh-users/zsh-syntax-highlighting
# zinit light zdharma-continuum/fast-syntax-highlighting
# zinit wait lucid for \
#  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
#     zdharma-continuum/fast-syntax-highlighting \
#  blockf \
#     zsh-users/zsh-completions \
#  atload"!_zsh_autosuggest_start" \
#     zsh-users/zsh-autosuggestions
zinit light djui/alias-tips

## Theme
# Powerlevel10k theme
zinit ice depth=1;
zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

fi

### End Configurations

