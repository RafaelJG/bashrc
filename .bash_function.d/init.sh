#!/bin/bash

source vacadiz_fortune.sh

if [ $((RANDOM%10)) -eq 0 ]
then
	if [ $((RANDOM%2)) -eq 0 ]
	then
		screenfetch
	else
		vacadizfortune
	fi

fi
