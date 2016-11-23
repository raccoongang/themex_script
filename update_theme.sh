#!/bin/bash

INI_FILE='inventory.ini'

mode_local_zip='-l'
mode_remote_zip='-r'
mode_branch_rg='-b'
mode_branch_custom_repo='-br'
mode_branch_custom_repo_remote_edx_host='-brh'
mode_branch_custom_repo_remote_group_edx_host='-brhi'

if test "$#" -le 1;
then
    echo ""
    echo "theme is unset! use one of correct correct script-run variant:"
    echo ""
    echo "local zip file:  ./update_theme.sh $mode_local_zip /some/local/zip-file/path/theme-name.zip"
    echo ""
    echo "remote zip file: ./update_theme.sh $mode_remote_zip http://themex.io/...../theme-name.zip"
    echo ""
    echo "theme branch in raccoongan repo: ./update_theme.sh $mode_branch_rg theme_branch"
    echo ""
    echo "theme branch in custom repo: ./update_theme.sh $mode_branch_custom_repo theme_branch theme_repo"
    echo ""
    echo "setup theme branch in custom repo into some edx host: ./update_theme.sh $mode_branch_custom_repo_remote_edx_host theme_branch theme_repo edx_host"
    echo ""
    echo "setup theme branch in custom repo into some group of edx hosts: ./update_theme.sh $mode_branch_custom_repo_remote_group_edx_host theme_branch theme_repo edx_host_group (!you need to modify inventory.ini file!)"
    echo ""
else

	ansible-playbook -c local -i "localhost," prepare.yml

	if test "$#" -eq 2;
	then
		if [ "$1" == "$mode_local_zip" ];
		then
			~/.edxthemevenv/bin/ansible-playbook -c local -i ",localhost" main.yml -e "mode=${1//[-]/} local_zip=$2"
		elif [ "$1" == "$mode_remote_zip" ];
		then
			~/.edxthemevenv/bin/ansible-playbook -c local -i ",localhost" main.yml -e "mode=${1//[-]/} remote_zip=$2"
		elif [ "$1" == "$mode_branch_rg" ];
		then
			~/.edxthemevenv/bin/ansible-playbook -c local -i ",localhost" main.yml -e "mode=${1//[-]/} theme_branch=$2"
		fi

	elif test "$#" -eq 3;
	then
		if [ "$1" == "$mode_branch_custom_repo" ];
		then
			~/.edxthemevenv/bin/ansible-playbook -c local -i ",localhost" main.yml -e "mode=${1//[-]/}" -e "theme_branch=$2 theme_repo=$3"
		fi
	elif test "$#" -eq 4;
	then
		if [ "$1" == "$mode_branch_custom_repo_remote_edx_host" ];
		then
			~/.edxthemevenv/bin/ansible-playbook -i ",$4" main.yml -e "edx_hosts=$4" -e "mode=${1//[-]/}" -e "theme_branch=$2 theme_repo=$3"
        elif [ "$1" == "$mode_branch_custom_repo_remote_group_edx_host" ];
        then
        	~/.edxthemevenv/bin/ansible-playbook -i $INI_FILE main.yml --limit $4 -e "edx_hosts=$4" -e "mode=${1//[-]/}" -e "theme_branch=$2 theme_repo=$3"
		fi
	fi

fi

