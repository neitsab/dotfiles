# Source shell-agnostic environment variables from common file;
# fallback with the few defined ones:
if [ -f ~/.env ]; then
    source $HOME/.env
  # else
#    export PATH=~/PC/bin:$PATH
#    export EDITOR=micro
#    export GOPATH=~/.go
#    export KEYBASE_SYSTEMD=1
fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"
