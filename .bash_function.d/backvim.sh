#!/bin/bash

backvim(){
	ps -o comm= | egrep '^vim$' | uniq | sed -r -e 's/^/(/' -e 's/$/)/'
}
