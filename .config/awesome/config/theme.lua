local beautiful = require("beautiful")
local gears = require("gears")

-- Themes define colours, icons, and wallpapers
beautiful.init(THEME_CONFIG) -- Load theme

-- {{{ Wallpaper
for s = 1, screen.count() do
    gears.wallpaper.maximized(beautiful.wallpaper, s, true)
end
-- }}}

