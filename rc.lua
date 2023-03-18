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
-- Enable for lower memory consumption
collectgarbage("incremental", 150, 600, 0)

gears.timer.start_new(60, function()
  collectgarbage()
    collectgarbage("step", 5400)
  return true
end)
-- =============================================
