local function CaptureTurf(turfId)
    -- Display progress bar using ox_lib
    lib.progressCircle({
        duration = Config.TurfCaptureTime * 1000,
        label = 'Capturing turf...',
        position = 'top-center',
        useWhileDead = false
    })

    -- Notify the server
    TriggerServerEvent('turfs:server:captureTurf', turfId)
end
