#!/bin/bash

BASHRC_PATH=~/.bashrc
BASHF_PATH=~
BASHA_PATH=~/.bash_aliases

backup(){
	if [ -e "$1" ]; then
		if [ -d "${1}.bk" ]
		then
			rm -vr "${1}.bk"
		fi
		echo "$1 backup..."
		mv -v "$1" "${1}.bk"
	fi
}

install(){
	cp -v .bashrc "$BASHRC_PATH"
	cp -rv .bash_function.d/ "$BASHF_PATH"
	cp -v .bash_aliases "$BASHA_PATH"
	
}

backup "$BASHRC_PATH"
backup "$BASHF_PATH"/.bash_function.d
backup "$BASHA_PATH"

install
