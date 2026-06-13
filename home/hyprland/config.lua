-- require("$HOME/.config/hypr/leta-shell.lua")
local status, leta = pcall(require, "leta-shell")
if not status then
    leta = {
        primary = "#ffffff" -- fallback values
    }
end


-- VARIABLES
local mainMod = "SUPER"
local terminal = "ghostty --gtk-single-instance=true"
local fileManager = "nautilus"


-- MONITORS
hl.monitor({
    output = "",
    mode = "1920x1080@200",
    position = "auto",
    scale = "1"
})


-- AUTOSTART
hl.on("hyprland.start", function()
    hl.exec_cmd("mpris-proxy")
    hl.exec_cmd("leta-shell")
    hl.exec_cmd(
        "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false --working-directory=$HOME")
end)


-- BINDS
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + period", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("move -col"))

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -zm region --clipboard-only"))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind(mainMod .. "+ L", hl.dsp.exec_cmd("leta-shell"))
hl.bind(mainMod .. "+ SHIFT + L", hl.dsp.exec_cmd("leta-shell quit"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("leta-shell toggle wallpaper-selector"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("leta-shell toggle launcher"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("leta-shell toggle"))


-- CONFIG
hl.config({
    general = {
        gaps_out = 10,
        border_size = 2,
        allow_tearing = true,
        layout = "scrolling",

        snap = {
            enabled = true,
        },

        col = {
            active_border = leta.primary
        }
    },

    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.9,
        direction = "right",
    },

    decoration = {
        rounding = 8,
        dim_inactive = true,

        shadow = {
            enabled = true,
        },

        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            xray = true,
            popups = true,
            brightness = 0.9,
            noise = 0
        }
    },

    misc = {
        font_family = "SF Pro Display",
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = false,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        vrr = 1,
    },

    xwayland = {
        use_nearest_neighbor = false,
        force_zero_scaling = true,
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },

    input = {
        kb_layout = "us,mk"
    },
})


-- ANIMATIONS
-- CURVES
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- SPRINGS
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.curve("snappy", { type = "spring", mass = 0.8, stiffness = 120, dampening = 18 })

-- GLOBAL
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })

-- WINDOWS
hl.animation({ leaf = "windows", enabled = true, speed = 4, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.5, spring = "snappy", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "easeOutCubic", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, spring = "easy" })

-- LAYERS
hl.animation({ leaf = "layers", enabled = true, speed = 3.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.5, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2, bezier = "easeOutCubic", style = "fade" })

-- FADE
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 2, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadeShadow", enabled = true, speed = 2, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 2.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 3, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadePopups", enabled = true, speed = 2.5, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadePopupsIn", enabled = true, speed = 2, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadePopupsOut", enabled = true, speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeDpms", enabled = true, speed = 3, bezier = "easeInOutCubic" })

-- BORDER
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "easeOutQuint" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 10, bezier = "linear", style = "loop" })

-- WORKSPACES
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "easeOutCubic", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3, bezier = "easeOutCubic", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.5, bezier = "almostLinear", style = "slidefade 20%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.5, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 3.5, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2.5, bezier = "easeOutCubic", style = "slidevert" })

-- MISC
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
hl.animation({ leaf = "monitorAdded", enabled = true, speed = 5, bezier = "easeOutQuint" })


-- RULES
hl.layer_rule({
    match = {
        namespace = "leta-shell"
    },
    no_anim = true,
    blur = true,
    blur_popups = true,
    ignore_alpha = 0.3
})
