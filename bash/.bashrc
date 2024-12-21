# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set prompt (user@host working dir)
PS1='[\u@\h \W]\$ '

# Enable forward search by disabling flow control (http://stackoverflow.com/a/791800)
[[ $- == *i* ]] && stty -ixon

# pkgfile "command not found" hook
if command -v pkgfile &>/dev/null; then source /usr/share/doc/pkgfile/command-not-found.bash; fi

# Source shell-agnostic environment variables from common file;
# fallback with the few defined ones
if [ -f ~/.env ]; then
    . ~/.env
  else
    export PATH=~/PC/bin:$PATH
    export EDITOR=micro
    #export AURDEST=
    export KEYBASE_SYSTEMD=1
fi

# Source shell-agnostic aliases from common file:
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

## Bash-only aliases & functions ##
