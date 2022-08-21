#!/bin/bash


#a simple, configurable fetch

#PARSES CLI SWITCHES i need to figure out how to get this at the bottom

while getopts "apduo" o; do
    case $o in
        a) ascii_flag=true ;;
        p) pkgmeme_flag=true ;;
        d) debug=true ;; # this is a debug flag used for different things at different times, do not use this outside of development, its effects will change
        u) show_unix_time=true ;;
        o) owo_flag=true ;;
    esac
done

main () {
    echo -e ""
    echo -e "\e[35m$bold $USER\e[0m$normal@\e[35m$bold$hostname$normal"
    echo -e ""
    echo -e "\e[35m$bold kernel:   \e[0m  $kernel"
    echo -e "\e[35m$bold uptime:   \e[0m $uptime"
    echo -e "\e[35m$bold packages: \e[0m  $packages"
    echo -e "\e[35m$bold shell:    \e[0m  $shell"
    echo -e "\e[35m$bold distro:   \e[0m  $distro"
    if [[ $show_unix_time == "true" ]]; then 
        echo -e "\e[35m$bold unix time: \e[0m $time" # this is in an if statement because it is a meme that most people arent gonna use
    fi
    echo -e ""
    echo -e "\e[1;30m ██\e[1;31m ██\e[1;32m ██\e[1;33m ██\e[1;34m ██\e[1;35m ██\e[1;36m ██\e[1;37m ██"
    echo -e ""
    #uncomment to print light colours
    #echo -e "\e[1;90m ██\e[1;91m ██\e[1;92m ██\e[1;99m ██\e[1;94m ██\e[1;95m ██\e[1;96m ██\e[1;97m ██"
}

# geting the info

hostname=$(cat /proc/sys/kernel/hostname)
kernel=$(uname -r)
uptime=$(uptime -p | sed 's/up//' | sed 's/ute//')
shell=$($SHELL --version | sed 's/h.*/h/')
distro=$(head -n 1 /etc/os-release | cut -c 6-)
time=$(date +%s)

#add portage and dnf support

pacman -Q > /dev/null 2>&1 # just runs pacman to check if its installed
if [[ $? == 0 ]]; then
    packages=$(pacman -Q | wc -l)
else
    apt-cache stats | head -n 1 | sed ' s/Total package names: //' | sed 's/ .*//' > /dev/null 2>&1 # checks if apt is installed
    if [[ $? == 0 ]]; then
       packages=$(apt-cache stats | head -n 1 | sed ' s/Total package names: //' | sed 's/ .*//')
    fi
fi

if [[ $pkgmeme_flag == "true" ]]; then
    packages="2,147,483,647"
fi
#distro logos made with https://patorjk.com/software/taag/#p=display&f=Slant&t=

if [[ $owo_flag == "true" ]]; then
    echo -e "\e[35m   ____           ____ "
    echo -e "\e[35m  / __ \_      __/ __ \ "
    echo -e "\e[35m / / / / | /| / / / / /"
    echo -e "\e[35m/ /_/ /| |/ |/ / /_/ / "
    echo -e "\e[35m\____/ |__/|__/\____/  "
elif [[ $distro == "EndeavourOS" && $ascii_flag == "true" ]];
then
    echo -e "\e[35m     ______     _____"
    echo -e "\e[35m    / ____/___ / ___/"
    echo -e "\e[35m   / __/ / __ \\__ \ "
    echo -e "\e[35m  / /___/ /_/ /__/ / "
    echo -e "\e[35m /_____/\____/____/  "
elif [[ $distro == "Arch Linux" && $ascii_flag == "true" ]];
then
    echo -e "\e[36m    ____ _______       __"
    echo -e "\e[36m   / __ )_  __/ |     / /"
    echo -e "\e[36m  / __  |/ /  | | /| / / "
    echo -e "\e[36m / /_/ // /   | |/ |/ /  "
    echo -e "\e[36m/_____//_/    |__/|__/   "
fi

#distro logos made with https://patorjk.com/software/taag/#p=display&f=Slant&t=
#DEFINING USEFUL VARIBLES
bold=$(tput bold)
normal=$(tput sgr0) 

main
