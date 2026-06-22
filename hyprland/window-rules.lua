hl.window_rule({
    name  = "windowrule-1",
    match = { class = "^(vesktop|equibop|discord)$" }, -- Always use Equibop, it contains all Vencord plugins!
    fullscreen = true,
})

hl.window_rule({
    name  = "windowrule-2",
    match = { class = "^(ulauncher)$" },
    opacity = "0.6 0.6",
})

hl.window_rule({
    name  = "windowrule-3",
    match = { class = "^(kitty)$" },
    opacity = "0.75 0.75",
})

hl.window_rule({
    name  = "windowrule-vscode",
    match = { class = "^(code)$" },
    opacity = "0.75 0.75",
})

hl.window_rule({
    name  = "windowrule-4",
    match = { class = "^(zen)$" },
    opacity = "0.8 0.8",
})

hl.window_rule({
    name  = "windowrule-5",
    match = { class = "^(org\\.kde\\.dolphin)$" },
    opacity = "0.75 0.75",
    float   = true,
    size    = { 1600, 900 },
})

hl.window_rule({
    name  = "windowrule-hyprland-run",
    match = { class = "^(hyprland-run)" },
    move  = "10 monitor_h - 110",
})

hl.window_rule({
    name  = "windowrule-6",
    match = { class = "^(qemu)$" },
    float = true,
    size  = { 1280, 829 },
})

hl.window_rule({
    name  = "windowrule-7",
    match = { class = "^(lunarclient)$" },
    float = true,
    size  = { 1600, 900 },
})

hl.window_rule({
    name  = "windowrule-8",
    match = { class = "^(org\\.kde\\.ark)$" },
    opacity = "0.75 0.75",
    float   = true,
    size    = { 1600, 900 },
})

hl.window_rule({
    name  = "windowrule-9",
    match = { title = "^(.*Allen.*)$" },
    opacity = "1.0 1.0",
})

hl.window_rule({
    name  = "windowrule-TheRookie",
    match = { title = "^(.*The Rookie.*)$" },
    opacity = "1.0 1.0",
})

hl.window_rule({
    name  = "windowrule-10",
    match = { title = "^(.*Canva.*)$" },
    opacity = "1.0 1.0",
})

hl.window_rule({
    name  = "windowrule-11",
    match = { title = "^(.*\\- YouTube — Zen Browser.*)$" },
    opacity = "1.0 1.0",
})

hl.window_rule({
    name  = "windowrule-12",
    match = { title = "^(.*Watch2Gether.*)$" },
    opacity = "1.0 1.0",
})

hl.window_rule({
    name      = "windowrule-13",
    match     = { class = "^(.*gamescope.*)$" },
    immediate = true,
    float     = true,
})

hl.window_rule({
    name      = "windowrule-14",
    match     = { class = "^(.*steam_app.*)$" },
    immediate = true,
})

hl.window_rule({
    name    = "windowrule-15",
    match   = { class = "^(.*Lunar.*)$" },
    content = "game",
})

hl.window_rule({
    name    = "windowrule-16",
    match   = { class = "^(.*Minecraft.*)$" },
    content = "game",
})

hl.window_rule({
    name    = "windowrule-17",
    match   = { class = "^(gamescope)$" },
    content = "game",
})
