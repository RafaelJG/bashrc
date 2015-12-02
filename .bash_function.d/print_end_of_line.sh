#!/bin/bash

print_end_of_line(){
	[ -z "$1" ] && exit 0
	ncol=$(tput cols)
	
	arg_size="${#1}"
	ncol=$(( ncol-arg_size ))
	
	echo -ne "\033[${ncol}C"
	echo "$1"
}
