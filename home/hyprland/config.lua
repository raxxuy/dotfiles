-- require("$HOME/.config/hypr/leta-shell.lua")
require("leta-shell")


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

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
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
            active_border = primary
        }
    },

    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.9,
        direction = "right",
    },

    decoration = {
        rounding = 8,

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
