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



--[[ TurfsV Client
    Purpose: Handle client-side interactions such as vehicle spawns, management access, and notifications.
    Original functionality from esx_gangs is preserved with improvements using ox_lib.
    
    Author: Thorough
]]--

-- Function to spawn gang vehicles at the specified spawn location
function SpawnGangVehicle(gangName, vehicleName)
    local vehicleSpawn = Config.Gangs[gangName].Markers.VehicleSpawn.Location

    -- Progress bar for spawning the vehicle (ox_lib)
    lib.progressCircle({
        duration = 5000, -- 5-second delay to spawn the vehicle
        label = 'Spawning vehicle...',
        position = 'top-center',
        useWhileDead = false,
        canCancel = true
    })

    -- Trigger server event to spawn the vehicle
    TriggerServerEvent('turfsV:server:spawnVehicle', gangName, vehicleName)
end

-- Handling marker entry and interaction with management and vehicle locations
CreateThread(function()
    while true do
        Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        
        for gangName, gangData in pairs(Config.Gangs) do
            -- Management interaction
            if #(playerCoords - vector3(gangData.Markers.Management.Location.x, gangData.Markers.Management.Location.y, gangData.Markers.Management.Location.z)) < 10 then
                -- Show notification using ox_lib
                lib.textUI('[E] Access Gang Management', { position = 'top-center' })

                if IsControlJustReleased(0, 38) then -- "E" key
                    OpenManagementMenu(gangName)
                end
            end

            -- Vehicle spawn interaction
            if #(playerCoords - vector3(gangData.Markers.VehicleSpawn.Location.x, gangData.Markers.VehicleSpawn.Location.y, gangData.Markers.VehicleSpawn.Location.z)) < 10 then
                lib.textUI('[E] Spawn Vehicle', { position = 'top-center' })

                if IsControlJustReleased(0, 38) then
                    OpenVehicleMenu(gangName)
                end
            end
        end
    end
end)

-- Function to open the gang management menu (ox_lib context menu)
function OpenManagementMenu(gangName)
    local menu = {
        {label = 'Manage Members', action = 'manageMembers', gang = gangName},
        {label = 'Manage Vehicles', action = 'manageVehicles', gang = gangName}
    }

    lib.registerContext({
        id = 'gangManagement',
        title = 'Gang Management - ' .. gangName,
        options = menu
    })
    
    lib.showContext('gangManagement')
end

-- Function to open the vehicle menu and allow vehicle spawning
function OpenVehicleMenu(gangName)
    local menu = {}
    for vehicleName, price in pairs(Config.Gangs[gangName].Vehicles) do
        table.insert(menu, {label = vehicleName, action = 'spawnVehicle', vehicle = vehicleName, gang = gangName})
    end

    lib.registerContext({
        id = 'vehicleMenu',
        title = 'Vehicle Spawn - ' .. gangName,
        options = menu
    })

    lib.showContext('vehicleMenu')
end

-- Notification function using ox_lib
function NotifyPlayer(message, type)
    lib.notify({
        title = 'TurfsV',
        description = message,
        type = type, -- success, error, info
    })
end



-- Example of sending player gang data to the NUI
RegisterNetEvent('turfsV:client:displayGang')
AddEventHandler('turfsV:client:displayGang', function(gangName)
    -- Send data to NUI to update the UI
    SendNUIMessage({
        action = 'updateGangDisplay',
        gangName = gangName
    })
end)

-- Trigger to show player gang information when required
function ShowPlayerGangInfo()
    local playerGang = GetPlayerGang() -- Custom function or ESX/QB call to get player's gang

    -- Send player gang info to NUI
    TriggerEvent('turfsV:client:displayGang', playerGang)
end

