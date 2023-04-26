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

local button = require("shorten.cbutton")(
    {
      { nil,
        time,
        layout = wibox.layout.align.vertical,
        expand = "none",
      },
      margins = {left = dpi(12), right = dpi(12)},
      widget = wibox.container.margin,
    },
    beautiful.bg_1,
    beautiful.bg_3,
    dpi(0),
    dpi(2),
    beautiful.accent_0,
    shorten.rrect(beautiful.rounded - 2)
  )
return button
