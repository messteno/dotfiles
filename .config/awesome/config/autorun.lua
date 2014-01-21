local awful = require("awful")

autorun = true
 
autorunApps = --Приложения, которым нужен перезапуск при перезапуске AwesomeWM
{
   "kbdd",
}
 
if autorun then
   for app = 1, #autorunApps do
      awful.util.spawn(autorunApps[app])
   end
end
