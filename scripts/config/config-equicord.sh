#!/bin/bash
set -e

TMPDIR=$(mktemp -d)

git clone --depth=1 https://github.com/transicle/dotfiles "$TMPDIR/dotfiles"

DEST="$HOME/.var/app/org.equicord.equibop/config/equibop/settings"
mkdir -p "$DEST"

cp -f "$TMPDIR/dotfiles/equibop/settings.json" "$DEST/settings.json"

rm -rf "$TMPDIR"

echo "Installed to $DEST/settings.json"