#!/bin/bash

realce(){
	file=""
	query=""
	for arg in "$@"
	do	
		echo "tam: $#; 1 = $1"
	
		if [ $# -gt 1 ]
		then 
			query="$query $1"
		else
			if [ -e $1 ]
			then
				file=$1
			else
				query="$query $1"
			fi
		fi

		shift
		
	done
	query=$( echo $query | xargs )
	grep --color -E "$query|\$" $file
}
