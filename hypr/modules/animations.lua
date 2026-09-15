-- Oxide design system — §04 MOTION.
-- Mechanical, not bouncy: nothing overshoots, so no spring curves. Windows
-- arrive on a stiff ease-out (~250ms/3.2ds) and stop dead. The border fades
-- to oxide a touch slower than the window moves, so focus visibly catches
-- up a beat later, like a relay closing.

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("stiff",        { type = "bezier", points = { {0.20, 0}, {0, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve("linear",       { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("quick",        { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
-- No spring curves: overshoot reads as playful.

hl.animation({ leaf = "global",           enabled = true, speed = 10,  bezier = "default" })
hl.animation({ leaf = "border",           enabled = true, speed = 7,   bezier = "almostLinear" })
hl.animation({ leaf = "windows",          enabled = true, speed = 3.2, bezier = "stiff" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.0, bezier = "stiff",       style = "popin 96%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 1.8, bezier = "linear",      style = "popin 96%" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 1.6, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.2, bezier = "linear" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.0, bezier = "almostLinear" })
hl.animation({ leaf = "layers",           enabled = true, speed = 2.4, bezier = "stiff",       style = "fade" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 2.4, bezier = "stiff",       style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.4, bezier = "linear",      style = "fade" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 2.6, bezier = "stiff",       style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.4, bezier = "stiff",       style = "slidevert" })
hl.animation({ leaf = "zoomFactor",       enabled = true, speed = 5,   bezier = "quick" })

-- Noctalia's own layer surfaces set no_anim in rules.lua (it animates
-- itself); shell.animation.speed = 0.85 belongs in noctalia/config.toml.
