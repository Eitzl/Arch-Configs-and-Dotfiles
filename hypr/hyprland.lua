-- Entry point: only requires. Each module is its own scope, so an error in
-- one file doesn't stop the rest from loading.

require("modules.env")
require("modules.monitors")
require("modules.look")
require("modules.animations")
require("modules.input")
require("modules.rules")
require("modules.workspaces")
require("modules.binds")
require("modules.autostart")
