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
local ruled = require("ruled")
local gears = require("gears")
local shorten = require("shorten")
local beautiful = require("beautiful")
local home = os.getenv("HOME").."/Pictures/Wallpapers"
-- =============================================

-- =============================================
-- File inclusion --
require("config.keys")
-- =============================================

-- =============================================
-- Rounded corners
local function rounding ()
    client.connect_signal("request::manage", function (c, startup)
      if not c.fullscreen and not c.maximized then
        c.shape = shorten.rrect(beautiful.rounded)
      end
    end)
    local function no_round_corners(c)
      if c.fullscreen or c.maximized then
        c.shape = nil
      else
        c.shape = shorten.rrect(beautiful.rounded)
      end
    end
    client.connect_signal("property::fullscreen", no_round_corners)
    client.connect_signal("property::maximized", no_round_corners)
end
rounding ()
-- =============================================

-- =============================================
-- Wallpaper function
local function wallpaper ()
  -- Locals to use
  local bg = home.."/Wallpaper-2.png"
  local hour = tonumber(os.date('%H%M'))
  -- Redifine bg local
  if hour < 1854 then
    bg = home.."/Wallpaper-5.png"
  elseif hour == 1854 then
    bg = home.."/Wallpaper-3.png"
  elseif hour > 1854 then
    bg = home.."/Wallpaper-3.png"
  end
  -- Set Wallpaper
  screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
      screen = s,
      widget = {
        image = bg,
        widget = wibox.widget.imagebox,
        upscale = true,
        downscale = true,
        horizontal_fit_policy = "fit",
        vertical_fit_policy = "fit",
      }
    }
  end)
end
-- Timer
gears.timer {
    timeout   = 1080,
    call_now  = true,
    autostart = true,
    callback  = wallpaper
  }
-- =============================================

-- ===========================================
-- Layouts --
local l = awful.layout.suit
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
    l.floating, l.tile, l.spiral.dwindle,
  })
end)
-- Set tags
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({"1","2","3",}, s, awful.layout.layouts[1])
end)
-- ===========================================

-- =============================================
-- Sloppy focus --
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
-- =============================================

-- =============================================
--              Rules And Clients             --
ruled.client.connect_signal("request::rules", function()
    ruled.client.append_rule {
      id = "global",
      rule = { },
      properties = {
        focus = awful.client.focus.filter,
        raise = true,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
      }
    }

    -- Floating clients
    ruled.client.append_rule {
      id = "floating",
      rule_any = {
        class = { "Nemo","Spotify", "Lxappearance", "Viewnior", "Qalculate-gtk"},
      },
      properties = { floating = true }
    }

    -- Fullscren clients
    ruled.client.append_rule {
      id = "fullscren",
      rule_any = {
        class = { "Project Zomboid" },
      },
      properties = { fullscreen = true }
    }

    -- Tags related
    -- Priority tag #1
    ruled.client.append_rule {
      rule = { class = "firefox"},
      properties = { tag = "1" }
    }
    ruled.client.append_rule {
      rule = { class = "Timeshitf-gtk"},
      properties = { tag = "3" }
    }
    -- Priority tag #2
    ruled.client.append_rule {
      rule = { class = "Nemo"},
      properties = { tag = "2" }
    }
    ruled.client.append_rule {
      rule = { class = "Lxappearance"},
      properties = { tag = "2" }
    }
    ruled.client.append_rule {
      rule = { class = "Qalculate-gtk"},
      properties = { tag = "2" }
    }
    -- Priority tag #3
    ruled.client.append_rule {
      rule = { class = "Spotify"},
      properties = { tag = "3" }
    }
end)
-- =============================================

-- =============================================
-- AutoStart
awful.spawn.with_shell ( "picom --experimental-backends" )
-- =============================================
