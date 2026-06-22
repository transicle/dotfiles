#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$DIR/scripts/downloaders/download-hypr.sh"
bash "$DIR/scripts/downloaders/download-hyprpaper.sh"

