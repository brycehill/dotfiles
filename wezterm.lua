-- Pull in the wezterm API
local wezterm = require("wezterm")
local session_manager = require("wezterm-session-manager/session-manager")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.term = "wezterm"

-- Colors
--config.color_scheme = "Subliminal"
--config.color_scheme = "Nord (Gogh)"
config.color_scheme = "Oceanic Next (Gogh)"
--config.color_scheme = "OceanicNext (base16)"
--config.color_scheme = "Oceanic-Next"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

config.font = wezterm.font_with_fallback({ "Hasklug Nerd Font" })
config.font_size = 14

-- Bell
config.audible_bell = "Disabled"

-- UI
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_buttons = { "Maximize" }
config.use_fancy_tab_bar = true
config.tab_max_width = 32
config.show_new_tab_button_in_tab_bar = false

-- This function returns the suggested title for a tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#0b0022"
	local background = "#1b1032"
	local foreground = "#808080"

	if tab.is_active then
		background = "#2b2042"
		foreground = "#c0c0c0"
	elseif hover then
		background = "#3b3052"
		foreground = "#909090"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		-- { Background = { Color = edge_background } },
		-- { Foreground = { Color = edge_foreground } },
		-- { Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		-- { Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

config.pane_focus_follows_mouse = true
config.scrollback_lines = 5000
config.line_height = 1.1

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.use_ime = false

config.debug_key_events = true

-- CTRL + SPACE = LEADER
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1001 }
config.keys = {
	-- This will create a new split and run the `top` program inside it
	{
		key = "\\",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},

	-- { key = "h", mods = "CTRL", action = act({ EmitEvent = "move-left" }) },
	-- { key = "l", mods = "CTRL", action = act({ EmitEvent = "move-right" }) },
	-- { key = "k", mods = "CTRL", action = act({ EmitEvent = "move-up" }) },
	-- { key = "j", mods = "CTRL", action = act({ EmitEvent = "move-down" }) },

	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "LeftArrow",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "RightArrow",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "DownArrow",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "UpArrow",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "s",
		mods = "LEADER",
		-- action = act.ShowTabNavigator,
		action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},

	-- Create a new workspace with a random name and switch to it
	{
		key = "n",
		mods = "LEADER",
		action = act.SwitchToWorkspace,
	},
	{
		key = "f",
		mods = "LEADER",
		action = wezterm.action.ToggleFullScreen,
	},

	-- Save / Restore Session
	{ key = "S", mods = "LEADER", action = wezterm.action({ EmitEvent = "save_session" }) },
	{ key = "L", mods = "LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
	{ key = "R", mods = "LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },

	{ key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
	{ key = "w", mods = "LEADER", action = act.ShowTabNavigator },
}

-- For navigating between nvim and wezterm panes
-- Commented out because I can't figure out how to use the same keys for
-- navigating between neovim panes and wezterm panes.
-- local move_around = function(window, pane, direction_wez, direction_nvim)
-- 	wezterm.log_info(pane:get_title())
--
-- 	if pane:get_title():sub(-4) == "NVIM" then
-- 		window:perform_action(
-- 			wezterm.action({
-- 				SendString = "\x17" .. direction_nvim,
-- 			}),
-- 			pane
-- 		)
-- 	else
-- 		window:perform_action(
-- 			wezterm.action({
-- 				ActivatePaneDirection = direction_wez,
-- 			}),
-- 			pane
-- 		)
-- 	end
-- end
--
-- wezterm.on("move-left", function(window, pane)
-- 	move_around(window, pane, "Left", "h")
-- end)
--
-- wezterm.on("move-right", function(window, pane)
-- 	move_around(window, pane, "Right", "l")
-- end)
--
-- wezterm.on("move-up", function(window, pane)
-- 	move_around(window, pane, "Up", "k")
-- end)
--
-- wezterm.on("move-down", function(window, pane)
-- 	move_around(window, pane, "Down", "j")
-- end)

wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

local create_workspace = function(args)
	local tab, pane, window = wezterm.mux.spawn_window(args)
	pane:split({ size = 0.5 })
	window:spawn_tab({})

	window:gui_window():maximize()
end

-- Setup default workspaces on startup
wezterm.on("gui-startup", function(_)
	local tab, pane, window = wezterm.mux.spawn_window({
		workspace = "Nintendo: NCom Root",
		cwd = "/Users/brychi01/projects/nintendo/ncom-root/",
	})
	pane:split({ size = 0.5 })
	tab:set_title("nvim ")
	local tab = window:spawn_tab({})
	tab:set_title("server ")

	window:gui_window():maximize()

	-- local tab, pane, window = wezterm.mux.spawn_window({
	-- 	workspace = "Nintendo: YIR24",
	-- 	cwd = "/Users/brychi01/projects/nintendo/microsite-yir24/",
	-- })
	-- tab:set_title("nvim ")
	-- local tab = window:spawn_tab({})
	-- tab:set_title("server ")
	-- pane:split({ size = 0.5 })

	local tab, pane, window = wezterm.mux.spawn_window({
		workspace = "Nintendo: Graph",
		cwd = "/Users/brychi01/projects/nintendo/graph/",
	})
	pane:split({ size = 0.5 })
end)

return config
