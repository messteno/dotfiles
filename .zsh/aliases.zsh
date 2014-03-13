background() {
   "$@" &
}

autoload -U zsh-mime-setup
autoload -U pick-web-browser
zsh-mime-setup

alias vfm="background urxvt -e vifm"
alias ssh='TERM=xterm ssh'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias ls='ls -F --color=auto'
alias ll='ls -la'
alias dts='date +%Y%m%d_%H%M%S'
alias mkdir='nocorrect mkdir -p'
alias yaourt='nocorrect yaourt'
alias rm=' rm --one-file-system'
alias mkpass='head -c4 /dev/urandom | xxd -ps'
alias less='/usr/share/vim/vim74/macros/less.sh'
alias ps='ps -e'
alias cd..='cd ..'
alias mount='mount -o uid=1000 gid=100'
alias systemctl='nocorrect systemctl'
alias cal='cal -m'
alias cp='nocorrect cp'
[[ -f /usr/bin/grc ]] && {
    alias ping='grc --colour=auto ping'
    alias traceroute='grc --colour=auto traceroute'
    alias make='grc --colour=auto make'
#   alias diff='grc --colour=auto diff'
    alias cvs='grc --colour=auto cvs'
    alias netstat='grc --colour=auto netstat'
}

alias -g KU='| iconv -c -f koi8r -t utf8'
alias -g CU='| iconv -c -f cp1251 -t utf8'
alias -g UK='| iconv -c -f utf8 -t koi8r'
alias -g UC='| iconv -c -f utf8 -t cp1251'
alias -g G='| grep'
alias -g C='wc -l'
alias -g ...='../..'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'
alias -g M='| more'
alias -g D="DISPLAY=:0.0"

alias -s {html,htm}=pick-web-browser
alias -s kdb='background keepassx'
alias -s {jpg,jpeg,gif,png,JPG,PNG,JPEG,GIF}='background geeqie'
alias -s {ARW,RAW}=darktable
alias -s {pdf}=evince
alias -s tex=vim
