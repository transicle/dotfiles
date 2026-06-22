#!/bin/bash

WALLPAPER_DIR="${HOME}/.config/Wallpapers"
INTERVAL=3600  # 1 hour

for i in $(seq 1 30); do
    hyprctl hyprpaper listloaded &>/dev/null && break
    sleep 1
done

mapfile -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
        \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) \
    | sort
)

if [[ ${#WALLPAPERS[@]} -eq 0 ]]; then
    echo "wallpaper-cycle: no images found in $WALLPAPER_DIR" >&2
    exit 1
fi

INDEX=0
PREV=""

while true; do
    CURRENT="${WALLPAPERS[$INDEX]}"

    hyprctl hyprpaper preload "$CURRENT" &>/dev/null

    while IFS= read -r monitor; do
        hyprctl hyprpaper wallpaper "$monitor,$CURRENT" &>/dev/null
    done < <(hyprctl monitors -j | jq -r '.[].name')

    if [[ -n "$PREV" ]]; then
        hyprctl hyprpaper unload "$PREV" &>/dev/null
    fi

    PREV="$CURRENT"
    INDEX=$(( (INDEX + 1) % ${#WALLPAPERS[@]} ))

    sleep "$INTERVAL"
done
