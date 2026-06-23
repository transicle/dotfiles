#!/bin/bash
set -e

HYPRPAPER="$HOME/.config/hyprpaper"

if [[ -d "$HYPRPAPER" ]]; then
    n=0
    DEST="$HOME/.config/hyprpaper.old"
    while [[ -d "$DEST" ]]; do
        n=$((n + 1))
        DEST="$HOME/.config/hyprpaper-$n.old"
    done
    mv "$HYPRPAPER" "$DEST"
fi

TMPDIR=$(mktemp -d)
git clone --depth=1 https://github.com/transicle/dotfiles "$TMPDIR/dotfiles"
mkdir -p "$HYPRPAPER"
cp -r "$TMPDIR/dotfiles/hyprpaper/." "$HYPRPAPER/"
chmod +x "$HYPRPAPER/wallpaper-cycle.sh"
mkdir -p "$HOME/.config/Wallpapers"
rm -rf "$TMPDIR"

echo "Installed to $HYPRPAPER"

echo "Starting hyprpaper scripts..."
nohup "$HYPRPAPER/wallpaper-cycle.sh" &>/dev/null &
