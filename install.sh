#!/bin/bash

file_list=$(cat .installation_files|xargs)

backup(){
	path_to_backup="$HOME/$1"
	if [ -e "$path_to_backup" ]
	then
		if [ -d "$path_to_backup".bk ]
		then
			rm -rv "$path_to_backup".bk
		fi
		echo "$path_to_backup backup..."
		mv -v "$path_to_backup" "$path_to_backup".bk
	fi
}

install(){
	path_to_install="$HOME/$1"
	if [ -d "$path_to_install" ]
	then
		rm -rv "$path_to_install"
	fi
	cp -vr "$1" "$path_to_install"
}

for f in $file_list
do
	echo "Instalando $f========================"
	backup "$f"
	install "$f"
done
