-- Oxide design system — §03 SHAPE · SPACING · MATERIAL, §05 BORDER DECISION.
-- The single biggest move: rounding 20 -> 3. Round corners read as "soft
-- neon UI" more than any color choice; near-square = hardware. Depth comes
-- from a hard dark edge (bigger shadow, pure black), not a soft halo or blur.

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 6,
        border_size = 1,

        col = {
            -- Active border color is NOT set here on purpose: enable
            -- Noctalia's built-in `hyprland` template (add "hyprland" to
            -- [theme.templates] builtin_ids in noctalia/config.toml) and it
            -- renders hypr/noctalia.lua with active = primary (#D9543A),
            -- adding its own require for you. That replaces the old
            -- cyan->green 45deg gradient this used to hardcode.
            --
            -- Its default for inactive is `surface`, which blends into the
            -- background; override it to `outline` so unfocused windows
            -- keep a visible 1px edge.
            inactive_border = "rgba(2A2A30ff)",
        },

        layout = "dwindle",
    },

    dwindle = {
        preserve_split = true,
    },

    decoration = {
        rounding = 3,
        rounding_power = 2, -- invisible at 3px, left alone on purpose

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 8,        -- was 4
            render_power = 4, -- was 3
            color = 0xee000000, -- pure black, not #1a1a1a
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.1696,
            -- Solid surfaces everywhere (Noctalia transparency_mode =
            -- "solid", opacity 1.0 on bar/notifications/OSD) mean this
            -- costs nothing visually day to day; left on for the few GTK
            -- dialogs with their own translucency.
        },
    },
})
