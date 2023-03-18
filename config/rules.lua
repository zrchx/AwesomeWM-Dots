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
local ruled = require("ruled")
local naughty = require("naughty")
-- =============================================

-- =============================================
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
        class = { "Nemo","Spotify", "Lxappearance", "Viewnior",},
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
    ruled.client.append_rule {
      rule = { class = "firefox"},
        properties = { tag = "1" }
    }
    ruled.client.append_rule {
      rule = { class = "Spotify"},
        properties = { tag = "3" }
    }
end)
-- =============================================

-- =============================================
-- Error handling --
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    app_name = "AwesomeWM",
    urgency = "critical",
    title   = "LMAO, What you do?"..(startup and "during startup/restart!" or "!"),
    message = message
}end)
-- =============================================

-- =============================================
-- Notifications
ruled.notification.connect_signal('request::rules', function()
    ruled.notification.append_rule {
      rule = { },
      properties = {
        screen = awful.screen.preferred,
        implicit_timeout = 15,
      }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)
-- =============================================
