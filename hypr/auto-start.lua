local XDG_PORTAL         = "~/.config/hypr/xdg-portal-hyprland"
local DBUS_ENV           = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
local SYSTEMCTL_ENV      = "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
local POLKIT             = "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
local SWAYNC             = "swaync"
local SWAYNC_MONITOR     = "swaync-client --change-noti-monitor HDMI-A-1"
local ULAUNCHER          = "ulauncher --hide-window --no-window-shadow"
local MOUNT_GDRIVE       = "~/.scripts/mount_gdrive.sh"
local KWALLET            = "/usr/lib/pam_kwallet_init"
local COPYQ              = "copyq"
local EASYEFFECTS        = "easyeffects --hide-window"
local XRANDR_PRIMARY     = "xrandr --output HDMI-A-1 --primary"
local WALLPAPER          = "hyprpaper"
local WALLPAPER_CYCLE    = "bash ~/.config/hyprpaper/wallpaper-cycle.sh"
local WALLPAPER_INSTANT  = "bash ~/.config/hyprpaper/instant-update.sh"
local WAYBAR             = "waybar"

local DISCORD = "org.equicord.equibop"

local startup_discord_target
local startup_apps_started = false

local function exec(name, cmd, rules)
    local ok, err = pcall(hl.exec_cmd, cmd, rules)
    if not ok then
        hl.log_error(("[autostart] failed to run %s (%s): %s"):format(name, cmd, err))
    end
end

hl.on("hyprland.start", function()
    if startup_apps_started then
        return
    end
    startup_apps_started = true

    exec("XDG_PORTAL", XDG_PORTAL)
    exec("DBUS_ENV", DBUS_ENV)
    exec("SYSTEMCTL_ENV", SYSTEMCTL_ENV)
    exec("POLKIT", POLKIT)
    exec("SWAYNC", SWAYNC)
    exec("SWAYNC_MONITOR", SWAYNC_MONITOR)
    exec("ULAUNCHER", ULAUNCHER)
    exec("MOUNT_GDRIVE", MOUNT_GDRIVE)
    exec("KWALLET", KWALLET)
    exec("COPYQ", COPYQ)
    exec("EASYEFFECTS", EASYEFFECTS)
    exec("XRANDR_PRIMARY", XRANDR_PRIMARY)
    exec("WALLPAPER", WALLPAPER)
    exec("WALLPAPER_CYCLE", WALLPAPER_CYCLE)
    exec("WALLPAPER_INSTANT", WALLPAPER_INSTANT)
    exec("WAYBAR", WAYBAR)

    -- Optional Apps

    startup_discord_target = {
        workspace = "2",
        expires = os.time() + 60,
    }
    exec("DISCORD", "flatpak run " .. DISCORD)
end)

hl.on("window.open", function(window)
    local class = (window.initial_class or window.class or ""):lower()
    local is_discord = class == "equibop" or class == "discord"
    local target = startup_discord_target
    if is_discord and target and os.time() <= target.expires then
        hl.dispatch(hl.dsp.window.move({
            workspace = target.workspace,
            follow = false,
            window = window,
        }))
        if target.saw_close or (target.window and target.window ~= window) then
            startup_discord_target = nil
        else
            target.window = window
        end
    elseif target and os.time() > target.expires then
        startup_discord_target = nil
    end
end)

hl.on("window.close", function(window)
    local target = startup_discord_target
    if target and target.window == window then
        target.window = nil
        target.saw_close = true
    end
end)
