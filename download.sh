#!/bin/bash
set -e

if ! command -v hyprctl &>/dev/null; then
    echo "hyprctl not found. Is Hyprland installed?"
    exit 1
fi

VERSION=$(hyprctl version | grep -oP 'v\K[0-9]+\.[0-9]+' | head -1)
MAJOR=$(echo "$VERSION" | cut -d. -f1)
MINOR=$(echo "$VERSION" | cut -d. -f2)

if [[ "$MAJOR" -lt 0 ]] || { [[ "$MAJOR" -eq 0 ]] && [[ "$MINOR" -lt 55 ]]; }; then
    echo "Hyprland 0.55.x or above is required (found $VERSION)"
    exit 1
fi

if ! command -v git &>/dev/null; then
    sudo pacman -S --noconfirm git
fi

HYPR="$HOME/.config/hypr"

if [[ -d "$HYPR" ]]; then
    n=0
    DEST="$HOME/.config/hypr.old"
    while [[ -d "$DEST" ]]; do
        n=$((n + 1))
        DEST="$HOME/.config/hypr-$n.old"
    done
    mv "$HYPR" "$DEST"
fi

TMPDIR=$(mktemp -d)
git clone --depth=1 https://github.com/transicle/dotfiles "$TMPDIR/dotfiles"
mkdir -p "$HYPR"
cp -r "$TMPDIR/dotfiles/hyprland/." "$HYPR/"
cp -r "$TMPDIR/dotfiles/hyprpaper/." "$HYPR/"
chmod +x "$HYPR/wallpaper-cycle.sh"
chmod +x "$HYPR/watcher.sh"
mkdir -p "$HOME/.config/Wallpapers"
rm -rf "$TMPDIR"

echo "Installed to $HYPR"

echo "Starting hyprpaper scripts..."
nohup "$HYPR/wallpaper-cycle.sh" &>/dev/null &
nohup "$HYPR/watcher.sh" &>/dev/null &
