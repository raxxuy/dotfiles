return {
    mod = "SUPER",

    apps = {
        terminal = os.getenv("TERMINAL") or "ghostty",
        browser = os.getenv("BROWSER") or "zen-beta",
        fileManager = os.getenv("FILE_MANAGER") or "nautilus",
        launcher = "fuzzel",
    },

    keys = {
        launcher = "space",

        apps = {
            ["ALT + T"] = "terminal",
            ["ALT + B"] = "browser",
            ["ALT + E"] = "fileManager",
        },

        windows = {
            close = "W",
            quit = "Q",
            float = "ALT + V",
            fullscreen = "CTRL + F",
            minimize = "M",
            restore = "SHIFT + M",
        },

        cycle = {
            next = "Tab",
            previous = "SHIFT + Tab",
            nextApp = "bracketright",
            previousApp = "bracketleft",
        },

        workspaces = {
            previous = "left",
            next = "right",
            scratchpad = "S",
            moveToScratchpad = "SHIFT + S",
            moveModifier = "SHIFT",
        },

        directions = {
            H = "left",
            J = "down",
            K = "up",
            L = "right",
        },
    },

    mouse = {
        move = "mouse:272",
        resize = "mouse:273",
    },
}
