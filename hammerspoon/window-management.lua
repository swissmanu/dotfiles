hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.01
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "m"}
})