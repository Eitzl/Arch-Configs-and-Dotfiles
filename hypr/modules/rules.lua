-- Window rules ------------------------------------------------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name   = "float-noctalia-settings",
    match  = { class = "^dev\\.noctalia\\.Noctalia$" },
    float  = true,
    size   = {1080, 920},
    center = true,
})

hl.window_rule({
    name   = "float-satty",
    match  = { class = "^com\\.gabm\\.satty$" },
    float  = true,
    center = true,
})

-- Layer rules -------------------------------------------------------------

hl.layer_rule({
    name  = "blur-noctalia",
    match = { namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$" },
    blur         = true,
    ignore_alpha = 0.5,
    no_anim      = true,
})
