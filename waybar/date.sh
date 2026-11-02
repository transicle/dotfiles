#!/usr/bin/env bash
set -Eeuo pipefail

date_text=$(LC_TIME=C date '+%A, %B %-d')
day=${date_text##* }

case "$day" in
    1|21|31) suffix=st ;;
    2|22) suffix=nd ;;
    3|23) suffix=rd ;;
    *) suffix=th ;;
esac

printf '%s%s\n' "$date_text" "$suffix"