#!/bin/bash
set -e

KITTY="$HOME/.config/kitty"

TMPDIR=$(mktemp -d)
git clone --depth=1 https://github.com/transicle/dotfiles "$TMPDIR/dotfiles"
mkdir -p "$KITTY"
cp -r "$TMPDIR/dotfiles/kitty/." "$KITTY/"
rm -rf "$TMPDIR"

echo "Installed to $KITTY"
