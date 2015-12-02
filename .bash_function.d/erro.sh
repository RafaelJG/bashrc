#!/bin/bash

erro(){
	if [ "$1" -ne 0 ]
	then
		local NVERMELHO="\033[1;31m"
		local NENHUM="\033[0m" 
		echo -en "${NVERMELHO}"
		print_end_of_line ":("
		echo -en "${NENHUM}"
		echo -en '\r'
	fi

	unset LAST_COMM_RESULT
}
