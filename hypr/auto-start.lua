local XDG_PORTAL         = "~/.config/hypr/xdg-portal-hyprland"
local DBUS_ENV           = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
local SYSTEMCTL_ENV      = "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
local POLKIT             = "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
local SWAYNC             = "swaync"
local SWAYNC_MONITOR     = "swaync-client --change-noti-monitor HDMI-A-1"
local ULAUNCHER          = "ulauncher --hide-window --no-window-shadow"
local MOUNT_GDRIVE       = "~/.scripts/mount_gdrive.sh"
local KWALLET            = "/usr/lib/pam_kwallet_init"
local CORECTRL           = "corectrl --minimize-systray"
local COPYQ              = "copyq"
local EASYEFFECTS        = "easyeffects --hide-window"
local XRANDR_PRIMARY     = "xrandr --output HDMI-A-1 --primary"
local WALLPAPER          = "hyprpaper"
local WALLPAPER_CYCLE    = "bash ~/.config/hyprpaper/wallpaper-cycle.sh"
local WALLPAPER_INSTANT  = "bash ~/.config/hyprpaper/instant-update.sh"

local function exec(name, cmd)
    local ok, err = pcall(hl.exec_cmd, cmd)
    if not ok then
        hl.log_error(("[autostart] failed to run %s (%s): %s"):format(name, cmd, err))
    end
end

hl.on("hyprland.start", function()
    exec("XDG_PORTAL", XDG_PORTAL)
    exec("DBUS_ENV", DBUS_ENV)
    exec("SYSTEMCTL_ENV", SYSTEMCTL_ENV)
    exec("POLKIT", POLKIT)
    exec("SWAYNC", SWAYNC)
    exec("SWAYNC_MONITOR", SWAYNC_MONITOR)
    exec("ULAUNCHER", ULAUNCHER)
    exec("MOUNT_GDRIVE", MOUNT_GDRIVE)
    exec("KWALLET", KWALLET)
    exec("CORECTRL", CORECTRL)
    exec("COPYQ", COPYQ)
    exec("EASYEFFECTS", EASYEFFECTS)
    exec("XRANDR_PRIMARY", XRANDR_PRIMARY)
    exec("WALLPAPER", WALLPAPER)
    exec("WALLPAPER_CYCLE", WALLPAPER_CYCLE)
    exec("WALLPAPER_INSTANT", WALLPAPER_INSTANT)
end)