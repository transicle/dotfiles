#!/bin/bash
set -u

run() {
    echo "==> $*"
    "$@" || echo "FAILED: $*"
}

run flatpak override --user --filesystem=host
run flatpak override --user --share=network
run flatpak override --user --socket=system-bus
run flatpak override --user --socket=session-bus
run flatpak override --user --device=all
run flatpak override --user --talk-name=org.freedesktop.Flatpak