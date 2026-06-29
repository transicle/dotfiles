hl.window_rule({
    name  = "windowrule-float-size",
    match = { float = true },
    size  = { 1200, 800 },
})

hl.window_rule({
    name  = "windowrule-1",
    match = { class = "^(vesktop|equibop|discord)$" },
    opacity = "0.7 0.7",
})

hl.window_rule({
    name  = "windowrule-2",
    match = { class = "^(ulauncher)$" },
    opacity = "0.7 0.7",
})

hl.window_rule({
    name  = "windowrule-3",
    match = { class = "^(kitty)$" },
    opacity = "0.7 0.7",
    float = true,
    size  = { 800, 800 },
})

hl.window_rule({
    name  = "windowrule-vscode",
    match = { class = "^(code)$" },
    opacity = "0.7 0.7",
})

hl.window_rule({
    name  = "windowrule-4",
    match = { class = "^(zen)$" },
    opacity = "0.7 0.7",
})

hl.window_rule({
    name  = "windowrule-5",
    match = { class = "^(org\\.kde\\.dolphin)$" },
    opacity = "0.7 0.7",
    float   = true,
})