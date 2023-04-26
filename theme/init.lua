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
local gears = require("gears")
local shorten = require("shorten")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- Aliases --
local config = gears.filesystem.get_configuration_dir()
-- Colors
local colors = {
    -- Background Colors
    bg_0 = "#02020A",
    bg_1 = "#1a1b26",
    bg_2 = "#24283B",
    bg_3 = "#313244",
    -- Foreground Colors
    fg_0 = "#c6d0f5",
    fg_1 = "#c0caf5",
    fg_2 = "#a5adcb",
    fg_3 = "#8a93b1",
    -- Transparent
    transparent = "#00000000",
    -- Accent Colors
    -- Red
    red_0 = "#f5595c",
    red_1 = "#f7768e",
    -- Magenta
    magenta_0 = "#bb9af7",
    magenta_1 = "#ca9ee6",
    -- Lavander
    lavander_0 = "#7287fd",
    lavander_1 = "#7aa2f7",
  }


-- ==========================================

local theme = {}

-- ==========================================
-- Font --
theme.font = "CyberData Regular 11"
theme.font_alt = "CyberData Bold 13"
theme.font_mod = "CyberData"
theme.icon_font = "Symbols Nerd Font"
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
theme.accent_2 = colors.magenta_2
-- ==========================================

-- ==========================================
-- Icons --
theme.icon_theme = 'Crule-dark'
theme.systray_icon_size = dpi(24)
-- ==========================================

-- ==========================================
-- Border Options --
theme.useless_gap = dpi(8)
theme.rounded = dpi(12)
-- ==========================================

-- ==========================================
-- Taglist Theme
theme.taglist_bg = colors.bg_0
theme.taglist_bg_focus = theme.accent_0
theme.taglist_bg_occupied = theme.accent_1
theme.taglist_bg_urgent = colors.yellow_0
theme.taglist_bg_empty = colors.fg_3

theme.taglist_shape = shorten.rrect(6)
-- ==========================================

-- ==========================================
-- Titlebars
theme.titlebars_enabled = true
theme.titlebar_bg_focus = theme.bg_1
theme.titlebar_bg_normal = theme.bg_0
-- ==========================================

-- ==========================================
-- Layouts icons --
theme.layout_floating = config.."theme/images/floating.png"
theme.layout_tile = config.."theme/images/tile.png"
theme.layout_dwindle = config.."theme/images/dwindle.png"
-- ==========================================
require("beautiful").init(theme)
