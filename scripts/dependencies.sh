#!/bin/bash
set -e

PACMAN_DEPS=(
    hyprland
    hyprpaper
    xdg-desktop-portal-hyprland
    kitty
    dolphin
    swaync
    copyq
    grim
    slurp
    inotify-tools
    easyeffects
    pipewire
    pipewire-alsa
    pipewire-pulse
    wireplumber
    polkit-gnome
    kwallet-pam
    corectrl
    wl-clipboard
    xorg-xrandr
    jq
    git
    snapd
)

FLATPAK_DEPS=(
    app.zen_browser.zen
    org.equicord.equibop
)

sudo pacman -S --needed --noconfirm "${PACMAN_DEPS[@]}" 2>/dev/null

sudo systemctl enable --now snapd.socket

if [ ! -e /snap ]; then
    sudo ln -s /var/lib/snapd/snap /snap
fi

sudo snap install core 2>/dev/null || true
sudo snap refresh core 2>/dev/null || true
sudo snap install code --classic 2>/dev/null || true

if ! command -v flatpak &>/dev/null; then
    sudo pacman -S --needed --noconfirm flatpak 2>/dev/null
fi

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true

for pkg in "${FLATPAK_DEPS[@]}"; do
    flatpak install --noninteractive flathub "$pkg" 2>/dev/null || true
done

if ! command -v ulauncher &>/dev/null; then
    TMPDIR=$(mktemp -d)
    git clone https://aur.archlinux.org/ulauncher.git "$TMPDIR/ulauncher"
    cd "$TMPDIR/ulauncher" && makepkg -is --noconfirm
    cd - && rm -rf "$TMPDIR"
fi

flatpak override --user --filesystem=xdg-download