#!/bin/bash

nout(){
	for cmd in "$@"
	do
		nohup "$cmd" > /dev/null 2>&1&
	done
}
