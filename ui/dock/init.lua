--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
==============@made by Zrchx==================
========= https://github.com/cnapta ==========
--]]

-- =============================================
-- Library's --
local dock = require("ui.dock.dock")
local icon_handler = require("ui.dock.icons")
local beautiful = require("beautiful")
local awful = require("awful")
-- =============================================

-- =============================================
local pinned_defaults = {
    {"alacritty"},
    {"firefox"},
  }
-- =============================================

-- =============================================
--                Theme Dock                  -- 
-- =============================================
local dock_size = beautiful.awesome_dock_size or 80
local offset = beautiful.awesome_dock_offset or beautiful.useless_gap or 0
local pinned_apps = beautiful.awesome_dock_pinned or pinned_defaults
local active_color = beautiful.awesome_dock_color_active or beautiful.fg_focus or "#ffffff"
local inactive_color = beautiful.awesome_dock_color_inactive or beautiful.fg_normal or "#ffffff99"
local minimized_color = beautiful.awesome_dock_color_minimized or beautiful.fg_minimize or "#ffffff33"
local background_color = beautiful.awesome_dock_color_bg or beautiful.bg_normal or "#000000"
local modules_spacing = beautiful.awesome_dock_spacing or 10
local timeout = beautiful.awesome_dock_timeout or 1

if beautiful.awesome_dock_disabled == true then
    return
else
    awful.screen.connect_for_each_screen(function(s)
      for s in screen do
        dock(s, pinned_apps, dock_size, offset, modules_spacing, active_color, inactive_color, minimized_color, background_color, icon_handler, timeout)
      end
    end)
end
-- =============================================
