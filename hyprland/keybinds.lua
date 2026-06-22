local MAIN_MOD = "SUPER"

local BINDS = {
    -- Apps
    {MAIN_MOD .. " + Q",         hl.dsp.exec_cmd("kitty")},
    {MAIN_MOD .. " + E",         hl.dsp.exec_cmd("dolphin")},
    {MAIN_MOD .. " + B",         hl.dsp.exec_cmd("flatpak run app.zen_browser.zen")},
    {MAIN_MOD .. " + D",         hl.dsp.exec_cmd("flatpak run org.equicord.equibop")},
    {MAIN_MOD .. " + M",         hl.dsp.exec_cmd("~/Music/YouTube-Music-3.11.0.AppImage")},
    {"CTRL + SPACE",             hl.dsp.exec_cmd("~/.scripts/game_safe_app_launcher.sh -- ulauncher-toggle")},
    {MAIN_MOD .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy')},

    -- Window
    {MAIN_MOD .. " + C",         hl.dsp.window.close()},
    {MAIN_MOD .. " + SHIFT + X", hl.dsp.window.close()},
    {MAIN_MOD .. " + F",         hl.dsp.window.float({ action = "toggle" })},
    {MAIN_MOD .. " + V",         hl.dsp.window.fullscreen()},

    -- Focus
    {MAIN_MOD .. " + left",      hl.dsp.focus({ direction = "left"  })},
    {MAIN_MOD .. " + right",     hl.dsp.focus({ direction = "right" })},
    {MAIN_MOD .. " + up",        hl.dsp.focus({ direction = "up"    })},
    {MAIN_MOD .. " + down",      hl.dsp.focus({ direction = "down"  })},

    -- Workspaces
    {MAIN_MOD .. " + Period",     hl.dsp.focus({ workspace = 100 })},
    {MAIN_MOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" })},
    {MAIN_MOD .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" })},

    -- Mouse
    {MAIN_MOD .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true }},
    {MAIN_MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }},

    -- Macros
    {MAIN_MOD .. " + K",         hl.dsp.submap("macros")},
}

for _, bind in ipairs(BINDS) do
    hl.bind(bind[1], bind[2], bind[3])
end

-- Workspaces 1-10
for i = 1, 10 do
    local key = i % 10
    
    hl.bind(MAIN_MOD .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(MAIN_MOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.define_submap("macros", function()
    hl.bind("1",      hl.dsp.exec_cmd('wtype -d 20 "Hello"'))
    hl.bind("escape", hl.dsp.submap("reset"))
end)
