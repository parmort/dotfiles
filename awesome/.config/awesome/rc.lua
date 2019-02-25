-- vim: set fdm=marker cc=:

-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
--local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Helper functions

local function focus_dir (dir)
  awful.client.focus.global_bydirection(dir)

  if client.focus then client.focus:raise() end
end

local function swap_dir (dir)
  awful.client.swap.global_bydirection(dir)
end

local function center_win (w, h)
  return {
    x = awful.screen.focused().geometry.width / 2 - w / 2,
    y = awful.screen.focused().geometry.height / 2 - h / 2,
  }
end
-- }}}

-- {{{ Autostart windowless processes

local function run_on_start(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

-- This function will run every time Awesome is started (including restarts)

-- run_on_start({
--   'polybar bar',
-- })

-- This function will run once, when Awesome is first started
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    '~/.fehbg'
)

-- }}}

-- {{{ Variable definition

local themes = {
    "blackburn",       -- 1
    "copland",         -- 2
    "dremora",         -- 3
    "holo",            -- 4
    "multicolor",      -- 5
    "powerarrow",      -- 6
    "powerarrow-dark", -- 7
    "rainbow",         -- 8
    "steamburn",       -- 9
    "vertex",          -- 10
}

local chosen_theme = themes[2]
local modkey       = "Mod4"
local altkey       = "Mod1"
local hypkey       = "Mod3"
local terminal     = "st"
local editor       = os.getenv("EDITOR") or "vim"
local browser      = "firefox"
local scrlocker    = "~/.config/i3/lock.sh"

awful.util.terminal = terminal
awful.util.tagnames = { "1", "2", "3", "4", "MUS", "EML" }
awful.layout.layouts = {
    -- awful.layout.suit.floating,
    -- awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
    -- lain.layout.cascade,
    -- lain.layout.cascade.tile,
    -- lain.layout.centerwork,
    -- lain.layout.centerwork.horizontal,
    -- lain.layout.termfair,
    -- lain.layout.termfair.center,
}

awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = 250}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = 2
lain.layout.cascade.tile.offset_y      = 32
lain.layout.cascade.tile.extra_padding = 5
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
-- }}}

-- {{{ Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)
-- }}}

