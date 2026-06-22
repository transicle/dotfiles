hl.config({
    render = {
        direct_scanout = 1,
    },
})

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 8,
        border_size = 2,
        col = {
            active_border   = "rgb(cdd6f4)",
            inactive_border = "rgba(595959aa)",
        },
        layout        = "dwindle",
        allow_tearing = true,
    },
})

hl.config({
    decoration = {
        rounding = 8,
        blur = {
            enabled = true,
            size    = 4,
            passes  = 3,
        },
    },
})

hl.config({
    misc = {
        disable_hyprland_logo = true,
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
