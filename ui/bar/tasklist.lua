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
local gears = require("gears")
local shorten = require("shorten")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
-- =============================================

return function (s)

-- =============================================
-- Tasklist Buttons
local tasklist_buttons = gears.table.join (
    awful.button({}, 1, function (c)
      if c == c.focus then
        c.minimized = true
      else
        c:emit_signal("request::active", "tasklist", {raise = true})
      end
    end),
    awful.button({}, 2, function () awful.client.focus.byidx(1) end),
    awful.button({}, 3, function () awful.menu.client_list({theme = {width = 150}}) end)
  )
-- =============================================

-- =============================================
-- Tasklist
 local tasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    layout = {
      spacing = dpi(5),
      spacing_widget = {
        {
          forced_width = dpi(2),
          color = beautiful.accent_0,
          shape = shorten.rrect(beautiful.rounded),
          widget = wibox.widget.separator,
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      layout = wibox.layout.flex.horizontal,
    },
    widget_template = {
    {
      {
        {
          {
            id = 'icon_role',
            widget = wibox.widget.imagebox,
          },
          margins = dpi(2),
          widget = wibox.container.margin,
        },
        layout = wibox.layout.flex.horizontal,
      },
      left = dpi(10),
      right = dpi(10),
      widget = wibox.container.margin,
    },
    id = 'background_role',
    widget = wibox.container.background
  }
}
local button = require("shorten.cbutton")(
    {
      { nil,
        tasklist,
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
-- =============================================
