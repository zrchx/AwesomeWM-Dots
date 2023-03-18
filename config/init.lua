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
local awful = require("awful")
local wibox = require("wibox")
-- =============================================

-- =============================================
-- File inclusion --
require("config.keys")
require("config.misc")
require("config.rules")
-- =============================================

-- =============================================
-- Wallpaper function
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
      screen = s,
      widget = {
        image = '/home/zrchx/Pictures/Wallpapers/Wallpaper-5.png',
        widget = wibox.widget.imagebox,
        upscale = true,
        downscale = true,
        horizontal_fit_policy = "fit",
        vertical_fit_policy = "fit",
      }
    }
end)
-- =============================================

-- ===========================================
-- Layouts --
local l = awful.layout.suit
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
    l.floating, l.tile, l.spiral.dwindle,
  })
end)
-- Set tags --
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({"1","2","3",}, s, awful.layout.layouts[1])
end)
-- ===========================================

-- =============================================
-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
-- =============================================

-- =============================================
-- Autostart some apps
awful.spawn.with_shell("sh ~/.config/awesome/config/start.sh")
-- =============================================
