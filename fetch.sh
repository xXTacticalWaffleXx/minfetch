#!/bin/bash

#a simple, configurable fetch

while getopts "apd" o; do
    case $o in
        a) ascii_flag=true ;;
        p) pkgmeme_flag=true ;;
        d) debug=true ;; # this is a debug flag used for different things at different times, do not use this outside of development, its effects will change
    esac
done

#these varibles can be inserted into echo commands to make some text bold but not the rest
bold=$(tput bold)
normal=$(tput sgr0)

hostname=$(cat /proc/sys/kernel/hostname)
kernel=$(uname -r)
uptime=$(echo $(uptime | awk -F'( |,|:)+' '{print $6,$7",",$8,"hours,",$9,"minutes."}' | sed 's/,.*//' |sed 's/ / hours /') min)
shell_raw=$($SHELL --version)
shell=$(echo $shell_raw | sed 's/h.*/h/')
distro=$(head -n 1 /etc/os-release | cut -c 6- )

#TODO: make this work with other package managers
packages=$(pacman -Q | wc -l)

if [[ $pkgmeme_flag == "true" ]]; then
    packages="2,147,483,647"
fi

#distro logos made with https://patorjk.com/software/taag/#p=display&f=Slant&t=

if [[ $distro == "EndeavourOS" && $ascii_flag == "true" ]];
then
    echo -e "\e[35m     ______     _____"
    echo -e "\e[35m    / ____/___ / ___/"
    echo -e "\e[35m   / __/ / __ \\__ \ "
    echo -e "\e[35m  / /___/ /_/ /__/ / "
    echo -e "\e[35m /_____/\____/____/  "
    echo -e ""
elif [[ $distro == "Arch Linux" && $ascii_flag == "true" ]];
then
    echo -e "\e[36m    ____ _______       __"
    echo -e "\e[36m   / __ )_  __/ |     / /"
    echo -e "\e[36m  / __  |/ /  | | /| / / "
    echo -e "\e[36m / /_/ // /   | |/ |/ /  "
    echo -e "\e[36m/_____//_/    |__/|__/   "
    echo -e ""
fi

echo -e "\e[35m$bold $USER\e[0m$normal@\e[35m$bold$hostname$normal"
echo -e ""
echo -e "\e[35m$bold kernel:    \e[0m$kernel"
echo -e "\e[35m$bold uptime:    \e[0m$uptime"
echo -e "\e[35m$bold packages:  \e[0m$packages"
echo -e "\e[35m$bold shell:     \e[0m$shell"
echo -e "\e[35m$bold distro:    \e[0m$distro"
echo -e ""
echo -e "\e[1;30m ██\e[1;31m ██\e[1;32m ██\e[1;33m ██\e[1;34m ██\e[1;35m ██\e[1;36m ██\e[1;37m ██"
echo -e ""
#echo -e "\e[1;90m ██\e[1;91m ██\e[1;92m ██\e[1;99m ██\e[1;94m ██\e[1;95m ██\e[1;96m ██\e[1;97m ██"

