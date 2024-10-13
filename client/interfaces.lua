--[[ TurfsV Client Interface
    Purpose: This file handles all client-side UI interactions, such as showing progress circles, notifications, and menus.

    Author: Thorough
]]--

-- Capture turf function with ox_lib integration for progress circle
function CaptureTurf(turfName)
    -- Show progress circle using ox_lib (https://overextended.dev/ox_lib/Modules/Interface/Client/progress)
    lib.progressCircle({
        duration = Config.CaptureTimer * 1000, -- Capture timer from config in milliseconds
        label = 'Capturing ' .. turfName .. '...', -- Display name for the turf being captured
        position = 'top-center',
        useWhileDead = false, -- Don't allow dead players to capture turf
        canCancel = true -- Player can cancel the capture
    })

    -- Notify the server once the capture is complete
    TriggerServerEvent('turfsV:server:captureTurf', turfName)
end

-- Notify player of capture success or failure using ox_lib (https://overextended.dev/ox_lib/Modules/Interface/Client/notify)
function NotifyPlayer(message, type)
    lib.notify({
        title = 'TurfsV',
        description = message,
        type = type, -- success, error, info
    })
end
