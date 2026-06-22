#!/bin/bash
set -e

HYPRPAPER="$HOME/.config/hyprpaper"

TMPDIR=$(mktemp -d)
git clone --depth=1 https://github.com/transicle/dotfiles "$TMPDIR/dotfiles"
mkdir -p "$HYPRPAPER"
cp -r "$TMPDIR/dotfiles/hyprpaper/." "$HYPRPAPER/"
chmod +x "$HYPRPAPER/wallpaper-cycle.sh"
chmod +x "$HYPRPAPER/watcher.sh"
mkdir -p "$HOME/.config/Wallpapers"
rm -rf "$TMPDIR"

echo "Installed to $HYPRPAPER"

echo "Starting hyprpaper scripts..."
nohup "$HYPRPAPER/wallpaper-cycle.sh" &>/dev/null &
nohup "$HYPRPAPER/watcher.sh" &>/dev/null &
