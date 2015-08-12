#!/bin/bash

readmd(){
	if [ $# -eq 1 ]
	then
		markdown "$1" | lynx -stdin
	fi
}
