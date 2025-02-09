local watcher = hs.screen.watcher.new(function()
    print("Hi!")
end)
watcher:start()

local screens = hs.screen.allScreens()
local numberOfScreens = #screens
print(numberOfScreens)
for i = 1, numberOfScreens do
    print(screens[i]:name())
end
