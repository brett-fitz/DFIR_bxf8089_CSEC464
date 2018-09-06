#!/bin/bash

get_sysinfo(){
	# Header
	printf "System Info:\n\n"
	# Current Time, Time Zone
	printf "Current Time, Time Zone: \n"
	printf "$(date)\n\n\n"
	# PC Uptime
	printf "PC Uptime: \n"
	printf "$(Uptime)\n\n\n"
	# OSVersion
	printf "OS Version (Major, Minor, Build, Revision, Typical Name, Kernel): \n"
	printf "$(uname -a)\n\n\n"
	# System Hardware Specs
	printf "System Hardware Specs (CPU, MEM, DISK): \n"
	printf "CPU:\n$(lscpu)\nMemory:\n$(free -m)\n\n\n"
	# Get Domain Controller Info
	printf "Domain Controller Info: \n"
	printf "$(odutil show nodenames)\n\n\n"
	# Hostname and Domain
	printf "Hostname and Domain: \n"
	printf "Hostname: $(Hostname)\nDomain: $(Domainname)\n\n\n"
}

printf "$(get_sysinfo)\n\n"
