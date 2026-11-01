hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 1,

        col = {
            active_border = "rgba(ffffff38)",
            inactive_border = "rgba(ffffff12)",
        },
    },

    decoration = {
        rounding = 14,
        rounding_power = 3.0,

        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 28,
            render_power = 3,
            color = "rgba(00000070)",
            color_inactive = "rgba(00000038)",
            offset = { 0, 5 },
        },

        blur = {
            enabled = true,
            variant = "acrylic",

            size = 8,
            passes = 3,

            noise = 0.008,
            contrast = 0.95,
            brightness = 1.0,
            vibrancy = 0.18,

            new_optimizations = true,
            ignore_opacity = true,
            popups = true,
            xray = false,

            acrylic = {
                refraction = 20.0,
                bulb = 48.0,
                clarity = 0.0,
                aberration = 0.015,
                tint = "rgba(EEF5FF14)",
            },
        },
    },

    misc = {
        font_family = "SF Pro Display",
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = false,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        vrr = true,
    },

    animations = {
        enabled = true,
    },
})

hl.curve("macEase", {
    type = "bezier",
    points = { { 0.22, 1.0 }, { 0.36, 1.0 } },
})

hl.curve("macSpring", {
    type = "spring",
    mass = 1,
    stiffness = 240,
    damping = 30,
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3.2,
    spring = "macSpring",
    style = "popin 97%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2.2,
    bezier = "macEase",
    style = "popin 97%",
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 3.5,
    spring = "macSpring",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 2.5,
    bezier = "macEase",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4.5,
    bezier = "macEase",
    style = "slidefade 20%",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 2.5,
    bezier = "macEase",
    style = "fade",
})
