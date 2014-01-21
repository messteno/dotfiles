local awful = require("awful")

modkey = "Mod4"

terminal = "urxvt"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

HOME_FOLDER = os.getenv("HOME")
USER_THEME = "mesteno"

AWESOME_FOLDER = awful.util.getdir("config")
CONFIG_FOLDER = AWESOME_FOLDER .. "/config"
THEME_FOLDER  = AWESOME_FOLDER .. "/themes/" .. USER_THEME
THEME_CONFIG  = THEME_FOLDER .. "/theme.lua"

dofile (CONFIG_FOLDER .. "/errors.lua")          -- Handle errors
dofile (CONFIG_FOLDER .. "/theme.lua")           -- Load theme
dofile (CONFIG_FOLDER .. "/env.lua")
dofile (CONFIG_FOLDER .. "/layouts.lua")
dofile (CONFIG_FOLDER .. "/tags.lua")
dofile (CONFIG_FOLDER .. "/toolbar.lua")
dofile (CONFIG_FOLDER .. "/keybindings.lua")
dofile (CONFIG_FOLDER .. "/rules.lua")
dofile (CONFIG_FOLDER .. "/signals.lua")
dofile (CONFIG_FOLDER .. "/autorun.lua")

