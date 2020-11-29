# Created by newuser for 5.5.1

# https://wiki.archlinux.org/index.php/Zsh#The_.22command_not_found.22_hook
source /usr/share/doc/pkgfile/command-not-found.zsh
# https://wiki.archlinux.org/index.php/Zsh#Fish-like_syntax_highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Env var: see .zshenv

# fix the fucking {back,for}word behaviour
WORDCHARS='~!#$%^&*(){}[]<>?.+;-'

## Source shell-agnostic aliases from common file (source: https://askubuntu.com/a/195357)
source $HOME/.aliases

## Zsh-only functions

function compress { tar -I zstd -cf "$1.tar.zst" "$@" }
function decompress { tar -I zstd -xf "$@" }
function ytm { mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch:"$@" }
function shrinkpdf { /usr/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=reduced-"$1" "$1" }


source /home/neitsab/.config/broot/launcher/bash/br
