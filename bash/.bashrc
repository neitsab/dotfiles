#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash prompt (user@host working dir)
PS1='[\u@\h \W]\$ '

export PATH=~/PC/bin:$PATH
export EDITOR=micro
#export AURDEST=
export KEYBASE_SYSTEMD=1

# enable forward search by disabling flow control (http://stackoverflow.com/a/791800)
[[ $- == *i* ]] && stty -ixon

# pkgfile "command not found" hook
source /usr/share/doc/pkgfile/command-not-found.bash

# Keychain init
#eval $(keychain --eval --noask --nogui --quiet alancienne-ed25519 alancienne-rsa arch-medion-ed25519 arch-medion-rsa gitit-ed25519)

## aliases ##

# general cli
alias sudo='sudo '
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep -i --color=auto'
alias diff='diff -y --suppress-common-lines'
alias df='df -hT'
alias nano='micro'
alias mostused="history | cut -c8- | cut -d' ' -f1 | sort | uniq -c | sort -nr | head -n20"

# package management
alias inst='pacaur -S --needed --noedit'
alias maj='inst -yu'
alias maj-dev='maj --devel' 
alias remove='pacaur -Rs'
alias purge='pacaur -Rsn'
alias query='pacaur -Ss'
alias search='pacaur -Qs'
alias repinfo='pacaur -Si'
alias pkginfo='pacaur -Qi'
alias orphan='pacaur -Qdtq'
alias rem_orphan='remove `orphan`'

# systemd
alias enable='sudo systemctl enable'
alias disable='sudo systemctl disable'
alias status='systemctl status'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias reload='sudo systemctl reload'
alias sreboot='systemctl reboot'
alias poweroff='systemctl poweroff'

# git
alias gs='git status'
alias push='git push'
alias gp='git pull'
alias gc='git commit'
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'

# grub
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'

# aria2
alias dl='aria2c'
alias dl_cap='aria2c --conf-path=/home/neitsab/.aria2/aria2_cap.conf'
alias dl_noal='aria2c --conf-path=/home/neitsab/.aria2/aria2_nofalloc.conf'
alias dl_noal_cap='aria2c --conf-path=/home/neitsab/.aria2/aria2_nofalloc_cap.conf'

# qemu/kvm
#alias kvm='qemu-system-x86_64 -cpu host -enable-kvm -m 3G -vga vmware -full-screen'

# whipper
alias rip="whipper cd rip -O '' -W '/home/neitsab/Musique/staging/Collection Flac/Mes rips/' --disc-template='%A/%y - %d/%t. %n' --track-template='%A/%y - 
%d/%t. %n'"
alias rip-va="whipper cd rip -O '' -W '/home/neitsab/Musique/staging/Collection Flac/Mes rips/' --disc-template='%A/%y - %d/%t. %a - %n' --track-template='%A/%y 
- %d/%t. %a - %n'"

# youtube-dl
alias youtube-dl='youtube-dl -f bestvideo[height\<\=\?1080]+bestaudio/best -o "%(title)s.%(ext)s"'

# raccoon
alias raccoon='java -jar /home/neitsab/Téléchargements/Android/apps/apk-download/raccoon-3.7.jar'

## Functions ##

function compress() { tar -I zstd -cf "$1.tar.zst" "$1" ; }
function ytm() { mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch:"$@" ; }
