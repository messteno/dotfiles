---------------------------
-- Default awesome theme --
---------------------------
local awful                  = require("awful")
awful.util                   = require("awful.util")

theme                        = {}

home                         = os.getenv("HOME")
config                       = awful.util.getdir("config")
themes                       = config .. "/themes"
themename                    = "/mesteno"
themedir                     = themes .. themename

theme.font                   = "Ubuntu Mono Bold 10"
theme.wallpaper               = themedir .. "/background.jpg"

theme.bg_normal              = "#132224"
theme.bg_focus               = "#007895"
theme.bg_urgent              = "#ff0000"
theme.bg_minimize            = "#444444"
theme.bg_systray             = theme.bg_normal

theme.fg_normal              = "#dddddd"
theme.fg_focus               = "#ffffff"
theme.fg_urgent              = "#ffffff"
theme.fg_minimize            = "#ffffff"

theme.border_width           = 3
theme.border_normal          = "#000000"
theme.border_focus           = "#007895"
theme.border_marked          = "#91231c"

theme.bat_ok                 = themedir .. "/icons/bat_ok.png"
theme.bat_normal             = themedir .. "/icons/bat_normal.png"
theme.bat_bad                = themedir .. "/icons/bat_bad.png"
theme.bat_empty              = themedir .. "/icons/bat_empty.png"
theme.thermal                = themedir .. "/icons/thermal.png"
theme.sep                    = themedir .. "/icons/sep.png"
theme.cpu                    = themedir .. "/icons/cpu.png"
theme.mem                    = themedir .. "/icons/mem.png"
theme.mail                   = themedir .. "/icons/mail.png"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_bg_focus       = theme.bg_focus
theme.taglist_fg_focus       = theme.bg_normal
theme.taglist_squares_sel    = themedir .. "/taglist/squarefz.png"
theme.taglist_squares_unsel  = themedir .. "/taglist/squarez.png"
theme.taglist_squares_resize = "false"

--// Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_bg_normal         = "#101010ff"
theme.menu_bg_focus          = "#000000ff"
theme.menu_fg_normal         = theme.fg_normal
theme.menu_fg_focus          = theme.fg_focus
theme.menu_border_width      = "0"
theme.menu_height            = "18"
theme.menu_width             = "150"
--//

-- You can use your own layout icons like this:
theme.layout_fairh           = themedir .. "/layouts/fairhw.png"
theme.layout_fairv           = themedir .. "/layouts/fairvw.png"
theme.layout_floating        = themedir .. "/layouts/floatingw.png"
theme.layout_magnifier       = themedir .. "/layouts/magnifierw.png"
theme.layout_max             = themedir .. "/layouts/maxw.png"
theme.layout_fullscreen      = themedir .. "/layouts/fullscreenw.png"
theme.layout_tilebottom      = themedir .. "/layouts/tilebottomw.png"
theme.layout_tileleft        = themedir .. "/layouts/tileleft.png"
theme.layout_tile            = themedir .. "/layouts/tilew.png"
theme.layout_tiletop         = themedir .. "/layouts/tiletopw.png"
theme.layout_spiral          = themedir .. "/layouts/spiralw.png"
theme.layout_dwindle         = themedir .. "/layouts/dwindlew.png"

theme.awesome_icon           = "/usr/share/awesome/icons/awesome16.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme             = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
