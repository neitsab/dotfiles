#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash prompt (user@host working dir)
PS1='[\u@\h \W]\$ '

# Add custom folder to $PATH
PATH=~/Documents/PC/bin:$PATH
EDITOR=nano

# enable forward search by disabling flow control (http://stackoverflow.com/a/791800)
[[ $- == *i* ]] && stty -ixon

# pkgfile "command not found" hook
source /usr/share/doc/pkgfile/command-not-found.bash

# Keychain init
eval $(keychain --eval --noask --nogui --quiet alancienne-ed25519 alancienne-rsa arch-medion-ed25519 arch-medion-rsa gitit-ed25519)

## aliases ##

# cli work
alias sudo='sudo '
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep -i --color=auto'
alias diff='diff -y --suppress-common-lines'
alias iotop='sudo iotop'
alias df='df -hT'
alias mount='mount | column -t'

# package management
alias inst='pacaur -S --needed'
alias maj='pacaur -Syu --devel' 
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

#alias reboot='systemctl reboot'
#alias poweroff='systemctl poweroff'

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
alias ripit="rip cd rip -O '' -W '/home/neitsab/Musique/Collection Flac/Mes rips/' --disc-template='%A/%y - %d/%t. %n' --track-template='%A/%y - %d/%t. %n' -R"
alias ripit_va="rip cd rip -O '' -W '/home/neitsab/Musique/Collection Flac/Mes rips/' --disc-template='%A/%y - %d/%t. %a - %n' --track-template='%A/%y - %d/%t. %a - %n' -R"

# youtube-dl
alias youtube-dl='youtube-dl -o "%(title)s.%(ext)s"'

# git
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'
