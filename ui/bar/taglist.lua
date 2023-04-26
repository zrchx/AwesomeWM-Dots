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
local awful = require("awful")
local gears = require("gears")
local shorten = require("shorten")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- ===========================================

return function(s)

-- ===========================================
-- Tags Buttons --
 local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
  )
-- ===========================================

-- ===========================================
-- Create a taglist
  local tag_list = awful.widget.taglist{
    screen = s,
		filter = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
    layout = { spacing = dpi(28), shape = shorten.rrect(beautiful.rounded / 2), layout = wibox.layout.fixed.horizontal },
    widget_template = {
      id = "background_role",
      bg = beautiful.bg_0,
      shape = shorten.rrect(beautiful.rounded / 2),
      widget = wibox.container.background,
      forced_height = dpi(12),
      forced_width = dpi(18),
      create_callback = function(self, c3, _)
        if c3.selected then
          self:get_children_by_id("background_role")[1].forced_width = dpi(32)
        elseif #c3:clients() == 0 then
          self:get_children_by_id("background_role")[1].forced_width = dpi(18)
        else
          self:get_children_by_id("background_role")[1].forced_width = dpi(24)
        end
      end,
      update_callback = function(self, c3, _)
        if c3.selected then
				  self:get_children_by_id("background_role")[1].forced_width = dpi(32)
        elseif #c3:clients() == 0 then
				  self:get_children_by_id("background_role")[1].forced_width = dpi(18)
        else
				  self:get_children_by_id("background_role")[1].forced_width = dpi(24)
        end
      end,
    }
  }
  local button = require("shorten.cbutton")(
    {
      { nil,
        tag_list,
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
end
-- ===========================================
