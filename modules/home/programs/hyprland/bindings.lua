local config = require("settings")
local keys = config.keys

local scratchpad = "scratchpad"
local minimized = "minimized"

local function bind(key, action, description, options)
    options = options or {}
    options.description = description
    hl.bind(config.mod .. " + " .. key, action, options)
end

local function special_workspace(name)
    return "special:" .. name
end

local function move_window_to(workspace, follow, window)
    return hl.dsp.window.move({ workspace = workspace, follow = follow, window = window })
end

local function restore_minimized_window()
    local workspace = hl.get_workspace(special_workspace(minimized))
    local current = hl.get_active_workspace()
    if not workspace or not current then return end

    local window = hl.get_windows({ workspace = workspace })[1]
    if window then
        hl.dispatch(move_window_to(current, true, window))
    end
end

local function cycle_app_window(step)
    local active = hl.get_active_window()
    if not active or not active.workspace or not active.class or active.class == "" then return end

    local windows = {}
    local current
    for _, window in ipairs(hl.get_windows({ class = active.class, workspace = active.workspace })) do
        if window == active or (not window.hidden and window.accepts_input) then
            windows[#windows + 1] = window
            if window == active then current = #windows end
        end
    end

    if current and #windows > 1 then
        local next_window = ((current - 1 + step) % #windows) + 1
        hl.dispatch(hl.dsp.focus({ window = windows[next_window] }))
    end
end

-- Applications
bind(keys.launcher, hl.dsp.exec_cmd(config.apps.launcher), "Open app launcher")
for key, app in pairs(keys.apps) do
    bind(key, hl.dsp.exec_cmd(config.apps[app]), "Open " .. app)
end

-- Windows
bind(keys.windows.close, hl.dsp.window.close(), "Close focused window")
bind(keys.windows.quit, hl.dsp.window.kill(), "Close focused window (quit fallback)")
bind(keys.windows.float, hl.dsp.window.float({ action = "toggle" }), "Toggle floating")
bind(keys.windows.fullscreen, hl.dsp.window.fullscreen({ action = "toggle" }), "Toggle fullscreen")

bind(keys.windows.minimize, move_window_to(special_workspace(minimized), false), "Minimize focused window")
bind(keys.windows.restore, restore_minimized_window, "Restore a minimized window")

bind(keys.cycle.next, hl.dsp.window.cycle_next(), "Focus next window")
bind(keys.cycle.previous, hl.dsp.window.cycle_next({ next = false }), "Focus previous window")
bind(keys.cycle.nextApp, function() cycle_app_window(1) end, "Focus next window of app")
bind(keys.cycle.previousApp, function() cycle_app_window(-1) end, "Focus previous window of app")

-- Workspaces
bind(keys.workspaces.previous, hl.dsp.focus({ workspace = "m-1" }), "Previous space")
bind(keys.workspaces.next, hl.dsp.focus({ workspace = "m+1" }), "Next space")
-- Arrow-free workspace navigation for compact keyboards
bind("CTRL + H", hl.dsp.focus({ workspace = "m-1" }), "Previous space")
bind("CTRL + L", hl.dsp.focus({ workspace = "m+1" }), "Next space")
bind(keys.workspaces.scratchpad, hl.dsp.workspace.toggle_special(scratchpad), "Toggle scratchpad")
bind(
    keys.workspaces.moveToScratchpad,
    move_window_to(special_workspace(scratchpad), false),
    "Move window to scratchpad"
)

for workspace = 1, 10 do
    local key = tostring(workspace % 10)
    bind(key, hl.dsp.focus({ workspace = workspace }), "Switch to space " .. workspace)
    bind(
        keys.workspaces.moveModifier .. " + " .. key,
        move_window_to(workspace, true),
        "Move window to space " .. workspace
    )
end

-- Directional controls
for key, direction in pairs(keys.directions) do
    bind("ALT + " .. key, hl.dsp.focus({ direction = direction }), "Focus window " .. direction)
    bind("ALT + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }), "Move window " .. direction)
end

-- Mouse
bind(config.mouse.move, hl.dsp.window.drag(), "Drag window", { mouse = true })
bind(config.mouse.resize, hl.dsp.window.resize(), "Resize window", { mouse = true })
