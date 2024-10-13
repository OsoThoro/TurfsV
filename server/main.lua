local function CaptureTurf(source, turfId)
    local playerGang = GetPlayerGang(source) -- Custom function to retrieve player's gang
    if not playerGang then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', text = 'You are not part of a gang!' })
        return
    end

    -- Check if the turf is already owned by the player's gang
    if Turfs[turfId].owner == playerGang then
        TriggerClientEvent('ox_lib:notify', source, { type = 'info', text = 'Your gang already controls this turf!' })
        return
    end

    -- Update database with the new ownership using oxmysql
    MySQL.update('UPDATE turfs SET owner = ? WHERE id = ?', { playerGang, turfId }, function(affectedRows)
        if affectedRows > 0 then
            Turfs[turfId].owner = playerGang
            TriggerClientEvent('ox_lib:notify', -1, { type = 'success', text = playerGang .. ' has captured a turf!' })
        else
            TriggerClientEvent('ox_lib:notify', source, { type = 'error', text = 'Failed to capture turf!' })
        end
    end)
end



--[[ TurfsV Server
    Purpose: This file handles all server-side logic for the TurfsV resource, including managing turf ownership and sending notifications.
]]--

-- Capture turf logic
RegisterServerEvent('turfsV:server:captureTurf')
AddEventHandler('turfsV:server:captureTurf', function(turfName)
    local _source = source
    local playerGang = GetPlayerGang(_source) -- Custom function to retrieve player's gang

    -- Ensure the player is part of a gang
    if not playerGang then
        TriggerClientEvent('ox_lib:notify', _source, { type = 'error', text = 'You are not part of a gang!' })
        return
    end

    -- Check if the turf is already owned by the player's gang
    MySQL.scalar('SELECT owner FROM turfsV_turfs WHERE name = ?', { turfName }, function(owner)
        if owner == playerGang then
            TriggerClientEvent('ox_lib:notify', _source, { type = 'info', text = 'Your gang already controls this turf!' })
            return
        end

        -- Update the turf ownership in the database
        MySQL.update('UPDATE turfsV_turfs SET owner = ? WHERE name = ?', { playerGang, turfName }, function(affectedRows)
            if affectedRows > 0 then
                TriggerClientEvent('ox_lib:notify', _source, { type = 'success', text = playerGang .. ' has captured ' .. turfName .. '!' })
                LogTurfCapture(playerGang, turfName) -- Call logging function
            else
                TriggerClientEvent('ox_lib:notify', _source, { type = 'error', text = 'Failed to capture turf!' })
            end
        end)
    end)
end)

-- Logging turf capture to Discord
function LogTurfCapture(gang, turf)
    local message = gang .. ' captured turf: ' .. turf

    -- Send the message to Discord using a secured webhook
    PerformHttpRequest(Config.DiscordWebhook, function() end, 'POST', json.encode({ content = message }), { ['Content-Type'] = 'application/json' })
    print('[TurfsV] ' .. message) -- Log in server console for debugging
end



--[[ TurfsV Server
    Purpose: Handle server-side logic such as vehicle spawns, gang territory management, and database updates.
    Preserving functionality from the original esx_gangs and adding enhancements with ox_lib and oxmysql.
]]--

-- Function to spawn a vehicle for the player
RegisterServerEvent('turfsV:server:spawnVehicle')
AddEventHandler('turfsV:server:spawnVehicle', function(gangName, vehicleName)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source) -- ESX integration for player identification

    -- Check if player is part of the gang
    if xPlayer.getJob().name ~= gangName then
        TriggerClientEvent('ox_lib:notify', _source, { type = 'error', text = 'You are not part of this gang!' })
        return
    end

    -- Ensure the vehicle exists in the gang's vehicle list
    if not Config.Gangs[gangName].Vehicles[vehicleName] then
        TriggerClientEvent('ox_lib:notify', _source, { type = 'error', text = 'Invalid vehicle!' })
        return
    end

    -- Spawn the vehicle using ESX function or native spawn logic
    local spawnCoords = Config.Gangs[gangName].Markers.VehicleSpawn.Location
    local model = GetHashKey(vehicleName)

    -- Ensure the model is loaded
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end

    local vehicle = CreateVehicle(model, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, true, false)
    SetVehicleNumberPlateText(vehicle, gangName .. tostring(math.random(100, 999)))

    -- Notify the player
    TriggerClientEvent('ox_lib:notify', _source, { type = 'success', text = 'Vehicle spawned successfully!' })
end)

-- Add any additional server-side logic from the original script, such as managing territory, rewards, etc.

-- Logging function for debugging and webhook integration
function LogGangAction(message)
    PerformHttpRequest(Config.DiscordWebhook, function() end, 'POST', json.encode({ content = message }), { ['Content-Type'] = 'application/json' })
    print('[TurfsV] ' .. message) -- Server-side console log
end
