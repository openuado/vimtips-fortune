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
    local bin=$(which fortune)
    if [ ! $bin ]
    then
        echo 'Install fortune software'
        apt-get install fortune
    fi

    strfile vimtips vimtips.dat
    cp vimtips vimtips.dat /usr/share/games/fortunes/
}

function general_intall {
    local bin=$(which fortune)
    if [ ! $bin ]
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
