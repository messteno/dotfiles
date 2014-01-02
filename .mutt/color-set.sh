#!/usr/bin/zsh

if [[ $DISPLAY = '' ]] then
    echo source /usr/share/doc/mutt/colors/solarized/mutt-colors-solarized-dark-16.muttrc;
else
    echo source /usr/share/doc/mutt/colors/solarized/mutt-colors-solarized-dark-256.muttrc;
fi



