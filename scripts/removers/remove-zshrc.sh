#!/bin/bash
set -e

ZSHRC="$HOME/.zshrc"
LATEST=""
LATEST_N=-1

if [[ -e "$HOME/.zshrc.old" || -L "$HOME/.zshrc.old" ]]; then
    LATEST="$HOME/.zshrc.old"
fi

for f in "$HOME"/.zshrc-*.old; do
    [[ -e "$f" || -L "$f" ]] || continue
    n=$(basename "$f" | grep -oP '\d+(?=\.old)')
    if [[ "$n" -gt "$LATEST_N" ]]; then
        LATEST_N="$n"
        LATEST="$f"
    fi
done

if [[ -z "$LATEST" ]]; then
    echo "No backup found."
    exit 1
fi

rm -f "$ZSHRC"
mv "$LATEST" "$ZSHRC"
echo "Restored from $LATEST"
