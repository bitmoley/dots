#!/bin/env bash
 
cd ~/
sudo pacman -Syu --needed base-devel git go

echo "Install yay (AUR helper)"
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd && rm -rf yay

yay -Sy --needed stow ly sway swaybg mako fuzzel waybar ghostty fish zoxide eza starship tmux neovim zen-browser-bin

mkdir -p ~/.config
cd ~/dots/.config
cp -r * ~/.config

chsh -s /bin/fish
sudo systemctl enable ly@tty2.service
