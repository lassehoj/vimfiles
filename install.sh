#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)

ATTR_RESET=$(tput sgr0)

function printStat {
	if [ $? == 0 ]; then
		echo "[${GREEN}   OK   ${ATTR_RESET}]" $1
	else
		echo "[${RED} FAILED ${ATTR_RESET}]" $1
	fi
}

target="${HOME}"

# Link the directory
source="${PWD}"
ln -sf ${source} ${target}/.vim
printStat "ln -sf ${source} ${target}/.vim"

# Link all files beginning with a "_"
for i in _*
do
	source="${PWD}/$i"
	fileTarget="${target}/${i/_/.}"
	ln -sf ${source} ${fileTarget}
	printStat "ln -sf ${source} ${fileTarget}"
done

# Init and update all submodules
git submodule init
git submodule update
git submodule foreach git pull origin master

