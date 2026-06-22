local PLATFORM       = "wayland;xcb"
local PLATFORM_THEME = "kde"
local CURSOR_THEME   = "volantes"
local CURSOR_SIZE    = "24"
local GTK_THEME      = "Breeze-Dark"
local MENU_PREFIX    = "arch-"

hl.env("QT_QPA_PLATFORM",      PLATFORM)
hl.env("QT_QPA_PLATFORMTHEME", PLATFORM_THEME)
hl.env("XCURSOR_THEME",        CURSOR_THEME)
hl.env("XCURSOR_SIZE",         CURSOR_SIZE)
hl.env("GTK_THEME",            GTK_THEME)
hl.env("XDG_MENU_PREFIX",      MENU_PREFIX)