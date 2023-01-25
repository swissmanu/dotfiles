local deviceName = "Elgato Wave:3"

-- Mic Toggle:
hs.hotkey.bind(hyper, "p", function()
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
            hs.notify.show("Mic Toggle", "", "Could not determine inputMuted for \"" .. deviceName .. "\"")
        end
    else
        hs.notify.show("Mic Toggle", "", "Could not find microphone named \"" .. deviceName .. "\"")
    end
end)

