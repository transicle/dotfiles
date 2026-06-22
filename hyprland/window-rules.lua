hl.window_rule({
    name  = "windowrule-1",
    match = { class = "^(vesktop|equibop|discord)$" },
    fullscreen = false,
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
    float = true
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