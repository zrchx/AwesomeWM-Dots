--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
==============@made by Zrchx==================
========= https://github.com/cnapta ==========
--]]

-- ===========================================
--              Key-Bindings                --
-- ===========================================

-- ===========================================
-- Library's --
local awful = require("awful")
require("awful.autofocus")
-- Aliases --
local modkey = "Mod4"
local altkey = "Mod1"
local term = "alacritty"
local apps = "sh ~/.config/rofi/bin/launcher.sh"
local appsroot = "sh ~/.config/rofi/bin/appsroot.sh"
local screnshot = "sh ~/.config/rofi/bin/screnshot.sh"
local gpick = "sh ~/.config/awesome/config/picker.sh"
local audio_lower= "pamixer -i 5"
local audio_raise = "pamixer -d 5"
-- ===========================================

-- ===========================================
-- General Awesome keys
-- ===========================================
awful.keyboard.append_global_keybindings({
    -- Restart Awesome
  awful.key({ modkey, "Shift" }, "r", awesome.restart),
    -- Quit Awesome
  awful.key({ modkey, "Shift"}, "q", awesome.quit),
    -- Open A new Terminal
  awful.key({ modkey,}, "Return", function () awful.spawn(term) end),
    -- Run Rofi
  awful.key({ modkey }, "d", function () awful.spawn.with_shell(apps) end),
    -- Run color picker
  awful.key({ modkey, "Shift" }, "o", function () awful.spawn.with_shell(gpick) end),
    -- Run screnshots
  awful.key({ modkey }, "s", function () awful.spawn.with_shell(screnshot) end),
    -- Run some apps as root
  awful.key({ modkey }, "y", function () awful.spawn.with_shell(appsroot) end),

    -- Layout related keybindings --

    -- Increase the master width factor
  awful.key({ modkey,}, "l", function () awful.tag.incmwfact( 0.05) end),
    -- Decrease master width factor
  awful.key({ modkey,}, "h", function () awful.tag.incmwfact(-0.05) end),
    -- Change the layout
  awful.key({ modkey,}, "Tab", function () awful.layout.inc( 1) end),

    -- Desktop Control --

    -- Move the focus Window to the desktop select
  awful.key {modifiers = { modkey, "Shift" }, keygroup = "numrow",
    on_press = function (index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
    end,
  },
    -- Move to the next Desktop
  awful.key {modifiers = { modkey }, keygroup = "numrow",
    on_press = function (index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },
})
-- ===========================================
-- Mouse bindings --
-- ===========================================
client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
      -- Move the window select
      awful.button({ modkey }, 1, function (c)
        c:activate { context = "mouse_click", action = "mouse_move"} end),
      -- Resize the window select
      awful.button({ modkey }, 3, function (c)
        c:activate { context = "mouse_click", action = "mouse_resize"} end),
    })
end)

-- ===========================================
-- Basic Keys --
-- ===========================================
client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
      -- Change to next client
      awful.key({ modkey, altkey }, "j", function () awful.client.focus.byidx( 1) end),
      -- Change to previous client
      awful.key({ modkey, altkey }, "k", function () awful.client.focus.byidx(-1) end),
      -- Put in fullscreen the select window
      awful.key({ modkey,}, "f", function (c) c.fullscreen = not c.fullscreen c:raise() end),
      -- Termine the window select
      awful.key({ modkey,}, "z", function (c) c:kill() end),
      -- Toggle floating mode 
      awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle),
      -- Change the window to the other screen  
      awful.key({ modkey,}, "o", function (c) c:move_to_screen() end),
      -- Audio Control --
      awful.key({ }, "XF86AudioLowerVolume", function () awful.spawn.with_shell(audio_lower) end),
      awful.key({ }, "XF86AudioRaiseVolume", function () awful.spawn.with_shell(audio_raise) end),
    })
end)
