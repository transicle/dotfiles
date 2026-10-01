#!/bin/bash
set -e

ZSHRC="$HOME/.zshrc"
SRC_PATH=".zshrc"

if [[ -e "$ZSHRC" || -L "$ZSHRC" ]]; then
    n=0
    DEST="$HOME/.zshrc.old"
    while [[ -e "$DEST" || -L "$DEST" ]]; do
        n=$((n + 1))
        DEST="$HOME/.zshrc-$n.old"
    done
    mv "$ZSHRC" "$DEST"
    echo "Backed up existing .zshrc to $DEST"
fi

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

git clone --depth=1 https://github.com/transicle/dotfiles "$TMPDIR/dotfiles"
cp "$TMPDIR/dotfiles/$SRC_PATH" "$ZSHRC"

echo "Installed to $ZSHRC"
