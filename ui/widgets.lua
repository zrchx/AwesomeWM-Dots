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
local wibox = require("wibox")
local shorten = require("shorten")
local beautiful = require("beautiful")
-- =============================================

-- ===========================================
--                Widgets                   --
local w = {}
w.time = wibox.widget{
    font = beautiful.font_alt,
    format = shorten.text("%I:%M", beautiful.fg_0),
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock
  }


return w
-- ===========================================

