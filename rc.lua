pcall(require, "luarocks.loader")
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
local gears = require("gears")
local naughty = require("naughty")
-- =============================================

-- =============================================
-- Keys, misc and etc --
require('config')
-- Theme --
require('theme')
-- User Interface --
require('ui')
-- =============================================

-- =============================================
-- Error handling --
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    app_name = "AwesomeWM",
    urgency = "critical",
    title   = "LMAO, What you do?"..(startup and "during startup/restart!" or "!"),
    message = message
  }
end)
-- =============================================

-- =============================================
-- Enable for lower memory consumption
collectgarbage("incremental", 150, 600, 0)

gears.timer.start_new(60, function()
  collectgarbage()
    collectgarbage("step", 5400)
  return true
end)
-- =============================================
