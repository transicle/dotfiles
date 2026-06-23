hl.config({
    render = {
        direct_scanout = 1,
    },
})

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 8,
        border_size = 0,
        layout        = "dwindle",
        allow_tearing = true,
    },
})

hl.config({
    decoration = {
        rounding = 8,
        shadow = {
            enabled  = true,
            range    = 8,
            render_power = 2,
            color    = "rgba(00000030)",
        },
        blur = {
            enabled = true,
            size    = 4,
            passes  = 3,
        },
    },
})

hl.config({
    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },
})

hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_rules     = "",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})
