#!/usr/bin/env bash
set -u

ipc_path='xdg-run/discord-ipc-0'
target_home=${HOME:-}

if [[ -n ${SUDO_USER:-} ]]; then
    passwd_entry=$(getent passwd "$SUDO_USER" 2>/dev/null || true)
    if [[ -n $passwd_entry ]]; then
        IFS=: read -r _ _ _ _ _ target_home _ <<< "$passwd_entry"
    fi
fi

if [[ -z $target_home ]]; then
    printf 'Cannot determine the target user home directory.\n' >&2
    exit 1
fi

if [[ -n ${SUDO_USER:-} ]]; then
    data_home="$target_home/.local/share"
    config_home="$target_home/.config"
else
    data_home=${XDG_DATA_HOME:-"$target_home/.local/share"}
    config_home=${XDG_CONFIG_HOME:-"$target_home/.config"}
fi

declare -A seen=()
overrides=(
    "$data_home/flatpak/overrides/global"
    "$config_home/flatpak/overrides/global"
    /etc/flatpak/overrides/global
    /var/lib/flatpak/overrides/global
)

changed=0
blocked=0

for override in "${overrides[@]}"; do
    [[ -f $override ]] || continue

    resolved=$(readlink -f -- "$override" 2>/dev/null) || resolved=$override
    [[ -n ${seen[$resolved]+x} ]] && continue
    seen[$resolved]=1

    temp_file=$(mktemp "${resolved}.tmp.XXXXXX" 2>/dev/null) || {
        printf 'Cannot create a temporary file beside %s; rerun with sufficient permissions.\n' "$resolved" >&2
        blocked=1
        continue
    }

    if ! awk -v target="$ipc_path" '
        BEGIN { in_context = 0 }
        {
            line = $0
            if (line ~ /^[[:space:]]*\[/) {
                in_context = (line ~ /^[[:space:]]*\[Context\][[:space:]]*([;#].*)?$/)
            }
            if (in_context && line ~ /^[[:space:]]*filesystems[[:space:]]*=/) {
                equals = index(line, "=")
                prefix = substr(line, 1, equals)
                value = substr(line, equals + 1)
                count = split(value, entries, ";")
                result = ""
                kept = 0
                for (i = 1; i <= count; i++) {
                    item = entries[i]
                    clean = item
                    sub(/^[[:space:]]+/, "", clean)
                    sub(/[[:space:]]+$/, "", clean)
                    if (clean == target || index(clean, target ":") == 1) {
                        continue
                    }
                    if (kept) result = result ";"
                    result = result item
                    kept = 1
                }
                line = prefix result
            }
            print line
        }
    ' "$resolved" > "$temp_file"; then
        rm -f -- "$temp_file"
        printf 'Could not process %s.\n' "$resolved" >&2
        blocked=1
        continue
    fi

    if cmp -s -- "$resolved" "$temp_file"; then
        rm -f -- "$temp_file"
        continue
    fi

    if ! chmod --reference="$resolved" "$temp_file" ||
       { [[ $EUID -eq 0 ]] && ! chown --reference="$resolved" "$temp_file"; } ||
       ! mv -f -- "$temp_file" "$resolved"; then
        rm -f -- "$temp_file"
        printf 'Could not update %s; rerun with sufficient permissions.\n' "$resolved" >&2
        blocked=1
        continue
    fi

    printf 'Removed %s from %s\n' "$ipc_path" "$override"
    changed=1
done

if [[ $blocked -ne 0 ]]; then
    exit 1
elif [[ $changed -eq 0 ]]; then
    printf 'No conflicting %s grant found in global Flatpak overrides.\n' "$ipc_path"
else
    printf 'Done. Equibop private runtime access and the tmpfiles symlink were left unchanged.\n'
fi
