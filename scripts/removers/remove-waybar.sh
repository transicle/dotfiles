#!/bin/bash
set -e

WAYBAR="$HOME/.config/waybar"
LATEST=""
LATEST_N=-1

if [[ -d "$HOME/.config/waybar.old" ]]; then
    LATEST="$HOME/.config/waybar.old"
fi

for d in "$HOME"/.config/waybar-*.old; do
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

rm -rf "$WAYBAR"
mv "$LATEST" "$WAYBAR"

echo "Restored from $LATEST"
