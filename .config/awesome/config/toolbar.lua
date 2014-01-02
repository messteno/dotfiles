local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local menubar = require("menubar")
local beautiful = require("beautiful")
local awesompd = require("../awesompd/awesompd")
local vicious = require("vicious")

beautiful.widget_sep = AWESOME_FOLDER .. "/icons/separator.png"
beautiful.widget_bat = AWESOME_FOLDER .. "/icons/bat.png"

-- {{{ Reusable separator
separator = wibox.widget.imagebox()
separator:set_image(theme.sep)

spacer = wibox.widget.textbox()
spacer:set_text("  ")

mspacer = wibox.widget.textbox()
mspacer:set_text(" ")
-- }}}

batwidget = wibox.widget.textbox()
baticon = wibox.widget.imagebox()

-- Register widget
vicious.register(batwidget, vicious.widgets.bat,
    function (widget, args)
        if args[2] == 0 then return ""
        elseif args[2] < 20 then
            baticon:set_image(theme.bat_empty)
            return "<span color='#ff0000'><b>" .. args[2] .. "%</b></span>"
        elseif args[2] < 40 then
            baticon:set_image(theme.bat_bad)
            return "<span color='#ff6400'><b>" .. args[2] .. "%</b></span>"
        elseif args[2] < 70 then
            baticon:set_image(theme.bat_normal)
            return "<span color='#b3b3b3'><b>" .. args[2] .. "%</b></span>"
        else
            baticon:set_image(theme.bat_ok)
            return "<span color='#2CA542'><b>" .. args[2] .. "%</b></span>"
        end
    end, 61, "BAT0"
)

systray = wibox.widget.systray()


memicon = wibox.widget.imagebox()
memicon:set_image(theme.mem)
 
vicious.cache(vicious.widgets.mem)
-- Initialize widget
memtext = wibox.widget.textbox()
-- Register widget
vicious.register(memtext, vicious.widgets.mem, "<span color='#51abac'> $2/$3MB</span>")


cpuicon = wibox.widget.imagebox()
cpuicon:set_image(theme.cpu)

vicious.cache(vicious.widgets.cpu)
-- Initialize widget
cpuwidget = awful.widget.graph()
-- Graph properties
cpuwidget:set_width(40)
cpuwidget:set_background_color("#494b4f")
cpuwidget:set_color("#ff9300")
cpuwidget:set_border_color("#132224")
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")

-- Initialize widget
core1 = awful.widget.progressbar()
-- Progressbar properties
core1:set_width(7)
core1:set_height(10)
core1:set_vertical(true)
core1:set_background_color("#494b4f")
core1:set_color("#ff9300")
core1:set_border_color("#132224")
-- Register widget
vicious.register(core1, vicious.widgets.cpu, "$2", 1)

-- Initialize widget
core2 = awful.widget.progressbar()
-- Progressbar properties
core2:set_width(7)
core2:set_height(10)
core2:set_vertical(true)
core2:set_background_color("#494b4f")
core2:set_color("#ff9300")
core2:set_border_color("#132224")
-- Register widget
vicious.register(core2, vicious.widgets.cpu, "$2", 2)

-- Initialize widget
core3 = awful.widget.progressbar()
-- Progressbar properties
core3:set_width(7)
core3:set_height(10)
core3:set_vertical(true)
core3:set_background_color("#494b4f")
core3:set_color("#ff9300")
core3:set_border_color("#132224")
-- Register widget
vicious.register(core3, vicious.widgets.cpu, "$2", 3)

-- Initialize widget
core4 = awful.widget.progressbar()
-- Progressbar properties
core4:set_width(7)
core4:set_height(10)
core4:set_vertical(true)
core4:set_background_color("#494b4f")
core4:set_color("#ff9300")
core4:set_border_color("#132224")
-- Register widget
vicious.register(core4, vicious.widgets.cpu, "$2", 4)

-- Initialize widget
cputext = wibox.widget.textbox()
-- Register widget
vicious.register(cputext, vicious.widgets.cpu, "<span color='#ffaacc'> $1% </span>")

thermicon = wibox.widget.imagebox()
thermicon:set_image(theme.thermal)
-- {{{ CPU temperature
therm  = wibox.widget.textbox()
vicious.register(therm, vicious.widgets.thermal, "<span color='#dedd76'>$1°C</span>", 20, { "thermal_zone0", "sys"} )
-- }}

musicwidget = awesompd:create() -- Create awesompd widget
musicwidget.font = "Ubuntu Mono Bold 10" -- Set widget font 
musicwidget.scrolling = true -- If true, the text in the widget will be scrolled
musicwidget.output_size = 100 -- Set the size of widget in symbols
musicwidget.update_interval = 10 -- Set the update interval in seconds
musicwidget.path_to_icons = AWESOME_FOLDER .. "awesompd/icons" 
musicwidget.jamendo_format = awesompd.FORMAT_MP3
musicwidget.show_album_cover = true
musicwidget.album_cover_size = 50
musicwidget.mpd_config = "/etc/mpd.conf"
musicwidget.browser = "chromium"
musicwidget.ldecorator = "["
musicwidget.rdecorator = "]   "
musicwidget.servers = {
    { server = "localhost",
    port = 6600 },
}

mailicon = wibox.widget.imagebox()
mailicon:set_image(theme.mail)

local mdirmw = require('mdirm')
mailwidget = wibox.widget.textbox()
vicious.register(mailwidget, mdirmw, "<span color='#0077ff'> $1/$2/$3 </span>", 5, { "/home/mesteno/Mail/gmail/Inbox/" } )
mailwidget:buttons(awful.util.table.join(
   awful.button({ }, 1, function () awful.util.spawn(terminal .. " -e mutt") end)
))

-- Set the buttons of the widget
musicwidget:register_buttons({ 
    { "", awesompd.MOUSE_LEFT, musicwidget:command_next_track() },
    { "", awesompd.MOUSE_RIGHT, musicwidget:command_prev_track() },
    { "Control", awesompd.MOUSE_LEFT, musicwidget:command_toggle() },
    { "Control", awesompd.MOUSE_RIGHT, musicwidget:command_show_menu() },
})
musicwidget:run() -- After all configuration is done, run the widget


-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock("%a %b %d, %H:%M")

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
    awful.button({ }, 1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
)

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
    awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(spacer)
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(musicwidget.widget)
    right_layout:add(mailicon)
    right_layout:add(mailwidget)
    right_layout:add(systray)
    right_layout:add(spacer)
    right_layout:add(cpuwidget)
    right_layout:add(mspacer)
    right_layout:add(core1)
    right_layout:add(core2)
    right_layout:add(core3)
    right_layout:add(core4)
    right_layout:add(spacer)
    right_layout:add(cpuicon)
    right_layout:add(cputext)
    right_layout:add(mspacer)
    right_layout:add(memicon)
    right_layout:add(memtext)
    right_layout:add(spacer)
    right_layout:add(thermicon)
    right_layout:add(therm)
    right_layout:add(spacer)
    right_layout:add(baticon)
    right_layout:add(batwidget)
    right_layout:add(spacer)
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

