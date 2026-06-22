#!/bin/bash
set -e

REPO="https://raw.githubusercontent.com/transicle/dotfiles/refs/heads/main"

bash <(curl -s "$REPO/scripts/removers/remove-hyprpaper.sh")
bash <(curl -s "$REPO/scripts/removers/remove-hypr.sh")
bash <(curl -s "$REPO/scripts/removers/remove-kitty.sh")

