# Bash Profile

# Environment
export LANG='zh-CN.utf-8'

export GPG_TTY=$(tty)

# Alias
alias debian='proot-distro login debian'
alias cpnpm='pnpm --registry=https://registry.npmmirror.com'

# Startup Programs
sshd

# pnpm
export PNPM_HOME="/data/data/com.termux/files/home/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
