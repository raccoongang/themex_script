#!/bin/bash

if [ -z "$1" ]
then
    echo "theme is unset: use --> ./update_theme.sh theme_branch"
else
    ansible-playbook -c local -i "localhost," prepare.yml
    if [ -z "$2" ]
    then
        ~/.edxthemevenv/bin/ansible-playbook -c local -i "localhost," main.yml -e "theme_branch=$1"
    elif [ -z "$3" ]
    then
        ~/.edxthemevenv/bin/ansible-playbook -c local -i "localhost," main.yml -e "theme_branch=$1 theme_repo=$2"
    else
        ~/.edxthemevenv/bin/ansible-playbook -i inventory.ini main.yml -e "theme_branch=$1 theme_repo=$2 edx_hosts=$3"
    fi

fi
