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
local ruled = require("ruled")
local naughty = require("naughty")
local shorten = require("shorten")
local menubar = require("menubar")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- =============================================

-- =============================================
-- Naughty Notifications --
naughty.config.defaults.ontop = true
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 12
naughty.config.defaults.title = "System Notify"
naughty.config.defaults.position = "top_right"
-- Presets
naughty.config.presets.low.timeout = 9
naughty.config.presets.critical.timeout = 0

-- Low preset
naughty.config.presets.low = {
    font = beautiful.font,
    fg = beautiful.fg_0,
    bg = beautiful.bg_0
  }

-- Normal preset
naughty.config.presets.normal = {
    font = beautiful.font,
    fg = beautiful.fg_0,
    bg = beautiful.bg_0
  }

-- Critical preset
naughty.config.presets.critical = {
    font = beautiful.font_mod .. "Bold 12",
    fg = beautiful.fg_0,
    bg = beautiful.bg_1,
    timeout = 0
  }
-- Set preset
naughty.config.presets.ok = naughty.config.presets.normal
naughty.config.presets.info = naughty.config.presets.normal
naughty.config.presets.warn = naughty.config.presets.critical
-- Icons
naughty.connect_signal("request::icon", function(n, context, hints)
    if context ~= "app_icon" then return end
    local path = menubar.utils.lookup_icon(hints.app_icon) or menubar.utils.lookup_icon(hints.app_icon:lower())
    if path then n.icon = path end
end)
-- Ruled
ruled.notification.connect_signal("request::rules", function()
    ruled.notification.append_rule {
      rule = {},
      properties = {screen = awful.screen.preferred, implicit_timeout = 6}
    }
end)
-- =============================================
-- Setup
naughty.connect_signal("request::display", function(n)
    -- Actions widget
    local action_widget = {
      {
        {
          id = "text_role",
          align = "center",
          valign = "center",
          font = beautiful.font_mod .. " Bold 10",
          widget = wibox.widget.textbox
        },
        left = dpi(6),
        right = dpi(6),
        widget = wibox.container.margin
      },
      bg = beautiful.bg_0,
      forced_height = dpi(30),
      shape = shorten.rrect(dpi(5)),
      widget = wibox.container.background
    }
    local actions = wibox.widget {
      notification = n,
      base_layout = wibox.widget {
        spacing = dpi(8),
        layout = wibox.layout.flex.horizontal
      },
      widget_template = action_widget,
      style = {underline_normal = false, underline_selected = true},
      widget = naughty.list.actions
    }
    -- Image widget
    local image_n = wibox.widget {
      {
        image = n.icon,
        resize = true,
        clip_shape = shorten.rrect(beautiful.rounded),
        halign = "center",
        valign = "center",
        widget = wibox.widget.imagebox,
      },
      strategy = "exact",
      height = dpi(78),
      width = dpi(78),
      widget = wibox.container.constraint,
    }
    -- Title and Message widget
    local title_n = wibox.widget{
      {
        {
          markup = shorten.text(n.title, beautiful.fg_0),
          font = beautiful.font_mod .. " Bold 11",
          align = "left",
          valign = "center",
          widget = wibox.widget.textbox
        },
        forced_width = dpi(200),
        widget = wibox.container.scroll.horizontal,
        step_function = wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth,
        speed = 50
      },
      margins = {right = 15},
      widget = wibox.container.margin
    }
    local message_n = wibox.widget{
      {
        {
          markup = shorten.text(n.message, beautiful.fg_0),
          font = beautiful.font_mod .. " 11",
          align = "left",
          valign = "center",
          wrap = "char",
          widget = wibox.widget.textbox
        },
        forced_width = dpi(200),
        layout = wibox.layout.fixed.horizontal
      },
      margins = {right = 15},
      widget = wibox.container.margin
    }
    -- Apps name
    local app_name_n = wibox.widget{
      markup = shorten.text(n.app_name, beautiful.fg_1),
      font = beautiful.font_mod .. " Bold 10",
      align = "left",
      valign = "center",
      widget = wibox.widget.textbox
    }
    -- Time widget
    local time_n = wibox.widget{
      {
        markup = shorten.text(os.date('%I:%M '), beautiful.fg_1),
        font = beautiful.font_mod .. " Bold Italic 10",
        align = "right",
        valign = "center",
        widget = wibox.widget.textbox
      },
      margins = {right = 20},
      widget  = wibox.container.margin
    }
    -- Info widget
    local notif_info = wibox.widget{
      app_name_n,
      {
        widget = wibox.widget.separator,
        shape = gears.shape.circle,
        forced_height = dpi(6),
        forced_width = dpi(8),
        color = beautiful.accent_0
      },
      time_n,
      layout = wibox.layout.fixed.horizontal,
      spacing = dpi(9)
    }
    -- Main
    naughty.layout.box {
      notification = n,
      type = "notification",
      bg = beautiful.bg_color,
      shape = shorten.rrect(beautiful.rounded),
      widget_template = {
        {
          {
            {
              {
                notif_info,
                  {
                    {
                      title_n,
                      message_n,
                      layout = wibox.layout.fixed.vertical,
                      spacing = dpi(3)
                    },
                    margins = {left = dpi(6)},
                    widget = wibox.container.margin
                  },
                layout = wibox.layout.fixed.vertical,
                spacing = dpi(16)
              },
              nil,
              image_n,
              layout = wibox.layout.align.horizontal,
              expand = "none"
            },
            {
              {actions, layout = wibox.layout.fixed.vertical},
              margins = {top = dpi(20)},
              visible = n.actions and #n.actions > 0,
              widget = wibox.container.margin
            },
            layout = wibox.layout.fixed.vertical,
          },
          margins = dpi(18),
          widget = wibox.container.margin
        },
        widget = wibox.container.background,
        forced_width = dpi(340),
        shape = shorten.rrect(beautiful.rounded),
        bg = beautiful.bg_2,
      }
    }
end)
