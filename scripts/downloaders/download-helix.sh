#!/bin/bash
set -e

HELIX="$HOME/.config/helix"

if [[ -d "$HELIX" ]]; then
    n=0
    DEST="$HOME/.config/helix.old"
    while [[ -d "$DEST" ]]; do
        n=$((n + 1))
        DEST="$HOME/.config/helix-$n.old"
    done
    mv "$HELIX" "$DEST"
fi

TMPDIR=$(mktemp -d)
git clone --depth=1 https://github.com/transicle/dotfiles "$TMPDIR/dotfiles"
mkdir -p "$HELIX"
cp -r "$TMPDIR/dotfiles/helix/." "$HELIX/"
rm -rf "$TMPDIR"

echo "Installed to $HELIX"
