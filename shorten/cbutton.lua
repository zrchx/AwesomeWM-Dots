--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
==============@made by zrchx==================
========= https://github.com/cnapta ==========
--]]

-- =============================================
-- library's --
local beautiful = require "beautiful"
local gears = require "gears"
local wibox = require "wibox"
local rubato = require("shorten.rubato")
local dpi = beautiful.xresources.apply_dpi
-- =============================================

-- =============================================
return function (widget, normal_bg, press_color, margins, border_width, border_color, shape_spe)
    -- containers
    local circle_animate = wibox.widget{
    	widget = wibox.container.background,
    	shape = shape_spe or gears.shape.rounded_bar,
    	bg = press_color or beautiful.accent_3,
    }
    local mainbox = wibox.widget {
      {
        circle_animate,
          {
            widget,
            margins = margins or  dpi(15),
            widget = wibox.container.margin
          },
        layout = wibox.layout.stack
      },
      bg = (normal_bg) or beautiful.bg_3,
      shape = shape_spe or gears.shape.rounded_bar,
      border_width = border_width or dpi(0),
      border_color = border_color or press_color or "#00000000",
      widget = wibox.container.background,
    }
    local animation_button_opacity = rubato.timed{
      pos = 0,
      rate = 60,
      intro = 0.08,
      duration = 0.3,
      awestore_compat = true,
      subscribed = function(pos)
		    circle_animate.opacity = pos
      end
    }
    mainbox:connect_signal("mouse::enter", function()
      animation_button_opacity:set(0.2)
	  end)
	  mainbox:connect_signal("mouse::leave", function()
      animation_button_opacity:set(0.0)
	  end)
    -- add buttons and commands
    mainbox:connect_signal("button::press", function()
      animation_button_opacity:set(0.7)
	  end)

    mainbox:connect_signal("button::release", function()
      animation_button_opacity:set(0.2)
	  end)
return mainbox
end
-- =============================================
