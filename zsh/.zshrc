# Created by newuser for 5.5.1

# https://wiki.archlinux.org/index.php/Zsh#The_.22command_not_found.22_hook
source /usr/share/doc/pkgfile/command-not-found.zsh
# https://wiki.archlinux.org/index.php/Zsh#Fish-like_syntax_highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Env var --> see .zshenv

## aliases

### general CLI
alias sudo='sudo '
alias ls='ls --color=auto'
alias ll='ls -lah --time-style=long-iso'
alias lh='ll -c -lt -r'
alias grep='grep -i --color=auto'
alias df='df -hT -x devtmpfs -x tmpfs'
alias nano='micro'
alias lsblk='lsblk -o NAME,TYPE,SIZE,LABEL,FSTYPE,MOUNTPOINT'

### package management
alias inst='pacaur -S --needed --noedit'
alias maj='inst -yu'
alias maj_dev='maj --devel' 
alias remove='pacaur -Rs'
alias purge='pacaur -Rsn'
alias query='pacaur -Ss'
alias search='pacaur -Qs'
alias repinfo='pacaur -Si'
alias pkginfo='pacaur -Qi'
alias orphan='pacaur -Qdtq'
alias rem_orphan='remove `orphan`'

### systemd
alias enable='sudo systemctl enable'
alias disable='sudo systemctl disable'
alias status='systemctl status'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias reload='sudo systemctl reload'
alias sreboot='systemctl reboot'
alias poweroff='systemctl poweroff'

### git
alias gs='git status'
alias gc='git commit'
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'

### grub
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'

### aria2c
alias dl='aria2c'
alias dl_meta='dl --conf-path=/home/neitsab/.aria2/metadata2torrent.conf'

### whipper
alias rip="whipper cd rip -O '' -W '/home/neitsab/Musique/staging/Collection Flac/Mes rips/' --disc-template='%A/%y - %d/%t. %n' --track-template='%A/%y - 
%d/%t. %n'"
alias rip_va="whipper cd rip -O '' -W '/home/neitsab/Musique/staging/Collection Flac/Mes rips/' --disc-template='%A/%y - %d/%t. %a - %n' --track-template='%A/%y 
- %d/%t. %a - %n'"

### youtube-dl
alias youtube-dl='youtube-dl -f bestvideo\[height\<\=\?1080\]\+bestaudio\/best -o "%(title)s.%(ext)s"'

## functions

function compress { tar -I zstd -cf "$1.tar.zst" "$@" }
function decompress { tar -I zstd -xf "$@" }
function ytm { mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch:"$@" }
function shrinkpdf { /usr/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=reduced-"$1" "$1" }
