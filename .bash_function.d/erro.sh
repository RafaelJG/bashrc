#!/bin/bash

erro(){
	[ "$?" -eq 0 ] ||
		print_end_of_line "$1:($2"
}
