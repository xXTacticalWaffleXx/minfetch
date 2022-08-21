<h1 align="center"> 
MinFetch
</h1>

<p align="center"> <img src="https://www.gnu.org/graphics/gplv3-with-text-84x42.png" alt="GPLv3 logo"></center>

MinFetch is meant to be an easily customisable and clean fetch.
As is the UNIX™ "fuck bloat" "if you have more then 2 packages
you dont deserve computers" way it doesnt have a config file
you edit the code yourself (dw its dead easy and you can legit
shoot me an email if you need help lmao). It also has multiple
different switches to control its output out of the box.

## Installation

run

```curl https://raw.githubusercontent.com/xXTacticalWaffleXx/minfetch/main/fetch.sh > fetch.sh && chmod +x ./fetch.sh```

to download it, to run it just do ./fetch.sh

ill release it on the AUR in 3-5 buisness days but i would recomend just downloading the script becuase its easy to modify this way

## Picture

<img src="https://cdn.discordapp.com/attachments/799848965905842197/1010810791726940190/unknown.png" alt="a picture of the script being ran">

## Switches

-a is used to add ascii art for your distro of choice

-o adds an OwO graphic where the distro ascii goes

-p sets the packages to the 32 bit signed integer limit

-d is a debug flag that normally does nothing

-u adds a unix time field if you want one for some reason

-h prints a help message

## Customization

most edits you would want to make are really easy

if you want to make it not report something like your kernal,
comment the echo line needed for the kernal

if you want to fix the way it gets some info say your distro name
find the line of code responsible for grabing that info and
change the command

want to add more info
make another echo command with a matching varible declaration
(or just cheat and make it echo whatever string you want
XDDDDDDDDD)

## Contributing
make ur changes, make a pr and shoot me an email or a disc msg that u made it and ill prolly merge it

## Contact

email: luna-aphelion@proton.me
discord: tactical-waffle#1560
