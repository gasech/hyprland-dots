# 🌌 Hyprland Dotfiles 
These are my config files for Hyprland + Wayland, feel free to copy anything! :)

![Hyprland Logo](https://hyprland.org/imgs/hyprland.png)

## Sections
<!-- vim-markdown-toc Marked -->

* [Requirements](#requirements)
* [Installation Guide](#installation-guide)
  * [Installing yay](#installing-yay)
  * [Setting up Hyprland](#setting-up-hyprland)
  * [Downloading apps](#downloading-apps)
  * [Setting up zsh + zap](#setting-up-zsh-+-zap)
* [Stow](#stow)
* [Setting up Nerd fonts](#setting-up-nerd-fonts)
* [Credits](#credits)

<!-- vim-markdown-toc -->

## Requirements
* Fresh installed Arch Linux 
* Archinstall with Sway Profile and Pulse Audio (Not really a requirement, I usually just run these setting before installing Hyprland)

## Installation Guide 
`⚠️ Important: This installation guide is for future self. Some steps might not be completed, updated or even tested. Proceed if you know at you are doing.`

### Installing yay
This part is optional, you can use pacman or paru, I like yay.

```bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# delete yay files after the completion (optional) 
cd .. && rm -rf yay
```

### Setting up Hyprland
Please read this before installing if you are using a [Nvidia GPU](https://wiki.hyprland.org/Nvidia/) 

```bash
# Hyprland + Wayland: hyprland-git
# Status Bar: waybar-hyprland-git
# Wallpapers: hyprpaper-git
# XDG Desktop Portal: xdg-desktop-portal-hyprland-git 

yay -S hyprland-git hyprpaper-git waybar-hyprland-git xdg-desktop-portal-hyprland-git
```

Create a wrapper to execute Hyprland 
```bash 
vim ~/.local/bin/wrappedhl
```
Inside *wrappedh1*
```bash
#!/bin/env sh

# uncomment the next two lines if you are installing in a virtual machine.
# export WLR_NO_HARDWARE_CURSORS=1
# export WLR_RENDERER_ALLOW_SOFTWARE=1

# log WLR errors and logs to the hyprland log, usually recommended 
export HYPRLAND_LOG_WLR=1

# tell XWayland to use a cursor theme
export XCURSOR_THEME=Bibata-Modern-Classic

# set a cursor size
export XCURSOR_SIZE=24

exec Hyprland
```

Now you can execute `wrappedh1` and Hyprland should start "normally" with its default settings. 

You can stop the script by pressing `Super + M` or open kitty with `Super + Q`

### Downloading apps
If you are interested in alternatives for some of these programs, you can go to [awesome-hyprland](https://github.com/hyprland-community/awesome-hyprland) list. 
```bash
# Audio: pavucontrol, pamixer
# Authentication Agent: polkit-kde-agent
# Emojis: noto-fonts-emoji
# Launcher: rofi 
# File Manager: thunar, ffmpegthumbnailer, thunar-archive-plugin, file-roller
# Notifications: dunst
# RSS Feed Reader: newsboat
# Terminal: kitty, zsh, exa 
# Screenshot: grimblast-git
# Screen Lock Utility: swaylock, wlogout

yay -S thunar ffmpegthumbnailer thunar-archive-plugin file-roller rofi polkit-kde-agent dunst noto-fonts-emoji pavucontrol pamixer kitty newsboat exa zsh grimblast-git swaylock wlogout
```

### Setting up zsh + zap 
I like using zsh with zap because it's simple and fast to setup everything.

```bash
chsh -s $(which zsh)
# restart terminal then use 
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
```

## Stow 
Stow is a nice way of creating symlinks (Symbolic Links) according to the tree of the target, so you can use stow to quickly copy any config. 

Installing stow
```bash
yay -S stow
cd ~ # make sure you are in home directory before cloning this repo
git clone https://github.com/gasech/arrozada.git
cd arrozada
```

Stowing configs
```bash
stow zsh # stows only zsh
stow kitty newsboat # multiple stow 
```

Or just stow everything
```bash
stow */ # stows anything that is in a folder e.g ignores README.md
```

## Setting up Nerd fonts
Nerd fonts allows you to have nice unicode icons and they look really nice. I personally use CascadiaCode and that's how I install them:

```
mkdir -p $HOME/Downloads/nerdfonts/
cd $HOME/Downloads/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.1/CascadiaCode.zip
unzip '*.zip' -d $HOME/Downloads/nerdfonts/
rm -rf *.zip
sudo cp -R $HOME/Downloads/nerdfonts/ /usr/share/fonts/
```

## Credits 
[linuxmobile's hyprland dotfiles](https://github.com/linuxmobile/hyprland-dots)
[Chris Titus Tech's hyprland dotfiles](https://github.com/ChrisTitusTech/hyprland-titus/)

