#!/bin/bash
yes | sudo pacman -Syy
yes | sudo pacman -S pulseaudio fish pipewire xdg-desktop-portal-gnome papirus-icon-theme btop mpv wine pipewire-pulse flatpak pipewire-alsa pipewire-jack wireplumber swww ttf-jetbrains-mono-nerd viewnior ttf-font-awesome otf-font-awesome gnome-themes-extra niri-settings-git alacritty mako swaybg swaylock waybar xwayland-satellite thunar nwg-look xdg-desktop-portal-gtk
cd ~/
git clone https://aur.archlinux.org/packages/yay
cd yay
makepkg -si
cd ~/
yay -S zen-browser-bin pipes.sh
cd ~/DC4N
cp -r wallpapers/ ~/
cp -r .config/ ~/
chsh -s $(which fish)
clear
echo "Minimal install is end."