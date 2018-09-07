#!/bin/bash

# Version: 0.5

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
	printf "CPU:\n$(lscpu)\nMemory:\n$(free -m)\nDisk:\n$(lsblk)\n\n\n"
	# Get Domain Controller Info
	printf "Domain Controller Info: \n"
	printf "$(odutil show nodenames)\n\n\n"
	# Hostname and Domain
	printf "Hostname and Domain: \n"
	printf "Hostname: $(Hostname)\nDomain: $(cat /etc/resolv.conf | grep domain | awk '{print $2}')\n\n\n"
	# List of Users (Info / History)
	printf "User Info: \n"
	printf "$(cat /etc/passwd)\n\n\n"
	printf "User Login History: \n"
	printf "$(last)\n\n\n"
	# Start at Boot
	printf "Programs and Services at Boot: \n"
	printf "$(systemctl list-units --type service --all)\n\n\n"
	# List of scheduled tasks
	printf "List of Scheduled Tasks: \n"
	printf "$(crontab -l)\n\n\n"
	# Network
	printf "Network Info:\n "
	printf "ARP Table: \n$(arp -a)\n\n"
	printf "MAC Addresses of All Interfaces: \n$(ifconfig | awk '/ether/ {print $2}')\n\n"
	printf "Routing Tables: \n$(netstat -r)\n\n"
	printf "IP Addresses for all Interfaces: \n$(ifconfig | awk '/inet*/ {print $2}')\n\n"
	printf "DHCP Server: \n$(journalctl | grep DHCPACK | awk '/from/ {print $10}' | tail -1)\n\n"
	printf "DNS Servers: \n$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')\n\n"
	printf "Gateway for All Interfaces: \n$(ip route | grep default)\n\n"
	printf "Listening Services: \n$(lsof -Pnl +M -i)\n\n"
	printf "Established Connections: \n$(lsof -Pnl +M -i | grep ESTABLISHED)\n\n"
	printf "DNS Cache: \n$(cat /etc/hosts/)\n\n\n"
	# Network Shares
	printf "Network Shares: \n$(lpstat -a)\n\n\n"
	# Printers
	printf "Printers: \n$(lpstat -a)\n\n\n"
	# WiFi Profiles
	printf "WiFi Access Profiles: \n$(iwconfig)\n\n\n"
	# List all instaled software
	printf "List All Installed Software: \n$(dpkg -l)\n\n\n"
	printf "Process list: \n$(ps awwwfux)\n\n\n"
	printf "Driver List: \n$(lsmod)\n\n\n"
	# List of files in Downloads and Documents
	printf "List of Files in Downloads: \n$(cd ~/Downloads; ls -ahl)\n\n"
	printf "List of Files in Documents: \n$(cd ~/Documents; ls -ahl)\n\n"
	printf "List of Files in Desktop: \n$(cd ~/Desktop; ls -ahl)\n\n\n"
	# Print current logged in users and status
	printf "Who is logged in and what they are doing: \n$(w)\n\n\n"
	# Last Authenticated SSH Session
	printf "Last Authenticated SSH Session: \n$(cat /var/log/auth.log | grep sshd | tail)\n\n\n"
}

printf "$(get_sysinfo)\n\n"
