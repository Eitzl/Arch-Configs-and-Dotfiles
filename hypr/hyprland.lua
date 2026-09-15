-- Entry point: only requires. Each module is its own scope, so an error in
-- one file doesn't stop the rest from loading.

require("modules.env")
require("modules.monitors")
-- Border colors from Noctalia's hyprland template. Must load before
-- modules.look, which overrides inactive_border. The template's apply.sh
-- appends its own include to the end of this file unless it finds the string
-- `require("noctalia")` here, and that late include would undo the override.
-- pcall: noctalia.lua is generated and doesn't exist until Noctalia renders it.
pcall(function() require("noctalia").apply_theme() end)
require("modules.look")
require("modules.animations")
require("modules.input")
require("modules.rules")
require("modules.workspaces")
require("modules.binds")
require("modules.autostart")
