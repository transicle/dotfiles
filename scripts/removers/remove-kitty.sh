#!/bin/bash
set -e

KITTY="$HOME/.config/kitty"
LATEST=""
LATEST_N=-1

if [[ -d "$HOME/.config/kitty.old" ]]; then
    LATEST="$HOME/.config/kitty.old"
fi

for d in "$HOME"/.config/kitty-*.old; do
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

rm -rf "$KITTY"
mv "$LATEST" "$KITTY"

echo "Restored from $LATEST"
