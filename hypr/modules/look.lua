-- hypr/modules/look.lua
-- Oxide design system — §03 SHAPE · SPACING · MATERIAL, §05 BORDER DECISION
--
-- NOTE: this file doesn't exist in this repo yet (current copy lives on the
-- Arch machine, not yet synced here). Nothing below is literal design-export
-- code — it's reconstructed from the design's value tables using the same
-- flat hyprlang-in-Lua-table convention as animations.lua. Reconcile against
-- the real module's structure once it's pulled over.
--
-- The one intentional move here: 20px rounding -> 3px. Round corners read as
-- "soft neon UI" more than any color choice; near-square = hardware.

general = {
  gaps_in = 4,
  gaps_out = 6,
  border_size = 1,
  layout = "dwindle",
  ["dwindle:preserve_split"] = true,

  -- Border color: do NOT hardcode a gradient here (the current cyan->green
  -- 45deg gradient is the thing being removed). Enable Noctalia's built-in
  -- `hyprland` template instead (add "hyprland" to [theme.templates]
  -- builtin_ids in noctalia/config.toml) — it renders hypr/noctalia.lua and
  -- requires it for you, with:
  --   active   = primary   (#D9543A, Oxide.json mPrimary)
  --   inactive = surface
  -- Override just the inactive color below, in a require placed AFTER
  -- Noctalia's generated require, so unfocused windows keep a visible 1px
  -- edge instead of blending into the background:
  ["col.inactive_border"] = "rgb(2A2A30)", -- outline, not surface
}

decoration = {
  rounding = 3,
  rounding_power = 2.0, -- invisible at 3px, left alone on purpose

  active_opacity = 1.0,
  inactive_opacity = 1.0,

  blur = {
    enabled = true,
    size = 3,
    passes = 2,
    vibrancy = 0.1696,
    -- solid surfaces everywhere (transparency_mode = "solid" in Noctalia,
    -- opacity 1.0 on bar/notifications/OSD) means this costs nothing
    -- visually day-to-day; left on for the few GTK dialogs with their own
    -- translucency.
  },

  shadow = {
    enabled = true,
    range = 8,          -- was 4
    render_power = 4,    -- was 3
    color = "rgba(000000ee)", -- pure black, not #1a1a1a — depth from a hard
                              -- dark edge, not a soft halo
  },
}
