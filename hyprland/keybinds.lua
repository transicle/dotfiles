local MAIN_MOD = "SUPER"

-- SUPER Q             ~ Launch Terminal
-- SUPER E             ~ File Manager
-- SUPER SHIFT S       ~ Screenshot (copy to clipboard)
-- CTRL + SPACE        ~ App Launcher
-- SUPER B             ~ Browser
-- SUPER D             ~ Discord
-- SUPER M             ~ Music
-- SUPER C             ~ Close Focused Window

local BINDS = {
    TERMINAL        = {MAIN_MOD .. " + Q",             "kitty"},
    FILE_MANAGER    = {MAIN_MOD .. " + E",             "dolphin"},
    SCREENSHOT      = {MAIN_MOD .. " + SHIFT + S",     'grim -g "$(slurp)" - | wl-copy'},
    APP_LAUNCHER    = {"CTRL + SPACE",                 "~/.scripts/game_safe_app_launcher.sh -- ulauncher-toggle"},
    BROWSER         = {MAIN_MOD .. " + B",             "zen-browser"},
    DISCORD         = {MAIN_MOD .. " + D",             "~/.scripts/start_vesktop.sh"},
    MUSIC           = {MAIN_MOD .. " + M",             "~/Music/YouTube-Music-3.11.0.AppImag"},
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
