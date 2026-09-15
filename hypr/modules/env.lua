-- Intel UHD 630: no NVIDIA variables needed.

-- Oxide §10: Bibata Modern Classic, sharper silhouette than Adwaita at 24px.
-- Needs bibata-cursor-theme installed; until then both fall back to the
-- `default` icon theme. GTK reads its own copy: gsettings set
-- org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic
-- XWayland apps only read the XCURSOR_* pair.
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
