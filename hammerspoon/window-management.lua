hs.loadSpoon("MiroWindowsManager")
hs.loadSpoon("WindowScreenLeftAndRight")

hs.window.animationDuration = 0.01
spoon.MiroWindowsManager:bindHotkeys({
    up = {hyper, "up"},
    right = {hyper, "right"},
    down = {hyper, "down"},
    left = {hyper, "left"},
    fullscreen = {hyper, "m"}
})

spoon.WindowScreenLeftAndRight:bindHotkeys({
    screen_left = {hyper, "j"},
    screen_right = {hyper, "k"}
})
