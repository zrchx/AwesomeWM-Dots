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
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shorten = require("shorten")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- =============================================

-- =============================================
-- Rounded corners
local function enable_rounding()
    client.connect_signal("request::manage", function (c, startup)
      c.shape = shorten.rrect(beautiful.rounded)
    end)

    local function no_round_corners(c)
      if c.fullscreen then
        c.shape = nil
      elseif c.maximized then
        c.shape = nil
      else
        c.shape = shorten.rrect(beautiful.rounded)
      end
    end
    client.connect_signal("property::fullscreen", no_round_corners)
    client.connect_signal("property::maximized", no_round_corners)
end

enable_rounding()
-- =============================================

-- ===========================================
-- Layoutlist popup widget --
local ll = awful.widget.layoutlist {
    source = awful.widget.layoutlist.source.for_screen,
    base_layout = wibox.widget {
      spacing = dpi(20),
      forced_num_cols = 3,
      layout = wibox.layout.grid.vertical
    },
    widget_template = {
      {
        {
          id = "icon_role",
          forced_height = dpi(72),
          forced_width = dpi(72),
          widget = wibox.widget.imagebox
        },
        margins = dpi(12),
        widget = wibox.container.margin
      },
      id = "background_role",
      forced_width = dpi(62),
      forced_height = dpi(62),
      widget = wibox.container.background
    }
  }

-- Popup
local layout_popup = awful.popup {
    screen = s,
    bg = beautiful.bg_0,
    widget = wibox.widget {
      { ll,
        margins = dpi(20),
        widget = wibox.container.margin
      },
      bg = beautiful.bg_1,
      widget = wibox.container.background
    },
    placement = awful.placement.centered,
    ontop = true,
    visible = false,
    shape = shorten.rrect(beautiful.rounded),
  }

local modkey = "Mod4"

awful.keygrabber {
    start_callback = function() layout_popup.visible = true end,
    stop_callback = function() layout_popup.visible = false end,
    export_keybindings = true,
    stop_event = "release",
    stop_key = {"Escape", "Super_L", "Super_R",},
    keybindings = {
      {{modkey}, "Menu", function()
        awful.layout.set(gears.table.cycle_value(ll.layouts, ll.current_layout, 1),nil) end},
    }
  }
-- ===========================================
