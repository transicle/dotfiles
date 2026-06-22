local XDG_PORTAL     = "~/.config/hypr/xdg-portal-hyprland"
local DBUS_ENV       = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
local SYSTEMCTL_ENV  = "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
local POLKIT         = "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
local SWAYNC         = "swaync"
local SWAYNC_MONITOR = "swaync-client --change-noti-monitor HDMI-A-1"
local WAYBAR         = "waybar"
local ULAUNCHER      = "ulauncher --hide-window --no-window-shadow"
local MOUNT_GDRIVE   = "~/.scripts/mount_gdrive.sh"
local KWALLET        = "/usr/lib/pam_kwallet_init"
local CORECTRL       = "corectrl --minimize-systray"
local COPYQ          = "copyq"
local EASYEFFECTS    = "easyeffects --hide-window"
local XRANDR_PRIMARY = "xrandr --output HDMI-A-1 --primary"
local WALLPAPER       = "hyprpaper"
local WALLPAPER_CYCLE = "~/.config/hyprpaper/wallpaper-cycle.sh"
local WALLPAPER_WATCH = "~/.config/hyprpaper/watcher.sh"

hl.on("hyprland.start", function()
    hl.exec_cmd(XDG_PORTAL)
    hl.exec_cmd(DBUS_ENV)
    hl.exec_cmd(SYSTEMCTL_ENV)
    hl.exec_cmd(POLKIT)
    hl.exec_cmd(SWAYNC)
    hl.exec_cmd(SWAYNC_MONITOR)
    hl.exec_cmd(WAYBAR)
    hl.exec_cmd(ULAUNCHER)
    hl.exec_cmd(POLKIT)
    hl.exec_cmd(MOUNT_GDRIVE)
    hl.exec_cmd(KWALLET)
    hl.exec_cmd(CORECTRL)
    hl.exec_cmd(COPYQ)
    hl.exec_cmd(EASYEFFECTS)
    hl.exec_cmd(XRANDR_PRIMARY)
    hl.exec_cmd(WALLPAPER_CYCLE)
    hl.exec_cmd(WALLPAPER_WATCH)
end)

hl.exec_cmd(WALLPAPER)
