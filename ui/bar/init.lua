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
local gears = require("gears")
local shorten = require("shorten")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
-- Widgets --
local clock = require("ui.bar.clock")
local separator = wibox.widget{
    shape = gears.shape.circle,
    forced_height = dpi(6),
    forced_width = dpi(8),
    color = beautiful.bg_false,
    widget = wibox.widget.separator,
  }



-- =============================================

-- ===========================================
--                 Wibar                    --
-- ===========================================
awful.screen.connect_for_each_screen(function(s)
    local taglist = require("ui.bar.taglist")(s)
    local tasklist = require("ui.bar.tasklist")(s)
    -- Create wibar
    s.bar_top = awful.wibar({
      screen = s,
      position = "top",
      align = "centered",
      height = dpi(34),
      width = s.geometry.width - dpi(36),
      bg = beautiful.bg_false
    })
    -- Setup wibox
    s.bar_top:setup{
      layout = wibox.layout.fixed.horizontal,

      { -- Left widgets
      clock,
      separator,
      tasklist,
      layout = wibox.layout.align.horizontal,
      },

      { -- Middle widgets
      separator,
      taglist,
      valign = "center",
      halign = "center",
      layout = wibox.layout.fixed.horizontal,
      },

      { -- Right widgets
      layout = wibox.layout.align.horizontal,
      }
    }
-- Function to remove wibar -- 
  local function remove_wibar(c)
    if c.fullscreen or c.maximized then
      c.screen.bar_top.visible = false
    else
      c.screen.bar_top.visible = true
    end
  end
  local function add_wibar(c)
    if c.fullscreen or c.maximized then
       c.screen.bar_top.visible = true
    end
  end
  client.connect_signal("property::fullscreen", remove_wibar)
  client.connect_signal("request::unmanage", add_wibar)
end)
