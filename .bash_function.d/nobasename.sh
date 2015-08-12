#!/bin/bash

nobasename(){
	p="$(pwd)"
	base="`basename "$p"`"
	echo "${p%$base}"
}
