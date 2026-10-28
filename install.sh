#!/bin/env bash
cd ~/
sudo pacman -Syu --needed base-devel git go

echo "installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd && rm -rf yay

"install desktop environment/window manager..."
yay --needed stow ly sway swaybg mako fuzzel waybar ghostty fish zoxide eza starship tmux neovim zen-browser-bin
mkdir -p ~/.config
cd ~/dots
stow .
chsh -s /bin/fish
sudo systemctl enable ly@tty2.service

"install fonts..."
yay --needed ttf-jetbrains-mono ttf-jetbrains-mono-nerd

"install development tools..."
yay --needed clang gopls lua-language-server odin ols rustup basedpyright ruff wget curl

"install gaming applications..."
yay --needed steam gamemode gamescope mangohud asusctl
