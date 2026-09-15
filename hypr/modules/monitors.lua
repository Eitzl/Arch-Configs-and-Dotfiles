-- OptiPlex 7470 AIO internal panel.
hl.monitor({
    output   = "HDMI-A-2",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})

-- Fallback for anything plugged in later.
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
