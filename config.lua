Config = {}

-- Turf settings
Config.TurfCaptureTime = 300 -- Time in seconds to capture a turf
Config.TurfCooldown = 600 -- Time in seconds before a turf can be captured again

-- Gangs setup
Config.Gangs = {
    ['families'] = {
        name = 'Families',
        color = { r = 0, g = 100, b = 0 },
        turfPositions = { vector3(-157.92, -1622.54, 35.45), vector3(-175.32, -1596.45, 35.42) },
    },
    ['ballas'] = {
        name = 'Ballas',
        color = { r = 100, g = 0, b = 0 },
        turfPositions = { vector3(106.87, -1938.67, 20.8), vector3(96.34, -1957.22, 20.75) },
    }
}

-- Rewards
Config.Rewards = {
    money = { min = 1000, max = 5000 },
    items = { 'item1', 'item2' }
}
