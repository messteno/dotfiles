termimal = "urxvt"
termtmux = "urxvt -e zsh -c \"tmux -q has-session && exec tmux attach-session -d || exec tmux new-session\""
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

