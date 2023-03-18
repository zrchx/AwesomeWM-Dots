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
local shorten = {}

-- Create rounded rectangle shape
shorten.rrect = function(radius)
    return function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, radius)
    end
end

-- Create partially rounded rect
shorten.prrect = function(radius, tl, tr, br, bl)
    return function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height,
        tl, tr, br, bl,radius)
    end
end

-- Create rounded bar
shorten.rbar = function(width, height)
    return function(cr)
      gears.shape.rounded_bar(cr, width, height)
    end
end

-- Markup 
function shorten.text(txt, fg)
    if fg == "" then
      fg = "#ffffff"
    end
  return "<span foreground='" .. fg .. "'>" .. txt .. "</span>"
end


return shorten
