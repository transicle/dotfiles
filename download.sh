#!/bin/bash
set -e

REPO="https://raw.githubusercontent.com/transicle/dotfiles/refs/heads/main"

bash <(curl -s "$REPO/scripts/dependencies.sh")
bash <(curl -s "$REPO/scripts/downloaders/download-hypr.sh")
bash <(curl -s "$REPO/scripts/downloaders/download-hyprpaper.sh")
bash <(curl -s "$REPO/scripts/downloaders/download-kitty.sh")

hyprctl reload

read -rp "To fully get things working, you'll need to restart. Continue? [Y/n] " ans
if [[ "${ans,,}" != "n" ]]; then
    systemctl reboot
fi

