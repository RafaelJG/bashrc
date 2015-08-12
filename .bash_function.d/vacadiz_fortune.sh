#!/bin/bash

vacadizfortune(){
	if [ $((RANDOM%10)) -eq 0 ]
	then
		fortune -o | cowsay -e "ºº"
	else
		fortune | cowsay
	fi
}
