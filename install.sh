#!/bin/sh

#Written by Natal Ngétal and Gilles Crèvecœur

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
    local path_fortune='/usr/local/share/games/fortunes/'

    if [ ! $bin ]
    then
        echo 'Install fortune software'
        apt-get install fortune
    fi

    strfile vimtips vimtips.dat

    if [ ! -d $path_fortune ]
    then
        mkdir -p $path_fortune
    fi

    cp vimtips vimtips.dat $path_fortune
}

function general_intall {
    local bin=$(which fortune)
    locat path_fortune='/usr/local/share/fortunes/'

    if [ ! $bin ]
    then
        echo 'Need fortune software to work'
        exit
    fi

    strfile vimtips vimtips.dat

    if [ ! -d $path_fortune ]
    then
        mkdir -p $path_fortune
    fi

    cp vimtips vimtips.dat $path_fortune
}

check_user
if [ -e '/etc/debian_version' ]
then
    debian_install
else
    general_intall
fi
