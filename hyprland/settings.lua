hl.config({
    render = {
        direct_scanout = 1,
    },
})

hl.config({
    general = {
        gaps_in       = 5,
        gaps_out      = 8,
        border_size   = 0,
        layout        = "dwindle",
        allow_tearing = true,
    },
})

hl.config({
    decoration = {
        rounding = 8,
        shadow = {
            enabled      = true,
            range        = 8,
            render_power = 2,
            color        = "rgba(00000030)",
        },
        
        blur = {
            enabled           = true,
            size              = 8,        -- increase from 4
            passes            = 3,        -- fine as-is
            noise             = 0.02,
            contrast          = 0.9,
            brightness        = 0.85,
            vibrancy          = 0.15,     -- adds that color-tinted glass feel
            vibrancy_darkness = 0.2,
            new_optimizations = true,
            xray              = false,    -- true = blur ignores layering (different look)
        }
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
        sensitivity  = -0.5,

        touchpad = {
            natural_scroll          = true,
            tap_to_click            = true,
            tap_and_drag            = true,
            drag_lock               = false,
            disable_while_typing    = true,
            clickfinger_behavior    = true,
            middle_button_emulation = true,
        },
    },
})

hl.config({
    gestures = {
        workspace_swipe_distance = 300,
        workspace_swipe_invert = false,
        workspace_swipe_forever = true,
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})
