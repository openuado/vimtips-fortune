#!/bin/bash

function check_user {
    local ROOT_UID=0

    if [ "$UID" -ne "$ROOT_UID" ]
    then
        echo "You must be root"
        exit 0
    fi
}


function debian_install {
    if [ ! -e '/usr/games/fortune' ]
    then
        echo 'Install fortune software'
        apt-get install fortune
    fi

    strfile vimtips vimtips.dat
    cp vimtips vimtips.dat /usr/share/games/fortunes/
}

function general_intall {
    if [ ! -e '/usr/bin/fortune' ]
    then
        echo 'Need fortune software to work'
        exit
    fi

    strfile vimtips vimtips.dat
    cp vimtips vimtips.dat /usr/share/fortunes/
}

check_user
if [ -e '/etc/debian_version' ]
then
    debian_install
else
    general_intall
fi
