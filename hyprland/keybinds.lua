local MAIN_MOD = "SUPER"
local CAPS_LOCK = "code:66"

-- SUPER RETURN        ~ Launch Terminal
-- SUPER L             ~ Lock Screen
-- SUPER M             ~ Logout
-- SUPER E             ~ File Manager
-- SUPER SHIFT S       ~ Screenshot
-- CTRL + ALT + Delete ~ Logout
-- CTRL + SPACE        ~ App Launcher
-- XF86AudioPlay       ~ Media Play
-- CAPS_LOCK           ~ Launch Terminal
-- SUPER G             ~ Browser
-- SUPER D             ~ Discord
-- SUPER Y             ~ YouTube Music
-- SUPER Page_Up       ~ Zoom In
-- SUPER Page_Down     ~ Zoom Out
-- SUPER Q             ~ Launch Terminal
-- SUPER C             ~ Close Focused Window

local BINDS = {
    TERMINAL        = {MAIN_MOD .. " + RETURN",       "kitty"},
    LOCK            = {MAIN_MOD .. " + L",             "hyprlock"},
    LOGOUT          = {MAIN_MOD .. " + M",             "wlogout --protocol layer-shell"},
    FILE_MANAGER    = {MAIN_MOD .. " + E",             "dolphin"},
    SCREENSHOT      = {MAIN_MOD .. " + SHIFT + S",     'grim -g "$(slurp)" - | swappy -f -'},
    LOGOUT_CTRL     = {"CTRL + ALT + Delete",          "wlogout"},
    APP_LAUNCHER    = {"CTRL + SPACE",                 "~/.scripts/game_safe_app_launcher.sh -- ulauncher-toggle"},
    MEDIA_PLAY      = {"XF86AudioPlay",                "playerctl play-pause"},
    CAPS_TERMINAL   = {CAPS_LOCK,                      "kitty"},
    BROWSER         = {MAIN_MOD .. " + G",             "zen-browser"},
    DISCORD         = {MAIN_MOD .. " + D",             "~/.scripts/start_vesktop.sh"},
    YOUTUBE_MUSIC   = {MAIN_MOD .. " + Y",             "~/Music/YouTube-Music-3.11.0.AppImage"},
    ZOOM_IN         = {MAIN_MOD .. " + Page_Up",       "~/.config/hypr/hyprzoom -duration 1 -steps 5 -target 3"},
    ZOOM_OUT        = {MAIN_MOD .. " + Page_Down",     "~/.config/hypr/hyprzoom -duration 1 -steps 5 -target 3"},
    TERMINAL_Q      = {MAIN_MOD .. " + Q",             "kitty"},
}

for _, bind in pairs(BINDS) do
    hl.bind(bind[1], hl.dsp.exec_cmd(bind[2]))
end

hl.bind(MAIN_MOD .. " + C",         hl.dsp.window.close())
hl.bind(MAIN_MOD .. " + SHIFT + X", hl.dsp.window.close())
hl.bind(MAIN_MOD .. " + F",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(MAIN_MOD .. " + V",         hl.dsp.window.fullscreen())

hl.bind(MAIN_MOD .. " + left",  hl.dsp.focus({ direction = "left"  }))
hl.bind(MAIN_MOD .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MAIN_MOD .. " + up",    hl.dsp.focus({ direction = "up"    }))
hl.bind(MAIN_MOD .. " + down",  hl.dsp.focus({ direction = "down"  }))

for i = 1, 10 do
    local key = i % 10

    hl.bind(MAIN_MOD .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(MAIN_MOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(MAIN_MOD .. " + Period",     hl.dsp.focus({ workspace = 100 }))
hl.bind(MAIN_MOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MAIN_MOD .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(MAIN_MOD .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(MAIN_MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(MAIN_MOD .. " + K", hl.dsp.submap("macros"))

hl.define_submap("macros", function()
    hl.bind("1",      hl.dsp.exec_cmd('wtype -d 20 "Hello"'))
    hl.bind("escape", hl.dsp.submap("reset"))
end)
