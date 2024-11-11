--
--
local wt = require("wezterm")
local act = wt.action
local f = require("func")

local set_theme_for_appearance = function(dark_theme, light_theme)
  return wt.gui.get_appearance():find("Dark") and dark_theme or light_theme
end

wt.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)


local config = {}

if wt.config_builder then
  config = wt.config_builder()
end


config.hyperlink_rules = wt.default_hyperlink_rules()

for _, rule in ipairs({
  { regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",      format = "$,0", },
  { regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",    format = "$0", },
  { regex = [[\bfile://\S*\b]],                           format = "$0", },
  { regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]], format = "$0", },
  { regex = [[\b[tt](\d+)\b]],                              format = 'https://example.com/tasks/?t=$1', },
  { regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],                format = "mailto:$0", },

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
  { regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]], format = 'https://www.github.com/$1/$3',}
}) do
  table.insert(config.hyperlink_rules, rule)
end

config.leader = { key = "g", mods = "SUPER", timeout_millseconds = 1000 }

config.keys = {
  -- WINDOW SIZE -------------------------------------------------------------------------------------
  { key = "z",        mods = "ALT",        action = wt.action.TogglePaneZoomState },
  { key = "F11",      mods = "LEADER",     action = wt.action.ToggleFullScreen },
  -- FONT SIZE ---------------------------------------------------------------------------------
  { key = "=",        mods = "CTRL|SHIFT", action = wt.action.IncreaseFontSize },
  { key = "-",        mods = "CTRL|SHIFT", action = wt.action.DecreaseFontSize },
  -- COPY / PASTE ----------------------------------------------------------------------------------
  { key = "x",        mods = "LEADER",     action = wt.action.ActivateCopyMode },
  { key = "s",        mods = "LEADER",     action = wt.action.QuickSelect },
  { key = "c",        mods = "LEADER",     action = wt.action.CopyTo("Clipboard") },
  { key = "v",        mods = "LEADER",     action = wt.action.PasteFrom("Clipboard") },
  -- SCROLLBACK -----------------------------------------------------------------------------------------
  { key = 'PageDown',  mods = 'SHIFT',     action = wt.action.ScrollByPage(1) },
  { key = 'PageUp',    mods = 'SHIFT',     action = wt.action.ScrollByPage(-1) },
  { key = 'UpArrow',   mods = 'SHIFT',     action = act.ScrollToPrompt(-1) },
  { key = 'DownArrow', mods = 'SHIFT',     action = act.ScrollToPrompt(1) },
  -- SEARCH ---------------------------------------------------------------------------------
  -- { key = "f",          mods = "SUPER",     action = wt.action.Search },
  { key = 'f',         mods = 'LEADER',    action = wt.action.Search { Regex = '[a-f0-9]{6,}' } },
  { key = 'r',         mods = 'LEADER',    action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false } },
  { key = 'a',         mods = 'LEADER',    action = act.ActivateKeyTable { name = 'activate_pane', timeout_milliseconds = 1000 } },
  -- ADUST PANES ---------------------------------------------------------------------------------
  { key = "h",         mods = "SHIFT|SUPER", action = wt.action.AdjustPaneSize({ "Left", 5 }) },
  { key = "k",         mods = "SHIFT|SUPER", action = wt.action.AdjustPaneSize({ "Up", 5 }) },
  { key = "l",         mods = "SHIFT|SUPER", action = wt.action.AdjustPaneSize({ "Right", 5 }) },
  { key = "j",         mods = "SHIFT|SUPER", action = wt.action.AdjustPaneSize({ "Down", 5 }) },
  { key = "q",         mods = "LEADER",      action = wt.action.CloseCurrentPane({ confirm = false }) },
  -- SPLIT PANES --------------------------------------------------------------------------------------
  { key = "v",         mods = "LEADER",      action = wt.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
  { key = "h",         mods = "LEADER",      action = wt.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
  -- NAVIGATE PANES -------------------------------------------------------------------------------
  { key = 'h',          mods = 'SUPER',      action = wt.action.ActivatePaneDirection 'Left', },
  { key = 'k',          mods = 'SUPER',      action = wt.action.ActivatePaneDirection 'Up', },
  { key = 'j',          mods = 'SUPER',      action = wt.action.ActivatePaneDirection 'Down', },
  { key = 'l',          mods = 'SUPER',      action = wt.action.ActivatePaneDirection 'Right', },
  -- SWITCH TAB ---------------------------------------------------------------------------------------
  { key = "o",           mods = "LEADER",    action = wt.action.ActivateLastTab },
  { key = "1",           mods = "LEADER",    action = wt.action({ ActivateTab = 0 }) },
  { key = "2",           mods = "LEADER",    action = wt.action({ ActivateTab = 1 }) },
  { key = "3",           mods = "LEADER",    action = wt.action({ ActivateTab = 2 }) },
  { key = "4",           mods = "LEADER",    action = wt.action({ ActivateTab = 3 }) },
  { key = "5",           mods = "LEADER",    action = wt.action({ ActivateTab = 4 }) },
  { key = "6",           mods = "LEADER",    action = wt.action({ ActivateTab = 5 }) },
  { key = "7",           mods = "LEADER",    action = wt.action({ ActivateTab = 6 }) },
  { key = "8",           mods = "LEADER",    action = wt.action({ ActivateTab = 7 }) },
  { key = "9",           mods = "LEADER",    action = wt.action({ ActivateTab = 8 }) },
  -- Launcher ------------------------------------------------------------------------------------------
  { key = "l",           mods = "LEADER",     action = wt.action.ShowLauncher },
  { key = '9',           mods = 'LEADER',     action = wt.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }, },
  -- Switch Workspaces ---------------------------------------------------------------------------------
  { key = ']', mods = 'LEADER',      action = wt.action.SwitchWorkspaceRelative(1) },
  { key = '[', mods = 'LEADER',      action = wt.action.SwitchWorkspaceRelative(-1) },

}

