#!/bin/bash

if [ -z "$1" ]
then
    echo "theme is unset: use --> ./update_theme.sh theme_branch"
else
    ansible-playbook -c local -i "localhost," prepare.yml
    if [ -z "$2" ]
	then
	    /tmp/edxthemevenv/bin/ansible-playbook -c local -i "localhost," main.yml -e theme_branch="\'$1\'"
	else
		/tmp/edxthemevenv/bin/ansible-playbook -c local -i "localhost," main.yml -e theme_branch="\'$1\'" -e theme_repo="\'$2\'"
	fi

fi
