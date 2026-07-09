#!/bin/bash
set -e

WAYBAR="$HOME/.config/waybar"

if [[ -d "$WAYBAR" ]]; then
    n=0
    DEST="$HOME/.config/waybar.old"
    while [[ -d "$DEST" ]]; do
        n=$((n + 1))
        DEST="$HOME/.config/waybar-$n.old"
    done
    mv "$WAYBAR" "$DEST"
fi

TMPDIR=$(mktemp -d)
git clone --depth=1 https://github.com/transicle/dotfiles "$TMPDIR/dotfiles"
mkdir -p "$WAYBAR"
cp -r "$TMPDIR/dotfiles/waybar/." "$WAYBAR/"
rm -rf "$TMPDIR"

echo "Installed to $WAYBAR"