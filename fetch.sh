#!/bin/bash

#a simple, configurable fetch

while getopts "ap" o; do
    case $o in
        a) ascii_flag=true ;;
        p) pkgmeme_flag=true ;;
    esac
done

#these varibles can be inserted into echo commands to make some text bold but not the rest
bold=$(tput bold)
normal=$(tput sgr0)

hostname=$(cat /proc/sys/kernel/hostname)
kernel=$(uname -r)
uptime=$(uptime | awk -F'( |,|:)+' '{print $6,$7",",$8,"hours,",$9,"minutes."}')
shell=$($SHELL --version)
distro=$(head -n 1 /etc/os-release | cut -c 6- )

#TODO: make this work with other package managers
packages=$(pacman -Q | wc -l)

#distro logos made with https://patorjk.com/software/taag/#p=display&f=Slant&t=

if [[ $distro == "EndeavourOS" && $ascii_flag == "true" ]];
then
    echo -e "\e[35m     ______     _____"
    echo -e "\e[35m    / ____/___ / ___/"
    echo -e "\e[35m   / __/ / __ \\__ \ "
    echo -e "\e[35m  / /___/ /_/ /__/ / "
    echo -e "\e[35m /_____/\____/____/  "
    echo -e ""
fi

echo -e "\e[35m$bold $USER\e[0m$normal@\e[35m$bold$hostname$normal"
echo -e ""
echo -e "\e[35m$bold kernel:    \e[0m$kernel"
echo -e "\e[35m$bold uptime:    \e[0m$uptime"
echo -e "\e[35m$bold packages:  \e[0m$packages"
echo -e "\e[35m$bold shell:     \e[0m$shell"
echo -e "\e[35m$bold distro:    \e[0m$distro"
