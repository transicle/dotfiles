#!/bin/bash
set -e

VERSION=$(hyprctl version 2>/dev/null | grep -oP 'v\K[0-9]+\.[0-9]+' | head -1)
MAJOR=$(echo "$VERSION" | cut -d. -f1)
MINOR=$(echo "$VERSION" | cut -d. -f2)

if [[ -n "$VERSION" ]] && { [[ "$MAJOR" -lt 0 ]] || { [[ "$MAJOR" -eq 0 ]] && [[ "$MINOR" -lt 55 ]]; }; }; then
    echo "Hyprland 0.55.x or above is required (found $VERSION)"
    exit 1
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
cp -r "$TMPDIR/dotfiles/hypr/." "$HYPR/"
rm -rf "$TMPDIR"

echo "Installed to $HYPR"
