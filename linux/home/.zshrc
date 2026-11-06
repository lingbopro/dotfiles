# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.profile

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# source /usr/share/zsh/plugins/pnpm-shell-completion/pnpm-shell-completion.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


source /usr/share/doc/pkgfile/command-not-found.zsh

help() {
  if [[ "$@" ]]; then
    bash -c "help $@"
  else
    bash -c "help"
  fi
}


# pnpm
export PNPM_HOME="/home/lingbopro/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
