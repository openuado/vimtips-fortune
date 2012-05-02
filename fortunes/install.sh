#!/bin/sh

#Written by Natal Ngétal and Gilles Crèvecœur

check_user ()
{
    my_name="$(whoami)" 
    if [ "$my_name" != "root" ]
    then
        echo "You must be root"
        exit 0
    fi
}

debian_install ()
{
    bin="$(which fortune)"
    path_fortune='/usr/local/share/games/fortunes/'
    
    if [ ! -x "$bin" ]
    then
        echo 'Install fortune software'
        apt-get install fortune
    fi

    strfile vimtips vimtips.dat

    if [ ! -d "$path_fortune" ]
    then
        mkdir -p $path_fortune
    fi

    cp vimtips vimtips.dat $path_fortune
}

general_intall ()
{
    bin="$(which fortune)"
    path_fortune='/usr/local/share/fortunes/'

    if [ ! -x "$bin" ]
    then
        echo 'Need fortune software to work'
        exit
    fi

    strfile vimtips vimtips.dat

    if [ ! -d "$path_fortune" ]
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
