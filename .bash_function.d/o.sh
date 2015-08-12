#!/bin/bash

o (){
	for arg in "$@"
	do
		echo "$arg"
		nohup xdg-open "$arg" > /dev/null 2>&1&
	done
}
