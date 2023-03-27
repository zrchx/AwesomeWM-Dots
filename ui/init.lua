-- =============================================
-- Config Files --
require("ui.panel")
require("ui.notifys")
-- =============================================

-- =============================================
-- Library's --
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")
-- =============================================

-- =============================================
-- Titlebar --
awful.titlebar.enable_tooltip = false
client.connect_signal("request::titlebars", function(c)
  awful.titlebar(c, { position = beautiful.titlebar_position, size = beautiful.titlebar_size } )
    :setup
    {
      {
        {
          awful.titlebar.widget.closebutton(c),
          awful.titlebar.widget.maximizedbutton(c),
          awful.titlebar.widget.minimizebutton(c),
          layout = wibox.layout.fixed.vertical
        },
          {
            widget = wibox.widget.textbox("")
          },
        layout = wibox.layout.align.vertical
      },
      margins = dpi(4),
      widget = wibox.container.margin
    }
end)
-- =============================================
