#!/bin/bash
set -e

REPO="https://raw.githubusercontent.com/transicle/dotfiles/refs/heads/main"

bash <(curl -s "$REPO/scripts/dependencies.sh")
bash <(curl -s "$REPO/scripts/downloaders/download-hypr.sh")
bash <(curl -s "$REPO/scripts/downloaders/download-hyprpaper.sh")
bash <(curl -s "$REPO/scripts/downloaders/download-kitty.sh")

