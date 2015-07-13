#!/bin/bash

BASHRC_PATH=~/.bashrc
BASHF_PATH=~/.bash_functions
BASHA_PATH=~/.bash_aliases

backup(){
	if [ -f "$1" ]; then
		echo "$1 backup..."
		mv -v "$1" "${1}.bk"
	fi
}

install(){
	cp -v .bashrc "$BASHRC_PATH"
	cp -v .bash_functions "$BASHF_PATH"
	cp -v .bash_aliases "$BASHA_PATH"
	
}

backup "$BASHRC_PATH"
backup "$BASHF_PATH"
backup "$BASHA_PATH"

install
