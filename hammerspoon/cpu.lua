local canvas = require("hs.canvas")

local cpuUsageMenubar = hs.menubar.new()
local cpuUsageCanvas = nil

local imageHeight = 18
local barWidth = 6
local interBarSpace = 1

function update(data)
    local usages
    local numberOfCores = data.n / 2 -- only "real" cores
    local imageWidth =
        barWidth * numberOfCores + interBarSpace * numberOfCores - 1

    if cpuUsageCanvas == nil then
        -- init canvas only once
        cpuUsageCanvas = canvas.new {
            x = 0,
            y = 0,
            h = imageHeight,
            w = imageWidth
        }
    end

    for i = 1, numberOfCores do
        local dataPoint = ((i - 1) * 2) + 1 -- odd cores are the real ones
        local barHeight = math.max(imageHeight * (data[dataPoint].active / 100),
                                   1)

        cpuUsageCanvas[i] = {
            action = "fill",
            type = "rectangle",
            frame = {
                x = (i - 1) * (barWidth + interBarSpace),
                y = imageHeight - barHeight,
                h = barHeight,
                w = barWidth
            }
        }
    end

    if #cpuUsageCanvas == numberOfCores then
        -- add border only once:
        cpuUsageCanvas[numberOfCores + 1] = {
            action = "stroke",
            type = "rectangle",
            strokeColor = {alpha = .2},
            frame = {x = 0, y = 0, w = imageWidth, h = imageHeight},
            roundedRectRadii = {xRadius = 3, yRadius = 3}
        }
    end

    cpuUsageMenubar:setIcon(cpuUsageCanvas:imageFromCanvas())
end

function query() hs.host.cpuUsage(1, update) end
query()
cpuUsageTimer = hs.timer.doEvery(3, query)