config.key_tables = {
  -- Defines the keys that are active in our resize-pane mode.
  -- Since we're likely to want to make multiple adjustments,
  -- we made the activation one_shot=false. We therefore need
  -- to define a key assignment for getting out of this mode.
  -- 'resize_pane' here corresponds to the name="resize_pane" in
  -- the key assignments above.
  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },
  },

  -- Defines the keys that are active in our activate-pane mode.
  -- 'activate_pane' here corresponds to the name="activate_pane" in
  -- the key assignments above.
  activate_pane = {
    { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
    { key = 'h', action = act.ActivatePaneDirection 'Left' },

    { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
    { key = 'l', action = act.ActivatePaneDirection 'Right' },

    { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
    { key = 'k', action = act.ActivatePaneDirection 'Up' },

    { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
    { key = 'j', action = act.ActivatePaneDirection 'Down' },
  },
}



config.audible_bell                   = "Disabled"
config.automatically_reload_config    = true
config.check_for_updates              = true
config.color_scheme                   = set_theme_for_appearance('tokyonight', 'tokynonight-day')
config.enable_scroll_bar              = true
config.enable_wayland                 = false
config.font                           = wt.font("OperatorMono Nerd Font", { weight = "Medium" })
config.font_size                      = 16.5
config.initial_cols                   = 200
config.initial_rows                   = 35
config.line_height                    = 1.20
config.max_fps                        = 60
config.show_new_tab_button_in_tab_bar = true
config.tab_bar_at_bottom              = false
config.tab_max_width                  = 100
config.use_dead_keys                  = false
config.use_fancy_tab_bar              = true
config.warn_about_missing_glyphs      = true
config.window_background_opacity      = 1.0
config.window_close_confirmation      = "NeverPrompt"
config.window_decorations             = "RESIZE"
config.window_padding                 = { left = 10, right = 10, top = 10, bottom = 10 }

return config
