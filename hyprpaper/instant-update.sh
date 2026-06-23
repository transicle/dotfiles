#!/bin/bash

WALLPAPER_DIR="${HOME}/.config/Wallpapers"

mapfile -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
        \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) \
    | sort
)

if [[ ${#WALLPAPERS[@]} -eq 0 ]]; then
    echo "instant-update: no images found in $WALLPAPER_DIR" >&2
    exit 1
fi

WALLPAPER="${WALLPAPERS[0]}"

hyprctl hyprpaper preload "$WALLPAPER"

while IFS= read -r monitor; do
    hyprctl hyprpaper wallpaper "$monitor,$WALLPAPER"
done < <(hyprctl monitors -j | grep -oP '"name":\s*"\K[^"]+')
