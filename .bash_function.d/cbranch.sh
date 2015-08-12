#!/bin/bash

cbranch(){
	prefix=""
	posfix=""

	if [ $# -gt 0 ]
	then
		prefix="$1"
	
		if [ $# -gt 1 ]
		then
			posfix="$2"
		fi
	
	fi

	if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1
	then
		branch="$(git branch | awk '/\*/ { print $2; }')"
		if [[ $branch  ]]
		then
			echo -e "$prefix$branch$posfix"
		fi
	fi
}
