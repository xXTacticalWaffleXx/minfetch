<h1 align="center"> 
MinFetch
</h1>

<p align="center"> 
<img src="https://www.gnu.org/graphics/gplv3-with-text-84x42.png" alt="GPLv3 logo">
<a href="https://aur.archlinux.org/packages/minfetch">
<img src="https://raw.githubusercontent.com/xXTacticalWaffleXx/minfetch/main/aur.png" alt="get it on the aur">
</a>
</p>

MinFetch is meant to be an easily customisable and clean fetch.
As is the UNIX™ "fuck bloat" "if you have more than 2 packages
you don't deserve computers" way it doesn't have a config file
you edit the code yourself (dw its dead easy, and you can legit
shoot me an email if you need help lmao). It also has multiple
different switches to control its output out of the box.

## Installation

run

```bash
curl https://raw.githubusercontent.com/xXTacticalWaffleXx/minfetch/main/minfetch > minfetch && chmod +x ./minfetch
```

to download it, to run it just do ./minfetch

## Picture

<img src="https://cdn.discordapp.com/attachments/799848965905842197/1010810791726940190/unknown.png" alt="a picture of the script being ran">

## Switches

-a is used to add ascii art for your distro of choice

-o adds an OwO graphic where the distro ascii goes

-p sets the packages to the 32-bit signed integer limit

-d is a debug flag that normally does nothing

-u adds a unix time field if you want one for some reason

-h prints a help message

-e enables experimental code, in this case fedora and gentoo package counts

## Customization

most edits you would want to make are really easy

if you want to make it not report something like your kernel, comment the echo line needed for the kernel

if you want to fix the way it gets some info say your distro name, find the line of code responsible for grabbing that
info and change the command

want to add more info
make another echo command with a matching varible declaration
(or just cheat and make it echo whatever string you want XDDDDDDDDD)

## Contributing

make ur changes, make a pr and shoot me an email or a disc msg that u made it, and I'll prolly merge it

if you are on any distro that doesn't use apt or pacman please get in touch if you are ok with helping me add
compatability with more distros
all I need is for you to tell me where the package manager binary is located, the list command and then to try running
the script yourself

## Contact

email: luna-aphelion@proton.me
discord: tactical-waffle#1560

## Footnotes

get it on the AUR button is under the Creative Commons Attribution-ShareAlike 4.0 International License.
