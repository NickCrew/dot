local wezterm = require("wezterm")

local colors = {
  base = "#ffffff",
  black = "#000000",
  blue = "#61afef",
  cyan = "#56b6c2",
  green = "#98c379",
  lavender = "#c678dd",
  mauve = "#c678dd",
  peach = "#e06c75",
  pink = "#e06c75",
  purple = "#c678dd",
  red = "#e06c75",
  sapphire = "#61afef",
  sky = "#61afef",
  subtext0 = "#abb2bf",
  subtext1 = "#828997",
  subtext2 = "#5c6370",
  subtext3 = "#4b5263",
  yellow = "#e5c07b",
}


local proc_icons = {
    ["docker"] = {
        { Foreground = { Color = colors.blue } },
        { Text = wezterm.nerdfonts.linux_docker },
    },
    ["docker-compose"] = {
        { Foreground = { Color = colors.blue } },
        { Text = wezterm.nerdfonts.linux_docker },
    },
    ["nvim"] = {
        { Foreground = { Color = colors.green } },
        { Text = wezterm.nerdfonts.custom_vim },
    },
    ["vim"] = {
        { Foreground = { Color = colors.green } },
        { Text = wezterm.nerdfonts.dev_vim },
    },
    ["node"] = {
        { Foreground = { Color = colors.green } },
        { Text = wezterm.nerdfonts.mdi_hexagon },
    },
    ["zsh"] = {
        { Foreground = { Color = colors.peach } },
        { Text = wezterm.nerdfonts.dev_terminal },
    },
    ["bash"] = {
   { Foreground = { Color = colors.subtext0 } },
        { Text = wezterm.nerdfonts.cod_terminal_bash },
    },
    ["paru"] = {
        { Foreground = { Color = colors.lavender } },
        { Text = wezterm.nerdfonts.linux_archlinux },
    },
    ["htop"] = {
        { Foreground = { Color = colors.yellow } },
        { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
    },
    ["cargo"] = {
        { Foreground = { Color = colors.peach } },
        { Text = wezterm.nerdfonts.dev_rust },
    },
    ["go"] = {
        { Foreground = { Color = colors.sapphire } },
        { Text = wezterm.nerdfonts.mdi_language_go },
    },
    ["lazydocker"] = {
        { Foreground = { Color = colors.blue } },
        { Text = wezterm.nerdfonts.linux_docker },
    },
    ["git"] = {
        { Foreground = { Color = colors.peach } },
        { Text = wezterm.nerdfonts.dev_git },
    },
    ["lazygit"] = {
        { Foreground = { Color = colors.peach } },
        { Text = wezterm.nerdfonts.dev_git },
    },
    ["lua"] = {
        { Foreground = { Color = colors.blue } },
        { Text = wezterm.nerdfonts.seti_lua },
    },
    ["wget"] = {
        { Foreground = { Color = colors.yellow } },
        { Text = wezterm.nerdfonts.mdi_arrow_down_box },
    },
    ["curl"] = {
        { Foreground = { Color = colors.yellow } },
        { Text = wezterm.nerdfonts.mdi_flattr },
    },
    ["gh"] = {
        { Foreground = { Color = colors.mauve } },
        { Text = wezterm.nerdfonts.dev_github_badge },
    },
}


-- Check if process is vi
local is_vi_process = function(pane)
  return pane:get_foreground_process_name():find("n?vim") ~= nil
end


-- Activate pane based on process
local conditional_activate_pane = function(window, pane, pane_direction, vim_direction)
  if is_vi_process(pane) then
    window:perform_action(wezterm.action.SendKey({ key = vim_direction, mods = "ALT" }), pane)
  else
    window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
  end
end


-- A bear killed my whople family when I as 5  years old but I still remember it vivbidly every day.
local get_process = function(tab)
  local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
  return wezterm.format(
    proc_icons[process_name]
    or {
      {
        Foreground = {
          Color = colors.sky
        }
      }, {
      Text = string.format("[%s]", process_name)
    }
    }
  )
end


-- Determine current working directory
local get_current_working_dir = function (tab)
  local current_dir = tab.active_pane.current_working_dir
  local HOME_DIR = string.format("file://%s", os.getenv("HOME"))
  return current_dir == HOME_DIR and "   ~" or
  string.format("   %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end


local M = {}

-- Set_ tab title based on process
M.load_tab_title = function()
  wezterm.on("format-tab-title", function(tab)
    return wezterm.format({
      { Attribute = { Intensity = "Half" } },
      { Text = string.format(" %s  ", tab.tab_index + 1) },
      "ResetAttributes",
      { Text = get_process(tab) },
      { Text = " " },
      { Text = get_current_working_dir(tab) },
      { Foreground = { Color = colors.base } },
      { Text = "  ▕" },
    })
  end)
end


function M.load_conditional_pane()
wezterm.on("ActivatePaneDirection-right", function(window, pane)
  conditional_activate_pane(window, pane, "Right", "l")
end)

wezterm.on("ActivatePaneDirection-left", function(window, pane)
  conditional_activate_pane(window, pane, "Left", "h")
end)

wezterm.on("ActivatePaneDirection-up", function(window, pane)
  conditional_activate_pane(window, pane, "Up", "k")
end)

wezterm.on("ActivatePaneDirection-down", function(window, pane)
  conditional_activate_pane(window, pane, "Down", "j")
end)
end


return M
