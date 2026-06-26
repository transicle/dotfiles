#!/bin/bash
set -u

run() {
    echo "==> $*"
    "$@" || echo "FAILED: $*"
}

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
    brightnessctl
    playerctl
    polkit-gnome
    kwallet-pam
    corectrl
    wl-clipboard
    xorg-xrandr
    jq
    git
    snapd
    xdg-user-dirs
)

FLATPAK_DEPS=(
    app.zen_browser.zen
    org.equicord.equibop
)

run sudo pacman -S --needed --noconfirm "${PACMAN_DEPS[@]}"

run sudo systemctl enable --now snapd.socket

if [ ! -e /snap ]; then
    run sudo ln -s /var/lib/snapd/snap /snap
fi

run sudo snap install core
run sudo snap refresh core
run sudo snap install code --classic

if ! command -v flatpak >/dev/null; then
    run sudo pacman -S --needed --noconfirm flatpak
fi

run flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

for pkg in "${FLATPAK_DEPS[@]}"; do
    run flatpak install --noninteractive flathub "$pkg"
done

mkdir -p ~/Downloads && xdg-user-dirs-update
run flatpak override --user --filesystem=xdg-download

if ! command -v ulauncher >/dev/null; then
    TMPDIR=$(mktemp -d)

    run git clone https://aur.archlinux.org/ulauncher.git "$TMPDIR/ulauncher"

    cd "$TMPDIR/ulauncher"

    run makepkg -is --noconfirm

    cd -
    rm -rf "$TMPDIR"
fi