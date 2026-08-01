#!/bin/bash
set -u

run() {
    echo "==> $*"
    "$@" || echo "FAILED: $*"
}

PACMAN_DEPS=(
    waybar
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
    ttf-jetbrains-mono-nerd
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
    xdg-user-dirs
    nvim
    vim
    zsh
    helix
    fastfetch
)

AUR_DEPS=(
    snapd
    ulauncher
)

FLATPAK_DEPS=(
    app.zen_browser.zen
    org.equicord.equibop
)

run sudo pacman -S --needed --noconfirm "${PACMAN_DEPS[@]}"

ZSH_PATH="$(command -v zsh)"

if [[ -n "$ZSH_PATH" ]]; then
    if ! grep -qx "$ZSH_PATH" /etc/shells; then
        echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
    fi

    if [[ "$SHELL" != "$ZSH_PATH" ]]; then
        run chsh -s "$ZSH_PATH"
    else
        echo "==> zsh is already the default shell"
    fi
else
    echo "==> zsh installation failed"
fi

AUR_HELPER=""
if command -v yay >/dev/null; then
    AUR_HELPER="yay"
elif command -v paru >/dev/null; then
    AUR_HELPER="paru"
else
    echo "==> No AUR helper found, bootstrapping yay"
    run sudo pacman -S --needed --noconfirm base-devel

    TMPDIR=$(mktemp -d)
    run git clone https://aur.archlinux.org/yay.git "$TMPDIR/yay"
    (cd "$TMPDIR/yay" && run makepkg -si --noconfirm)
    rm -rf "$TMPDIR"

    if command -v yay >/dev/null; then
        AUR_HELPER="yay"
    fi
fi

aur_install() {
    local pkg="$1"

    if [ -n "$AUR_HELPER" ]; then
        run "$AUR_HELPER" -S --needed --noconfirm "$pkg"
    else
        echo "==> No AUR helper available, building $pkg manually"

        local tmpdir
        tmpdir=$(mktemp -d)

        run git clone "https://aur.archlinux.org/$pkg.git" "$tmpdir/$pkg"
        (cd "$tmpdir/$pkg" && run makepkg -si --noconfirm)

        rm -rf "$tmpdir"
    fi
}

for pkg in "${AUR_DEPS[@]}"; do
    if ! command -v "$pkg" >/dev/null 2>&1; then
        aur_install "$pkg"
    else
        echo "==> $pkg already installed, skipping"
    fi
done

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

mkdir -p ~/Downloads
xdg-user-dirs-update

run flatpak override --user --filesystem=xdg-download

echo "==> Setup complete"
echo "==> Default shell: $ZSH_PATH"
echo "==> Log out and back in for zsh to apply"
