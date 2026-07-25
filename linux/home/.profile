
# The accessibility service may cause GTKWebKit to crash, so we disable it
export NO_AT_BRIDGE=1


# go
export PATH="$PATH:$(go env GOPATH)/bin"

# pnpm
export PNPM_HOME="/home/lingbopro/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# Added by Toolbox App
export PATH="$PATH:/home/lingbopro/.local/share/JetBrains/Toolbox/scripts"

