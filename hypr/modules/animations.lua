-- hypr/modules/animations.lua
-- Oxide design system — §04 MOTION
-- Mechanical, not bouncy: nothing overshoots. Windows arrive on a stiff
-- ease-out (~250ms) and stop dead. The border fades in a touch slower
-- than the window moves, so focus visibly catches up, like a relay closing.

bezier = {
  "stiff,        0.20, 0.00, 0.00, 1.00",
  "almostLinear, 0.50, 0.50, 0.75, 1.00",
  "linear,       0.00, 0.00, 1.00, 1.00",
  "quick,        0.15, 0.00, 0.10, 1.00",
}
-- no spring curves: overshoot reads as playful
-- Noctalia shell.animation.speed = 0.85

-- NOTE: bezier{} above is verbatim from the design export. The animation{}
-- table below is reconstructed from the design's motion spec using
-- standard Hyprland `animation = name, onoff, speed, curve, style` syntax
-- — check it against the real module's existing conventions once synced
-- from the live machine, since this repo doesn't have that file yet.
animation = {
  "global,           1, 10,  default",
  "border,           1, 7,   almostLinear",
  "windows,          1, 3.2, stiff",
  "windowsIn,        1, 3.0, stiff,   popin 96%",
  "windowsOut,       1, 1.8, linear,  popin 96%",
  "fadeIn,           1, 1.6, almostLinear",
  "fadeOut,          1, 1.2, linear",
  "fade,             1, 2.0, almostLinear",
  "layers,           1, 2.4, stiff,   fade",
  "layersIn,         1, 2.4, stiff,   fade",
  "layersOut,        1, 1.4, linear,  fade",
  "workspaces,       1, 2.6, stiff,   slide",
  "specialWorkspace, 1, 2.4, stiff,   slidevert",
  "zoomFactor,       1, 5,   quick",
}