-- {{{ Key bindings
globalkeys = my_table.join(

    -- {{{{ Hotkeys
    -- X screen locker
    awful.key({ modkey }, "x", function () os.execute(scrlocker) end,
              {description = "lock screen", group = "hotkeys"}),
    -- Go to previous tag
    awful.key({ modkey }, "\\", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    -- }}}}

    -- {{{{ Screen

    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ altkey }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then client.focus:raise() end
        end,
        {description = "go back", group = "client"}),

    -- }}}}

    -- {{{{ Awesome

    -- Show keybinding help
    awful.key({}, "F1", hotkeys_popup.show_help,
              {description = "show help", group="awesome"}),

    -- Hide the wibox
    awful.key({ hypkey }, "h", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end, {description = "toggle wibox", group = "awesome"}),

    awful.key({ hypkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Shift" }, "x", function()
            os.execute('mpc pause')
            awesome.quit()
          end, {description = "quit awesome", group = "awesome"}),

    awful.key({ hypkey }, "b", function() os.execute('/home/nolan/.scripts/selbg') end),

    -- }}}}

    -- {{{{ Tag
    -- Dynamic tagging
    awful.key({ modkey, "Shift" }, "n", function () lain.util.add_tag() end,
              {description = "add new tag", group = "tag"}),
    awful.key({ modkey, "Shift" }, "r", function () lain.util.rename_tag() end,
              {description = "rename tag", group = "tag"}),
    awful.key({ modkey, "Shift" }, "Left", function () lain.util.move_tag(-1) end,
              {description = "move tag to the left", group = "tag"}),
    awful.key({ modkey, "Shift" }, "Right", function () lain.util.move_tag(1) end,
              {description = "move tag to the right", group = "tag"}),
    awful.key({ modkey, "Shift" }, "d", function () lain.util.delete_tag() end,
              {description = "delete tag", group = "tag"}),

    -- }}}}

    -- {{{{ Launcher

    awful.key({ modkey }, "d", function () awful.spawn("dmenu_run") end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),

    awful.key({ modkey }, "w", function () awful.spawn(browser) end,
              {description = "open a web browser", group = "launcher"}),

    awful.key({ modkey }, "r", function () awful.spawn(terminal.." -e ranger") end,
              {description = "open ranger", group = "launcher"}),

    -- }}}}

    -- {{{{ Layout

    -- Resize master window width
    awful.key({ altkey, "Shift" }, "l", function () awful.tag.incmwfact(-0.05) end,
              {description = "increase master width", group = "layout"}),
    awful.key({ altkey, "Shift" }, "h", function () awful.tag.incmwfact( 0.05) end,
              {description = "decrease master width", group = "layout"}),

    -- Increase columns
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1, nil, true) end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1, nil, true) end,
              {description = "decrease the number of columns", group = "layout"}),

    -- Make gaps bigger/smaller
    awful.key({ altkey, "Shift" }, "j", function() lain.util.useless_gaps_resize(-1) end,
              {description = "increase gaps", group = "layout"}),
    awful.key({ altkey, "Shift" }, "k", function() lain.util.useless_gaps_resize( 1) end,
              {description = "decrease gaps", group = "layout"}),

    -- }}}}

    -- {{{{ Widgets

    awful.key({ altkey, }, "c", function () if beautiful.cal then beautiful.cal.show(7) end end,
              {description = "show calendar", group = "widgets"}),
    awful.key({ altkey, }, "h", function () if beautiful.fs then beautiful.fs.show(7) end end,
              {description = "show filesystem", group = "widgets"}),
    awful.key({ altkey, }, "w", function () if beautiful.weather then beautiful.weather.show(7) end end,
              {description = "show weather", group = "widgets"}),

    -- }}}}

    -- {{{{ MPD

    awful.key({}, "XF86AudioRaiseVolume", function ()
            os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
            beautiful.volume.update()
        end, {description = "volume up", group = "MPD"}),

    awful.key({}, "XF86AudioLowerVolume", function ()
            os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
            beautiful.volume.update()
        end, {description = "volume down", group = "MPD"}),

    awful.key({}, "XF86AudioMute", function ()
            os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end, {description = "toggle mute", group = "MPD"}),

    awful.key({}, "XF86AudioPlay", function ()
            os.execute("mpc toggle")
            beautiful.mpd.update()
        end, {description = "Play/Pause music", group = "MPD"}),

    awful.key({}, "XF86AudioStop", function ()
            os.execute("mpc stop")
            beautiful.mpd.update()
        end, {description = "Stop music", group = "MPD"}),

    awful.key({}, "XF86AudioPrev", function ()
            os.execute("mpc prev")
            beautiful.mpd.update()
        end, {description = "Prev track", group = "MPD"}),

    awful.key({}, "XF86AudioNext", function ()
            os.execute("mpc next")
            beautiful.mpd.update()
        end, {description = "Next track", group = "MPD"}),

    -- }}}}

    -- {{{{ Client

    -- Default client focus. Helpful for floating windows
    awful.key({ hypkey }, "j", function () awful.client.focus.byidx( 1) end,
        {description = "focus next by index", group = "client"}),
    awful.key({ hypkey }, "k", function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),

    -- By direction client focus, move client if floating
    awful.key({ modkey }, "j", function() focus_dir("down")  end,
        {description = "focus down",  group = "client"}),
    awful.key({ modkey }, "k", function() focus_dir("up")    end,
        {description = "focus up",    group = "client"}),
    awful.key({ modkey }, "h", function() focus_dir("left")  end,
        {description = "focus left",  group = "client"}),
    awful.key({ modkey }, "l", function() focus_dir("right") end,
        {description = "focus right", group = "client"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "j", function () swap_dir("down") end,
              {description = "swap down", group = "client"}),
    awful.key({ modkey, "Shift" }, "k", function () swap_dir("up") end,
              {description = "swap up", group = "client"}),
    awful.key({ modkey, "Shift" }, "h", function () swap_dir("left") end,
              {description = "swap left", group = "client"}),
    awful.key({ modkey, "Shift" }, "l", function () swap_dir("right") end,
              {description = "swap right", group = "client"})
    -- }}}}
)

local move_by = 15

-- {{{{ Per-window bindings
clientkeys = my_table.join(
    awful.key({ modkey }, "q", function (c) c:kill() end,
              {description = "close", group = "client"}),
    awful.key({ altkey, "Shift" }, "m", lain.util.magnify_client,
              {description = "magnify client", group = "client"}),
    awful.key({ modkey, "Shift" }, "space", awful.client.floating.toggle,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey }, "o", function (c) c:move_to_screen() end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey }, "t", function (c) c.ontop = not c.ontop end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ hypkey }, "m", function (c)
            c.maximized = not c.maximized
            c:raise()
        end, {description = "maximize", group = "client"}),
    awful.key({ modkey }, "c", awful.placement.centered,
              {description = "move to center", group = "client"}),

    -- Move client
    awful.key({ modkey }, "y", function(c) c.x = c.x - move_by end,
              {description = "move to left", group = "client"}),
    awful.key({ modkey }, "u", function(c) c.y = c.y + move_by end,
              {description = "move to up", group = "client"}),
    awful.key({ modkey }, "i", function(c) c.y = c.y - move_by end,
              {description = "move to down", group = "client"}),
    awful.key({ modkey }, "o", function(c) c.x = c.x + move_by end,
              {description = "move to right", group = "client"}),

    -- Resize client
    awful.key({ modkey, "Shift" }, "y", function(c) c.width = c.width - move_by end),
    awful.key({ modkey, "Shift" }, "u", function(c) c.height = c.height + move_by end),
    awful.key({ modkey, "Shift" }, "i", function(c) c.height = c.height - move_by end),
    awful.key({ modkey, "Shift" }, "o", function(c) c.width = c.width + move_by end)
)
-- }}}}

-- {{{{ Tag # Bindings
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end
    globalkeys = my_table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  descr_toggle),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  descr_toggle_focus)
    )
end
-- }}}}

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = false } },

    { rule = { class = "Gimp", role = "gimp-image-window" },
          properties = { maximized = true } },

    { rule = { name = "ranger" },
          properties = {floating = true,
                        width = 700,
                        height = 450,
                        placement = awful.placement.centered
                      } }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = my_table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 2, function() c:kill() end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {size = 16}) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = true})
end)

-- No border for maximized clients
function border_adjust(c)
    if c.maximized then -- no borders if only 1 client visible
        c.border_width = 0
    elseif #awful.screen.focused().clients > 1 then
        c.border_width = beautiful.border_width
        c.border_color = beautiful.border_focus
    end
end

client.connect_signal("property::maximized", border_adjust)
client.connect_signal("focus", border_adjust)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- possible workaround for tag preservation when switching back to default screen:
-- https://github.com/lcpz/awesome-copycats/issues/251
-- }}}
