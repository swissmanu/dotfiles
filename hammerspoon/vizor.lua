local logger = hs.logger.new('vizor', 'debug')

local prevApp = nil
local terminalName = "Alacritty"

function toggleAlacritty()
    local focusedApp = hs.window.focusedWindow():application();

    if focusedApp:name() == terminalName then
        if prevApp ~= nil then prevApp:activate() end
    else
        local app = hs.appfinder.appFromName(terminalName)
        if app ~= nil then
            prevApp = focusedApp
            app:activate()
        end
    end
end

hs.hotkey.bind(hyper, '`', toggleAlacritty)
