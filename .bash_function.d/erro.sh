#!/bin/bash

erro(){
	if [ "$?" -eq 0 ]
	then
		#pra imprimir quando acertou
		#echo -en "\033[0;32m[✔]\033[0m"
		:
	else
		echo -n ":("
	fi
}
