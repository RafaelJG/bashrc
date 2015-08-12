#!/bin/bash
hexdate(){
	h="$(date +%H)"
	m="$(date +%M)"
	s="$(date +%S)"

	h="`echo "obase=16; $h" | bc`"
	m="`echo "obase=16; $m" | bc`"
	s="`echo "obase=16; $s" | bc`"

	echo "$h:$m:$s"
}
