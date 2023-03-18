--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
==============@made by Zrchx==================
========= https://github.com/cnapta ==========
--]]

-- ==========================================
-- Library's --
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local shorten = require("shorten")
-- Aliases --
local config = gears.filesystem.get_configuration_dir()
-- Colors
local colors = require("theme.colors")
-- ==========================================

local theme = {}

-- ==========================================
-- Font --
theme.font = "AestheticIosevka Regular 11"
theme.font_alt = "AestheticIosevka Bold 13"
theme.font_mod = "AestheticIosevka"
theme.icon_font = "Symbols Nerd Font Bold 48"
-- ==========================================

-- ==========================================
-- BG --
theme.bg_0 = colors.bg_0
theme.bg_1 = colors.bg_1
theme.bg_2 = colors.bg_2
theme.bg_3 = colors.bg_3
theme.bg_false = colors.transparent
-- Background --
theme.bg_normal = theme.bg_0
theme.bg_focus = theme.bg_1
theme.bg_urgent = theme.bg_2
theme.bg_minimize = theme.bg_0
theme.bg_systray = theme.bg_0
-- ==========================================

-- ==========================================
-- FG --
theme.fg_0 = colors.fg_0
theme.fg_1 = colors.fg_1
theme.fg_2 = colors.fg_2
theme.fg_3 = colors.fg_3
-- Foreground --
theme.fg_normal = theme.fg_2
theme.fg_focus = theme.fg_1
theme.fg_urgent = theme.fg_0
theme.fg_minimize = theme.fg_3
-- ==========================================

-- ==========================================
-- Accent --
theme.accent_0 = colors.magenta_0
theme.accent_1 = colors.magenta_1
-- ==========================================

-- ==========================================
-- Icons --
theme.icon_theme = 'Crule-dark'
theme.systray_icon_size = dpi(16)
-- ==========================================

-- ==========================================
-- Border Options --
theme.useless_gap = dpi(8)

theme.rounded = dpi(12)

theme.border_width = dpi(2)
theme.border_color_normal = colors.bg_0
theme.border_color_active = colors.bg_0
theme.border_color_marked = colors.bg_0
-- ==========================================

-- ==========================================
-- Layout list Theme
theme.layoutlist_bg = colors.bg_0
theme.layoutlist_bg_selected = colors.bg_2

theme.layoutlist_fg = colors.fg_0
theme.layoutlist_fg_selected = colors.blue_0

theme.layoutlist_shape = shorten.rrect(dpi(4))
theme.layoutlist_shape_selected = shorten.rrect(dpi(8))
-- ==========================================

-- ==========================================
-- Taglist Theme
theme.taglist_bg = colors.bg_0
theme.taglist_bg_focus = theme.accent_0
theme.taglist_bg_urgent = colors.red_0
theme.taglist_bg_occupied = colors.lavander_0
theme.taglist_bg_empty = colors.fg_2

theme.taglist_fg_focus = theme.accent_1
theme.taglist_fg_occupied = colors.yellow_0
theme.taglist_fg_urgent = colors.orange_0
theme.taglist_fg_empty = colors.lavander_1

theme.taglist_disable_icon = true
theme.taglist_shape = shorten.rrect(6)
-- ==========================================

-- ==========================================
-- Wibar's theme --
theme.wibar_bg = colors.bg_0
theme.wibar_fg = colors.fg_1
theme.wibar_type = "dock"
theme.wibar_shape = shorten.rrect(4)
-- ==========================================

-- ==========================================
-- Dock theme
theme.awesome_dock_size = 80
theme.awesome_dock_pinned = {
    {"alacritty"},
    {"firefox"},
    {"spotify"},
    {"lxappearance"},
    {"nemo"}
  }
theme.awesome_dock_color_active = theme.accent_1
-- ==========================================

-- ==========================================
-- Notify's Theme --
theme.notification_font = theme.font

theme.notification_border_radius = dpi(theme.rounded)
theme.notification_border_width = dpi(2)

theme.notification_spacing = dpi(theme.useless_gap * 2)

theme.notification_icon_size = 64
-- ==========================================

-- ==========================================
-- User Icon --
theme.icon_pfp = config.."theme/images/photo.png"
-- ==========================================

-- ==========================================
-- Layouts icons --
theme.layout_floating = config.."theme/images/floating.png"
theme.layout_tile = config.."theme/images/tile.png"
theme.layout_dwindle = config.."theme/images/dwindle.png"
-- ==========================================

-- ==========================================
-- Icons --
theme.iconmenu = config.."theme/images/menu.png"
theme.sysmenu = config.."theme/images/sysmenu.png"
-- ==========================================
require("beautiful").init(theme)
