------------------------
-- Toggle mute of current input device:
hs.hotkey.bind(hyper, "p", function()
    local currentDevice = hs.audiodevice.current(true)
    if currentDevice == nil then return end
    local deviceName = currentDevice.name
    local device = hs.audiodevice.findInputByName(deviceName)
    if device ~= nil then
        local muted = device:inputMuted()
        if muted ~= nil then
            local nextMuted = not muted
            device:setInputMuted(nextMuted)
            if nextMuted then
                print(deviceName .. " muted")
            else
                print(deviceName .. " unmuted")
            end
        else
            hs.notify.show("Mic Toggle", "",
                           "Could not determine inputMuted for \"" .. deviceName ..
                               "\"")
        end
    else
        hs.notify.show("Mic Toggle", "", "Could not find microphone named \"" ..
                           deviceName .. "\"")
    end
end)

-----------------------------------------
-- Show "ON AIR" icon in menubar if current input device is unmuted:

local currentOnChangeMuteWatcher
local micStateMenubar = hs.menubar.new()
local onAirIconDimensions = {w = 64, h = 20}
local onAirIconCanvas = hs.canvas.new {
    x = 0,
    y = 0,
    w = onAirIconDimensions.w,
    h = onAirIconDimensions.h
}
onAirIconCanvas[1] = {
    action = "stroke",
    type = "rectangle",
    strokeWidth = 2,
    frame = {
        x = 1,
        y = 1,
        w = onAirIconDimensions.w - 2,
        h = onAirIconDimensions.h - 2
    },
    roundedRectRadii = {xRadius = 6, yRadius = 6}
}
onAirIconCanvas[2] = {
    action = "fill",
    type = "text",
    text = hs.styledtext.new("ON AIR", {
        font = {name = "Helvetica Neue Bold", size = 12},
        paragraphStyle = {alignment = "center"}
    }),
    frame = {x = 0, y = 2, w = onAirIconDimensions.w, h = onAirIconDimensions.h}
}
local onAirIcon = onAirIconCanvas:imageFromCanvas()
micStateMenubar:setClickCallback(
    function() setupWatcherForCurrentInputDevice() end)

function onWatcherCallback(uid, event)
    local device = hs.audiodevice.findInputByUID(uid)
    if device == nil then return end

    if event == "gone" then
        handleInputGoneEvent(uid)
    elseif event == "mute" then
        handleInputMuteEvent(device)
    end
end

-- Detects if the input audio source has changed. If so, setup a new watcher on the new audio source.
function handleInputGoneEvent(uid)
    local currentInput = hs.audiodevice.current(true)
    if currentInput ~= nil then
        if currentInput.uid ~= uid then
            if currentOnChangeMuteWatcher ~= nil then
                local watcher = hs.audiodevice.findInputByUID(
                                    currentOnChangeMuteWatcher)
                if watcher == nil then return end
                watcher:watcherStop()
                setupWatcherForCurrentInputDevice(currentInput.uid)
            end
        end
    end
end

-- Show an icon in the menubar, if the given device is unmuted. Hide it otherwise.
function handleInputMuteEvent(device)
    local muted = device:inputMuted()

    if muted then
        micStateMenubar:setIcon(nil)
    else
        micStateMenubar:setIcon(onAirIcon)
    end
end

function setupWatcherForCurrentInputDevice()
    local currentDevice = hs.audiodevice.current(true)
    if currentDevice == nil then return end
    local uid = currentDevice.uid
    local device = hs.audiodevice.findInputByUID(uid)
    if device == nil then return end

    device:watcherCallback(onWatcherCallback)
    device:watcherStart()
    currentOnChangeMuteWatcher = uid
    onWatcherCallback(uid, "mute")
    -- Fake initial callback execution
end

setupWatcherForCurrentInputDevice()
