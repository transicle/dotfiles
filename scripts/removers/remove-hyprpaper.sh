#!/bin/bash
set -e

HYPRPAPER="$HOME/.config/hyprpaper"
LATEST=""
LATEST_N=-1

pkill -f "wallpaper-cycle.sh" 2>/dev/null || true
pkill -f "watcher.sh" 2>/dev/null || true

if [[ -d "$HOME/.config/hyprpaper.old" ]]; then
    LATEST="$HOME/.config/hyprpaper.old"
fi

for d in "$HOME"/.config/hyprpaper-*.old; do
    [[ -d "$d" ]] || continue
    n=$(basename "$d" | grep -oP '\d+(?=\.old)')
    if [[ "$n" -gt "$LATEST_N" ]]; then
        LATEST_N="$n"
        LATEST="$d"
    fi
done

if [[ -z "$LATEST" ]]; then
    echo "No backup found."
    exit 1
fi

rm -rf "$HYPRPAPER"
mv "$LATEST" "$HYPRPAPER"

echo "Restored from $LATEST"
