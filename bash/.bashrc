#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash prompt (user@host working dir)
PS1='[\u@\h \W]\$ '

# Add custom folder to $PATH
PATH=~/PC/bin:$PATH
EDITOR=nano
#AURDEST=

# enable forward search by disabling flow control (http://stackoverflow.com/a/791800)
[[ $- == *i* ]] && stty -ixon

# pkgfile "command not found" hook
source /usr/share/doc/pkgfile/command-not-found.bash

# Keychain init
eval $(keychain --eval --noask --nogui --quiet alancienne-ed25519 alancienne-rsa arch-medion-ed25519 arch-medion-rsa gitit-ed25519)

## aliases ##

# general cli
alias sudo='sudo '
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep -i --color=auto'
alias diff='diff -y --suppress-common-lines'
alias iotop='sudo iotop'
alias df='df -hT'

# package management
alias inst='pacaur -S --needed --noedit'
alias maj='inst -yu'
alias maj-dev='maj --devel' 
alias remove='pacaur -Rs'
alias purge='pacaur -Rsn'
alias pkginfo='pacaur -Qi'
alias query='pacaur -Ss'
alias repinfo='pacaur -Si'
alias search='pacaur -Qs'
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

# grub
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'

# aria2
alias dl='aria2c'
alias dl_cap='aria2c --conf-path=/home/neitsab/.aria2/aria2_cap.conf'
alias dl_noal='aria2c --conf-path=/home/neitsab/.aria2/aria2_nofalloc.conf'
alias dl_noal_cap='aria2c --conf-path=/home/neitsab/.aria2/aria2_nofalloc_cap.conf'

# qemu/kvm
#alias kvm='qemu-system-x86_64 -cpu host -enable-kvm -m 3G -vga vmware -full-screen'

# morituri
alias ripit="rip cd rip -L whatcd -O '' -W '/home/neitsab/Musique/staging/Collection Flac/Mes rips/' --disc-template='%A/%y - %d/%t. %n' --track-template='%A/%y - %d/%t. %n'"
alias ripit_va="rip cd rip -L whatcd -O '' -W '/home/neitsab/Musique/staging/Collection Flac/Mes rips/' --disc-template='%A/%y - %d/%t. %a - %n' --track-template='%A/%y - %d/%t. %a - %n'"

# youtube-dl
alias youtube-dl='youtube-dl -o "%(title)s.%(ext)s"'

# git
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'

# raccoon
alias raccoon='java -jar /home/neitsab/Téléchargements/Android/apps/apk-download/raccoon-3.7.jar'

## Functions ##

function mount() { mount "$@" | column -t ; }
function dircomp() { tar -I zstd -cf "$1.tar.zst" "$1" ; }
