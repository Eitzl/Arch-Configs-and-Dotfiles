local programs = require("modules.programs")

hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
    hl.exec_cmd("hypridle")
    -- Noctalia keeps history but not the live selection; this keeps copies alive after the source app closes.
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    -- udiskie over thunar-volman: mounts USB drives even when Thunar isn't open.
    hl.exec_cmd("udiskie --automount --notify --no-tray")
    -- Runs in the tray; its SSH agent only answers while the app is running.
    hl.exec_cmd("1password --silent")
    hl.exec_cmd(programs.terminal)
end)
