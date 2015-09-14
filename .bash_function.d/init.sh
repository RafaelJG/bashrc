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
