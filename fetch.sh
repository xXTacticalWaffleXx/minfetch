#!/usr/bin/env bash

#Copyright(C) 2022 luna aphelion <luna-aphelion@proton.me>
#
#This program is free software : you can redistribute itand /or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.If not, see < https://www.gnu.org/licenses/>.

# todo: report storage space in unit of the users choice (including fogles XDDDDDD)
# todo: add portage and dnf support

#PARSES CLI SWITCHES i need to figure out how to get this at the bottom

while getopts "apduoh" o; do
    case $o in
        a) ascii_flag=true ;;
        p) pkgmeme_flag=true ;;
        d) debug=true ;; # this is a debug flag used for different things at different times, do not use this outside of development, its effects will change
        u) show_unix_time=true ;;
        o) owo_flag=true ;;
        h) help_flag=true ;;
    esac
done

main () {
    printf "\n"
    printf "\e[35m$bold $USER\e[0m$normal@\e[35m$bold$hostname$normal\n"
    printf "\n"
    printf "\e[35m$bold kernel:   \e[0m  $kernel\n"
    printf "\e[35m$bold uptime:   \e[0m  $uptime\n"
    printf "\e[35m$bold packages: \e[0m  $packages\n"
    printf "\e[35m$bold shell:    \e[0m  $shell\n" 
    printf "\e[35m$bold distro:   \e[0m  $distro\n"
    if [[ $show_unix_time == "true" ]]; then 
        printf "\e[35m$bold unix time: \e[0m $time\n" # this is in an if statement because it is a meme that most people arent gonna use
    fi
    printf "\n"
    printf "\e[1;30m ██\e[1;31m ██\e[1;32m ██\e[1;33m ██\e[1;34m ██\e[1;35m ██\e[1;36m ██\e[1;37m ██\n"
    printf "\n"
    #uncomment to print light colours
    #printf "\e[1;90m ██\e[1;91m ██\e[1;92m ██\e[1;99m ██\e[1;94m ██\e[1;95m ██\e[1;96m ██\e[1;97m ██\n"
}

# geting the info

. /etc/os-release #importing os-release so i can access the os name as a varible

hostname=$(cat /proc/sys/kernel/hostname)
kernel=$(uname -r)
uptime=$(uptime -p | sed 's/up//' | sed 's/ute//')
shell=$($SHELL --version | head -n 1 | sed 's/h.*/h/')
distro="$NAME $VERSION"
#distro=$(head -n 1 /etc/os-release |cut -c 6- | sed 's/"//' | sed 's/"//') #old code that doesnt need to import the os-release file
time=$(date +%s)

if [[ -f /usr/bin/pacman ]]; then
    packages=$(pacman -Q | wc -l)
elif [[ -f /usr/bin/apt-cache ]]; then
    packages=$(apt-cache stats | head -n 1 | sed ' s/Total package names: //' | sed 's/ .*//')
elif [[ -f /usr/bin/dnf && $debug == "true" ]]; then
    packages=$(dnf list --installed | wc -l)
elif [[ -f /usr/bin/portage && $debug == "true" ]]; then
    packages=$(emerge -evp --deep world)
fi

if [[ $pkgmeme_flag == "true" ]]; then
    packages="2,147,483,647"
fi
#distro logos made with https://patorjk.com/software/taag/#p=display&f=Slant&t=

if [[ $owo_flag == "true" ]]; then
    printf "\e[35m   ____           ____ \n"
    printf "\e[35m  / __ \_      __/ __ \ \n"
    printf "\e[35m / / / / | /| / / / / /\n"
    printf "\e[35m/ /_/ /| |/ |/ / /_/ / \n"
    printf "\e[35m\____/ |__/|__/\____/  \n"
elif [[ $NAME == "EndeavourOS" && $ascii_flag == "true" ]];
then
    printf "\e[35m     ______     _____\n"
    printf "\e[35m    / ____/___ / ___/\n"
    printf "\e[35m   / __/ / __ \\__ \ \n"
    printf "\e[35m  / /___/ /_/ /__/ / \n"
    printf "\e[35m /_____/\____/____/  \n"
elif [[ $NAME == "Arch Linux" && $ascii_flag == "true" ]];
then
    printf "\e[36m    ____ _______       __\n"
    printf "\e[36m   / __ )_  __/ |     / /\n"
    printf "\e[36m  / __  |/ /  | | /| / / \n"
    printf "\e[36m / /_/ // /   | |/ |/ /  \n"
    printf "\e[36m/_____//_/    |__/|__/   \n"
fi

#distro logos made with https://patorjk.com/software/taag/#p=display&f=Slant&t=
#DEFINING USEFUL VARIBLES
bold=$(tput bold)
normal=$(tput sgr0) 

if [[ $help_flag == "true" ]]; then
    # apduoh
    echo "-a prints a distro ascii"
    echo "-p reports int limit packages"
    echo "-d debug flag (typically does nothing)"
    echo "-u prints unix time"
    echo "-o prints owo ascii"
    echo "-h prints this help message"
else
    main
fi
