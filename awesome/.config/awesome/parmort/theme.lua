--      Parmort's Theme      --
-- Based off Powerarrow-dark --

local gears      = require("gears")
local awful      = require("awful")
local wibox      = require("wibox")
local vicious    = require("vicious")
local separators = require("separators")
local mtntop     = require("mtntop.colors")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/parmort"
theme.wallpaper                                 = os.getenv("HOME") .. "/.fehbg"
theme.font                                      = "monospace 9"
theme.fg_normal                                 = mtntop.fg
theme.fg_focus                                  = mtntop.focus.fg
theme.fg_urgent                                 = mtntop.urgent.fg
theme.bg_normal                                 = mtntop.bg
theme.bg_focus                                  = mtntop.focus.bg
theme.bg_urgent                                 = mtntop.urgent.bg
theme.border_width                              = 0.5
theme.border_normal                             = theme.bg_normal
theme.border_focus                              = theme.bg_focus
theme.border_marked                             = theme.bg_urgent
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = 16
theme.menu_width                                = 140
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 7

local widgets = {}

-- Clock
clock = wibox.widget.textbox()
vicious.register(clock, vicious.widgets.date, "%H:%M %a %b %e", 60)

widgets.clock = wibox.widget {
  widget = clock,
  font = theme.font
}

-- Battery
function batlabel(widget, args)
  if args[1] == "-" then
    sl = "DIS"
  elseif args[1] == "+" then
    sl = " RE"
  else
    sl = "   "
  end

  return sl .. " " .. args[2] .. " "
end

batbar = wibox.widget.progressbar()
batlab = wibox.widget.textbox()

vicious.register(batbar, vicious.widgets.bat, "$2", 2, "BAT0")
vicious.register(batlab, vicious.widgets.bat, batlabel, 2, "BAT0")

widgets.batlabel = wibox.widget {
  widget = batlab,
  font = theme.font
}
widgets.battery = wibox.layout.margin(wibox.widget {
    max_value = 1,
    forced_width = 40,
    widget = batbar,
    background_color = theme.bg_normal,
    color = theme.fg_focus
}, 1, 1, 3, 3)

-- Volume
volume = wibox.widget.textbox()

vicious.register(volume, vicious.widgets.volume, "$2 $1", 1, "Master")

widgets.volume = wibox.widget {
  widget = volume,
  font = theme.font
}

-- Uptime
uptime = wibox.widget.textbox()

vicious.register(uptime, vicious.widgets.uptime, "$1:$2:$3 UP", 60)

widgets.uptime = wibox.widget {
  widget = uptime,
  font = theme.font
}

-- Separators
local spr = wibox.widget.textbox(' ')
local ald = separators.arrow_left(theme.bg_focus, "alpha")
local adl = separators.arrow_left("alpha", theme.bg_focus)

-- Eminent-like task filtering
local orig_filter = awful.widget.taglist.filter.all

-- Taglist label functions
awful.widget.taglist.filter.all = function (t, args)
    if t.selected or #t:clients() > 0 then
        return orig_filter(t, args)
    end
end

function theme.at_screen_connect(s)
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 18, bg = theme.bg_normal, fg = theme.fg_normal })

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            spr,
        },
        wibox.widget.textbox(), -- Middle Widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spr,
            -- Uptime
            adl,
            wibox.container.background(spr, theme.bg_focus),
            wibox.container.background(widgets.uptime, theme.bg_focus),
            wibox.container.background(spr, theme.bg_focus),
            -- Volume
            ald,
            wibox.container.background(spr, theme.bg_normal),
            wibox.container.background(widgets.volume, theme.bg_normal),
            wibox.container.background(spr, theme.bg_normal),
            -- Battery
            adl,
            wibox.container.background(spr, theme.bg_focus),
            wibox.container.background(widgets.batlabel, theme.bg_focus),
            wibox.container.background(widgets.battery, theme.bg_focus),
            wibox.container.background(spr, theme.bg_focus),
            -- Clock
            ald,
            wibox.container.background(spr, theme.bg_normal),
            wibox.container.background(widgets.clock, theme.bg_normal),
            wibox.container.background(spr, theme.bg_normal),
            -- layout
            adl,
            wibox.container.background(s.mylayoutbox, theme.bg_focus),
        },
    }
end

return theme
