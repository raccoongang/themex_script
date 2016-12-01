##OpenEdx Comprehensive theme autoinstall
####*Playbook not applicable for Vagrant devstack

###QUICK START:
###REQUIREMENTS:
#####Project tested with:
```
ansible >=2.0.1.0
host: Ubuntu 12.04
```

## Clone repo:
```
git clone https://github.com/raccoongang/themex_script.git
```
##Run script
```
cd themex_script
```

### use local zip theme file:  
```
./update_theme.sh -l /some/local/zip-file/path/theme-name.zip
```

###use remote zip theme file: 
```
./update_theme.sh -r http://themex.io/...../theme-name.zip
```

###use theme branch in raccoongan repo (download theme from raccoongang repo with specific branch): 
```
./update_theme.sh -b theme_branch
```

###theme branch in custom repo (download theme from specific repo with specific branch): 
```
./update_theme.sh -br theme_branch theme_repo
```

###setup theme branch in custom repo into some edx host:
```
./update_theme.sh -brh theme_branch theme_repo edx_host
```
####example:
```
./update_theme.sh -brh marvel-theme-eucalyptus https://github.com/raccoongang/themes_for_themex.io.git 200.83.1.109
```


###setup theme branch in custom repo into some group of edx hosts (!you need to modify inventory.ini file!): 
```
./update_theme.sh -brhi theme_branch theme_repo edx_host_group
```
####example:
```
./update_theme.sh -brhi marvel-yellow-theme-eucalyptus https://github.com/raccoongang/themes_for_themex.io.git edx

inventory.ini file contained (in this case)

[edx]
200.83.1.109
```

#### If you use some configuration server for setup theme on remote Edx instance you need to install ansible locally

```
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible
```

