#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$DIR/scripts/removers/remove-hyprpaper.sh"
bash "$DIR/scripts/removers/remove-hypr.sh"

