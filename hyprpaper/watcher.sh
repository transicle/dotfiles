#!/bin/bash

WALLPAPER_DIR="${HOME}/.config/Wallpapers"
CYCLE_SCRIPT="${HOME}/.config/hyprpaper/wallpaper-cycle.sh"

mkdir -p "$WALLPAPER_DIR"

if ! command -v inotifywait &>/dev/null; then
    echo "watcher: inotifywait not found. Install inotify-tools." >&2
    exit 1
fi

is_image() {
    case "${1,,}" in
        *.jpg|*.jpeg|*.png|*.webp) return 0 ;;
        *) return 1 ;;
    esac
}

start_cycle() {
    if ! pgrep -f "wallpaper-cycle.sh" &>/dev/null; then
        bash "$CYCLE_SCRIPT" &
    fi
}

mapfile -t EXISTING < <(
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
        \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \)
)

if [[ ${#EXISTING[@]} -gt 0 ]]; then
    start_cycle
fi

while IFS= read -r filename; do
    is_image "$filename" || continue
    start_cycle
done < <(inotifywait -m -q -e create,moved_to --format '%f' "$WALLPAPER_DIR")
