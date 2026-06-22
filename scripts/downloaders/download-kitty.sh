#!/bin/bash
set -e

KITTY="$HOME/.config/kitty"

if [[ -d "$KITTY" ]]; then
    n=0
    DEST="$HOME/.config/kitty.old"
    while [[ -d "$DEST" ]]; do
        n=$((n + 1))
        DEST="$HOME/.config/kitty-$n.old"
    done
    mv "$KITTY" "$DEST"
fi

TMPDIR=$(mktemp -d)
git clone --depth=1 https://github.com/transicle/dotfiles "$TMPDIR/dotfiles"
mkdir -p "$KITTY"
cp -r "$TMPDIR/dotfiles/kitty/." "$KITTY/"
rm -rf "$TMPDIR"

echo "Installed to $KITTY"
