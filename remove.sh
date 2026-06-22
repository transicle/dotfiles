#!/bin/bash
set -e

HYPR="$HOME/.config/hypr"
LATEST=""
LATEST_N=-1

if [[ -d "$HOME/.config/hypr.old" ]] && [[ $LATEST_N -lt 0 ]]; then
    LATEST="$HOME/.config/hypr.old"
fi

for d in "$HOME"/.config/hypr-*.old; do
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

# Stop the wallpaper cycle script if running
pkill -f "wallpaper-cycle.sh" 2>/dev/null || true

rm -rf "$HYPR"
mv "$LATEST" "$HYPR"

echo "Restored from $LATEST"
