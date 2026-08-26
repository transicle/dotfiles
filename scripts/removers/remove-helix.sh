#!/bin/bash
set -e

HELIX="$HOME/.config/helix"
LATEST=""
LATEST_N=-1

if [[ -d "$HOME/.config/helix.old" ]]; then
    LATEST="$HOME/.config/helix.old"
fi

for d in "$HOME"/.config/helix-*.old; do
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

rm -rf "$HELIX"
mv "$LATEST" "$HELIX"
echo "Restored from $LATEST"
