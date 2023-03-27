--[[
_____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
==============@made by Zrchx==================
========= https://github.com/cnapta ==========
--]]

-- ===========================================
-- Library's --
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")
local shorten = require("shorten")
-- ===========================================

-- ===========================================
--                  Widgets                 --
-- ===========================================
-- Clock text
local time = wibox.widget{
    font = beautiful.font_alt,
    format = shorten.text("%I:%M", beautiful.fg_0),
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock
  }
-- Dashbaord
local indicator = wibox.widget{
    widget = wibox.container.background,
    bg = beautiful.accent_0,
    forced_height = dpi(2),
    visible = true
  }
-- Widget
local widget_box = wibox.widget{
    {
      {
        nil, nil, indicator,
        layout = wibox.layout.align.vertical
      },
      {
        {
          {
            time,
            spacing = dpi(0),
            layout = wibox.layout.fixed.horizontal,
          },
          layout = wibox.layout.fixed.horizontal,
          spacing = dpi(25)
        },
        margins = {left = dpi(12), right = dpi(12)},
        widget = wibox.container.margin
        },
      layout = wibox.layout.stack
    },
    widget = wibox.container.background,
    shape = shorten.rrect(beautiful.rounded - 2),
    bg = beautiful.bg_1
  }

-- Colors --
widget_box:connect_signal("mouse::enter", function ()
    widget_box.bg = beautiful.bg_2
end)
widget_box:connect_signal("mouse::leave", function ()
    widget_box.bg = beautiful.bg_1
end)
-- Buttons
widget_box:connect_signal("button::press", function()
    widget_box.opacity = 0.8
  end)

widget_box:connect_signal("button::release", function()
    widget_box.opacity = 1
  end)
return widget_box
