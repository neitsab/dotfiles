# Source shell-agnostic environment variables from common file;
# fallback with the few defined ones:
if [ -f ~/.env ]; then
    source $HOME/.env
  else
    export PATH=~/PC/bin:$PATH
    export EDITOR=micro
    #export AURDEST=
    export KEYBASE_SYSTEMD=1
fi
