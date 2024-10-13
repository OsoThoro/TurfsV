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
