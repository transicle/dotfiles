#!/bin/bash
set -e

PACMAN_DEPS=(
    hyprland
    hyprpaper
    xdg-desktop-portal-hyprland
    kitty
    dolphin
    swaync
    ulauncher
    copyq
    grim
    slurp
    inotify-tools
    easyeffects
    pipewire
    pipewire-alsa
    pipewire-pulse
    pipewire-jack
    wireplumber
    polkit-gnome
    kwallet-pam
    corectrl
    wl-clipboard
    xorg-xrandr
    jq
    git
)

FLATPAK_DEPS=(
    app.zen_browser.zen
    org.equicord.equibop
)

sudo pacman -S --needed --noconfirm "${PACMAN_DEPS[@]}"

if ! command -v flatpak &>/dev/null; then
    sudo pacman -S --needed --noconfirm flatpak
fi

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
for pkg in "${FLATPAK_DEPS[@]}"; do
    flatpak install --noninteractive flathub "$pkg" || true
done