#!/bin/bash

# In order to use this script you need just to source it in you bash file
# source ~/bitsandpieces/shell/dirJump.sh

if [ ! -f ~/.dirJump ]; then
    echo "#!/bin/bash" > ~/.dirJump
else
    source ~/.dirJump
fi
GG()
{
    if grep -q "${1}=" ~/.dirJump; then
        cd $(grep -E $1 ~/.dirJump | sed 's/^export .*=//')
    else
        echo -e "\033[0;31mAlias '${1}' does not exists...\033[0m"
    fi
}
SS()
{
    if grep -q "${1}=" ~/.dirJump; then
        echo -e "\033[0;31mThe following record exists:\033[0m" $(grep "${1}=" ~/.dirJump | sed 's/^export //')
	read -p $'\e[31mDo you want to overwrite it? [y/N]\e[0m ' -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
	    DD $1
	    SS $1
	fi
    else
        echo "export ${1}=$(pwd)" >> ~/.dirJump
	export $1=$(pwd)
    fi
}
DD()
{
    unameOut="$(uname -s)"
    case "${unameOut}" in
	Linux*)  sed -i "/${1}=.*/d" ~/.dirJump ;;
	Darwin*) sed -i '' "/${1}=.*/d" ~/.dirJump ;;
    esac
    unset $1
}
LL()
{
    sort ~/.dirJump
}
