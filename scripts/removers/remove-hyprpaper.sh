#!/bin/bash
set -e

pkill -f "wallpaper-cycle.sh" 2>/dev/null || true
pkill -f "watcher.sh" 2>/dev/null || true

rm -rf "$HOME/.config/hyprpaper"

echo "Removed ~/.config/hyprpaper"
