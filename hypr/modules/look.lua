-- Oxide design system — §03 SHAPE · SPACING · MATERIAL, §05 BORDER DECISION.
-- The single biggest move: rounding 20 -> 3. Round corners read as "soft
-- neon UI" more than any color choice; near-square = hardware. Depth comes
-- from a hard dark edge (bigger shadow, pure black), not a soft halo.
hl.config({
    general = {
        gaps_in     = 4,
        gaps_out    = 6,
        border_size = 1,

        col = {
            -- active_border comes from Noctalia's hyprland template
            -- (hypr/noctalia.lua, active = primary #D9543A), loaded just
            -- before this module in hyprland.lua.
            --
            -- The template sets inactive to `surface`, which vanishes into
            -- the background at 1px. Override it to `outline` so unfocused
            -- windows keep a visible edge. The template doesn't export
            -- outline, so it's the palette's mOutline, hardcoded.
            inactive_border = "rgb(2A2A30)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 3,
        rounding_power = 2, -- invisible at 3px, left alone on purpose

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 8,
            render_power = 4,
            color        = 0xee000000, -- pure black: depth, not color
        },

        -- Every Noctalia surface is solid (alpha 1.0), so blur costs nothing
        -- visually day to day; left on for GTK dialogs with translucency.
        blur = {
            enabled  = true,
            size     = 3,
            passes   = 2,
            vibrancy = 0.1696,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
        -- Lets hyprlock be relaunched from a TTY if it crashes (see README).
        allow_session_lock_restore = true,
    },
})
