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
local shorten = require("shorten")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
-- =============================================

-- =============================================
-- Config Files --
require("ui.bar")
require("ui.notifys")
-- =============================================

-- =============================================
local function signal()
  local open
  if open == false then
    local function date (text, pos)
    return wibox.widget {
      format = text,
      font = beautiful.font_mod.." bold 28",
      align = pos,
      widget = wibox.widget.textclock
    }
    end
  local separator = wibox.widget{
    shape = shorten.rrect(12),
    forced_height = dpi(16),
    forced_width = dpi(16),
    color = beautiful.bg_false,
    widget = wibox.widget.separator,
  }
  awful.screen.connect_for_each_screen(function(s)
  s.decorators = wibox {
    screen = s,
    visible = true,
    ontop = false,
    type = "dock",
    height = dpi(200),
    width = dpi(340),
    bg = beautiful.bg_false
  }
  awful.placement.centered(s.decorators)
  s.decorators:setup {
    {
      {
        date(shorten.text('%d', beautiful.accent_1), "right"),
        separator,
        date(shorten.text('%A', beautiful.accent_0), "center"),
        layout = wibox.layout.fixed.horizontal
      },
      layout = wibox.layout.fixed.vertical
    },
    date(shorten.text('%B', beautiful.accent_0), "center"),
    separator,
    date(shorten.text('%m', beautiful.accent_1), "left"),
    layout = wibox.layout.fixed.horizontal
  }
  end)
  elseif open == false then
    print("working")
  end
end
-- =============================================
