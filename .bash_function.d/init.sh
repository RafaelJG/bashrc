#!/bin/bash

##OLDPWD HANDLER#################
oldpwd_exit(){
	[ ! -e /tmp/oldpwdh ] && mkdir /tmp/oldpwdh
	echo "$PWD" > /tmp/oldpwdh/oldpwd
}

trap oldpwd_exit EXIT

oldpwd_init(){
	if [ -e /tmp/oldpwdh/oldpwd ]
	then
		export OLDPWD="$(cat /tmp/oldpwdh/oldpwd)"
	fi
}
oldpwd_init


##SCREENPLASH###################

source ~/.bash_function.d/vacadiz_fortune.sh
if [ $((RANDOM%10)) -eq 0 ]
then
	if [ $((RANDOM%2)) -eq 0 ]
	then
		screenfetch
	else
		vacadizfortune
	fi

fi
