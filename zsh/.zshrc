# Movement settings
# https://unix.stackexchange.com/a/537182
# https://unix.stackexchange.com/a/48589
# https://stackoverflow.com/a/71848062
# https://web.cs.elte.hu/local/texinfo/zsh/zsh_27.html

# Set global Bash-style movement: Ctrl+arrow & Alt+backspace stops at every non-alphanum character
autoload -U select-word-style
select-word-style bash
# But override Alt+arrow bindings to make large blank-defined jumps
bindkey $'\E[1;3D' vi-backward-blank-word
bindkey $'\E[1;3C' vi-forward-blank-word
# And Ctrl+backspace delete up to previous slash
''backward-delete-word() WORDCHARS=$WORDCHARS:s:/: zle .$WIDGET
zle -N backward-delete-word
bindkey '^H' backward-delete-word
# not needed in the current scenario
#zstyle ':zle:forward-word' word-style space
# WORDCHARS='~!#$%^&*(){}[]<>?.+;-'

## Change a few grml config options:
# capitalization and underscore don't matter in options, see
# https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/

# - make * also match dotfiles
# - do not replace wildcard with all matches but for menu like for usual tab completion
# - try to correct the spelling of all arguments in a line
setopt GLOB_DOTS GLOB_COMPLETE CORRECT_ALL

# not only forward slash should be considered a word separator!!
#unfunction slash-backward-kill-word
function slash-backward-kill-word () {
#    local WORDCHARS="${WORDCHARS:s@/@}"
    # zle backward-word
    zle backward-kill-word
}
zle -N slash-backward-kill-word

# history settings
# see https://www.soberkoder.com/better-zsh-history/
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
# setopt | grep hist

# increase saved history *in the hist file* (session hist remains at 5000 for memory efficiency)
export SAVEHIST=1000000
# try to use something different than Unix epoch in hist file
# (not sure this applies to zsh: https://unix.stackexchange.com/a/103407)
export HISTTIMEFORMAT="[%F %T] "

# grml-zsh-config already sets share_history and extended_history; 
# DO NOT SET INC_APPEND_HISTORY WHEN USING SHARE_HISTORY!! https://unix.stackexchange.com/a/651538

# do not ignore commands starting with a space: more often than not it is just a typo
# and then I search for it in vain...
unsetopt HIST_IGNORE_SPACE

# skip duplicates when searching history (but still write them to file)
# and remove superfluous blanks from each command line being added to the history list
setopt HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS

## Autocomplete: command prediction from history
is4 && zrcautoload predict-on && \
zle -N predict-on         && \
zle -N predict-off        && \
bindkey "^X^Z" predict-on && \
bindkey "^Z" predict-off

## syntax highlighting
# https://wiki.archlinux.org/index.php/Zsh#Fish-like_syntax_highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Source shell-agnostic aliases from common file (https://askubuntu.com/a/195357)
if [ -e $HOME/.aliases ]; then source $HOME/.aliases; fi

## For env var --> see .zshenv

## Zsh-only functions

function compress { tar -I zstd -cf "$1.tar.zst" "$@" }
function decompress { tar -I zstd -xf "$@" }
function mpva { mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch:"$@" }
function shrinkpdf-low { /usr/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=shrunk-"$1" "$1" }
function shrinkpdf-mid { /usr/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=shrunk-"$1" "$1" }
function shrinkpdf-high { /usr/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=shrunk-"$1" "$1" }

# urlencode() {
    # setopt localoptions extendedglob
    # input=( ${(s::)1} )
    # print ${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-])/%${(l:2::0:)$(([##16]#match))}}
# }

# command not found handler
# https://wiki.archlinux.org/index.php/Zsh#The_%22command_not_found%22_handler
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=(
        ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"}
    )
    if (( ${#entries[@]} ))
    then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}"
        do
            # (repo package version file)
            local fields=(
                ${(0)entry}
            )
            if [[ "$pkg" != "${fields[2]}" ]]
            then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

## Homebrew
if type brew &>/dev/null; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

## atuin/dev
if type atuin &>/dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi
