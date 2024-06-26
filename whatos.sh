#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function helpPanel(){
	echo -e "${grayColour}[*]${endColour} Use ./whatos:\n\t-t target "
}

function start(){
        ttl=$(ping -c 1 $target | grep -oP "ttl=\K\d+")
        if [ $ttl == "60" ]; then
                clear
                echo -e "${greenColour}[+] iPhone, iPad${endColour}"
        elif [ $ttl -ge "61" ] && [ $ttl -le "90" ]; then
                clear
                echo -e "${greenColour}[+] Linux ${endColour}\n[Other possible OS: Android, macOS]${endColour}"
        elif [ $ttl -ge "110" ] && [ $ttl -le "140" ]; then
                clear
                echo -e "${greenColour}[+] Windows${endColour}"
        elif [ $ttl == "255" ]; then
                clear
                echo -e "${greenColour}[+] Solaris, Cisco, Unix${endColour}"
        elif [ -z $ttl ]; then
                clear
                echo -e "${redColour}[*] Device not found${endColour}"
        else
                clear
                echo -e "${redColour}[*] OS not found${endColour}"
        fi
}


while getopts "t:" arg; do
	case $arg in
	t) target=$OPTARG;;
	esac
done

if [ -z $target ]; then
	clear
	helpPanel
else
	start
fi
