local programs = require("modules.programs")
local mainMod = "SUPER"

local function bind(keys, dispatcher, description, flags)
    flags = flags or {}
    flags.description = description
    hl.bind(keys, dispatcher, flags)
end

local function exec(cmd)
    return hl.dsp.exec_cmd(cmd)
end

-- Apps and shell ----------------------------------------------------------

bind(mainMod .. " + Return",      exec(programs.terminal),                        "Open terminal")
bind(mainMod .. " + E",           exec(programs.fileManager),                     "Open file manager")
bind(mainMod .. " + Space",       exec("noctalia msg panel-toggle launcher"),       "App launcher")
bind(mainMod .. " + A",           exec("noctalia msg panel-toggle control-center"), "Control center")
bind(mainMod .. " + M",           exec("noctalia msg panel-toggle session"),        "Power / session menu")
bind(mainMod .. " + SHIFT + V",   exec("noctalia msg panel-toggle clipboard"),      "Clipboard history")
bind(mainMod .. " + L",           exec("loginctl lock-session"),                    "Lock screen (hyprlock)")
bind(mainMod .. " + SHIFT + C",   exec("hyprpicker -a"),                            "Color picker (copies hex)")
bind("ALT + Tab",                 exec("noctalia msg window-switcher"),             "Window switcher")

-- Screenshots (grim + slurp -> satty). Full path: Hyprland's PATH lacks ~/.local/bin.

bind("Print",           exec("$HOME/.local/bin/shot region"), "Screenshot region")
bind("SHIFT + Print",   exec("$HOME/.local/bin/shot window"), "Screenshot active window")
bind("CTRL + Print",    exec("$HOME/.local/bin/shot full"),   "Screenshot full screen")

-- Windows -----------------------------------------------------------------

bind(mainMod .. " + C", hl.dsp.window.close(),                     "Close window")
bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), "Toggle floating")
bind(mainMod .. " + F", hl.dsp.window.fullscreen(),                "Toggle fullscreen")
bind(mainMod .. " + P", hl.dsp.window.pseudo(),                    "Toggle pseudotile")
bind(mainMod .. " + J", hl.dsp.layout("togglesplit"),              "Toggle split direction")

bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }),  "Focus left")
bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), "Focus right")
bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }),    "Focus up")
bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }),  "Focus down")

bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   "Drag window",   { mouse = true })
bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), "Resize window", { mouse = true })

-- Workspaces --------------------------------------------------------------

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }),       "Go to workspace " .. i)
    bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), "Move window to workspace " .. i)
end

bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"),            "Toggle scratchpad")
bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }), "Move window to scratchpad")

bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), "Next workspace")
bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), "Previous workspace")

-- Media keys (work while locked) ------------------------------------------
-- No brightness keys: this panel exposes no backlight or DDC/CI control.

bind("XF86AudioRaiseVolume", exec("noctalia msg volume-up"),   "Volume up",   { locked = true, repeating = true })
bind("XF86AudioLowerVolume", exec("noctalia msg volume-down"), "Volume down", { locked = true, repeating = true })
bind("XF86AudioMute",        exec("noctalia msg volume-mute"), "Mute",        { locked = true })
bind("XF86AudioMicMute",     exec("noctalia msg mic-mute"),    "Mic mute",    { locked = true })

bind("XF86AudioPlay",  exec("noctalia msg media toggle"),   "Play / pause",   { locked = true })
bind("XF86AudioPause", exec("noctalia msg media toggle"),   "Play / pause",   { locked = true })
bind("XF86AudioNext",  exec("noctalia msg media next"),     "Next track",     { locked = true })
bind("XF86AudioPrev",  exec("noctalia msg media previous"), "Previous track", { locked = true })
