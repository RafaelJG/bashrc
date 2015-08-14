#!/bin/bash
#########################################################
# sensorsvars - Carrega as variáveis do comando sensors	#
#-------------------------------------------------------#
# Exemplo:
# $ sensors
#	acpitz-virtual-0
#	Adapter: Virtual device
#	temp1:        +71.5°C  (crit = +84.0°C)
#	
#	i8k-virtual-0
#	Adapter: Virtual device
#	Processor Fan: 4373 RPM
#	CPU:            +71.0°C  
#	Ambient:        +62.0°C  
#	Ambient:        +61.0°C  
#	GPU:            +16.0°C  
#	
#	radeon-pci-0200
#	Adapter: PCI adapter
#	temp1:            N/A  (crit = +120.0°C, hyst = +90.0°C)
#	
#	coretemp-isa-0000
#	Adapter: ISA adapter
#	Physical id 0:  +72.0°C  (high = +87.0°C, crit = +105.0°C)
#	Core 0:         +72.0°C  (high = +87.0°C, crit = +105.0°C)
#	Core 1:         +71.0°C  (high = +87.0°C, crit = +105.0°C)
# $ sensorsvars
# $ echo "$sensors_CPU"
# 71.0
#########################################################


sensorsvars(){
	in_shell=$(sensors |									#executa o sensors
	egrep -o '.*:[[:space:]]*[+-][0-9]+\.[0-9]' |						#deixa somente no formato chave:valor
	sed -re 's/:[[:space:]]+\+/=/g' -e 's/[[:space:]]/_/g' -e 's/^/export sensors_/g')	#formata pra shell

	eval "$in_shell"
}
