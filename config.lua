--[[ TurfsV Config File
    Purpose: This file stores all configuration settings for the TurfsV resource.
    Every setting for the resource can be changed here, ensuring modularity and flexibility for future updates.
]]--

Config = {}

-- Gangs Configuration
-- This section configures the gangs involved in the turf system, defining their markers and vehicles.

Config.Gangs = {
    -- Gang: Aztecas
    ["aztecas"] = { -- The gang_name must match the entry in the MySQL->gangs table.
        Markers = {
            -- Management Location: Where gang management activities occur (for members to manage their gang).
            Management = {
                Location = {x = 1288.9556, y = -1613.2947, z = 53.6250},
                Color = {r = 0, g = 0, b = 255}, -- Blue marker color to represent the Aztecas.
            },
            -- Vehicle Spawn Location: Coordinates where vehicles will spawn.
            VehicleSpawn = {
                Location = {x = -3202.96, y = 834.78, z = 8.93},
                Color = {r = 0, g = 0, b = 255}, -- Blue marker for vehicle spawn.
            },
            -- Vehicle Return Location: Where players return gang vehicles.
            VehicleReturn = {
                Location = {x = -3214.92, y = 834.83, z = 8.93, h = 215.91},
                Color = {r = 0, g = 0, b = 255}, -- Blue marker for vehicle return.
            },
        },
        -- Vehicles available to the Aztecas gang, with prices (currently set to 0 for free).
        Vehicles = {
            ["insurgent3"] = 0, -- Insurgent vehicle
            ["supervolito2"] = 0, -- Supervolito helicopter
        },
    },
    -- Gang: Ballas
    ["ballas"] = {
        Markers = {
            Management = {
                Location = {x = 115.7566, y = -1968.0682, z = 19.9896},
                Color = {r = 128, g = 0, b = 128}, -- Purple marker color for Ballas.
            },
            VehicleSpawn = {
                Location = {x = -128.24, y = 1009.32, z = 234.73},
                Color = {r = 128, g = 0, b = 128},
            },
            VehicleReturn = {
                Location = {x = -125.36, y = 1001.43, z = 234.73, h = 196.72},
                Color = {r = 128, g = 0, b = 128},
            },
        },
        Vehicles = {
            ["insurgent3"] = 0,
            ["supervolito2"] = 0,
        },
    },
    -- Gang: Families
    ["families"] = {
        Markers = {
            Management = {
                Location = {x = -154.5745, y = -1633.3580, z = 36.3581},
                Color = {r = 0, g = 255, b = 0}, -- Green marker for Families.
            },
            VehicleSpawn = {
                Location = {x = 1398.44, y = 1114.84, z = 113.84},
                Color = {r = 0, g = 255, b = 0},
            },
            VehicleReturn = {
                Location = {x = 1407.05, y = 1119.66, z = 113.84, h = 87.32},
                Color = {r = 0, g = 255, b = 0},
            },
        },
        Vehicles = {
            ["insurgent3"] = 0,
            ["supervolito2"] = 0,
        },
    },
    -- Gang: Vagos
    ["vagos"] = {
        Markers = {
            Management = {
                Location = {x = 250.1908, y = -2018.0785, z = 17.9233},
                Color = {r = 255, g = 255, b = 0}, -- Yellow marker for Vagos.
            },
            VehicleSpawn = {
                Location = {x = 1398.44, y = 1114.84, z = 113.84},
                Color = {r = 255, g = 255, b = 0},
            },
            VehicleReturn = {
                Location = {x = 1407.05, y = 1119.66, z = 113.84, h = 87.32},
                Color = {r = 255, g = 255, b = 0},
            },
        },
        Vehicles = {
            ["insurgent3"] = 0,
            ["supervolito2"] = 0,
        },
    },
}

-- Zones Configuration
-- This section defines the locations and rewards for various zones (e.g., drug farms, money laundering).
Config.Zones = {
    ["methfarm"] = {
        Location = {x = 126.135, y = -1278.583, z = 29.270}, -- Location of the Meth Farm.
        Blip = {id = 42, color = 1}, -- Blip on the map with ID 42 and color 1.
        Color = {r = 232, g = 232, b = 232}, -- Blip color in RGB format.
        Label = "Meth Farm", -- Label displayed for this zone.
        Rewards = {
            ["cash"] = 0, -- Cash reward (if any)
            ["dcash"] = 450000, -- Digital cash reward
            ["items"] = {
                ["meth_pooch"] = 0
            }, -- Items rewarded (currently set to meth_pooch).
        },
    },
    ["cokefarm"] = {
        Location = {x = 1383.31, y = -600.33, z = 73.34},
        Blip = {id = 42, color = 1},
        Color = {r = 232, g = 232, b = 232},
        Label = "Coke Farm",
        Rewards = {
            ["cash"] = 0,
            ["dcash"] = 450000,
            ["items"] = {
                ["coke_pooch"] = 0,
            }
        },
    },
    ["codeinefarm"] = {
        Location = {x = 226.84, y = -171.43, z = 55.37},
        Blip = {id = 42, color = 1},
        Color = {r = 232, g = 232, b = 232},
        Label = "Codeine Farm",
        Rewards = {
            ["cash"] = 0,
            ["dcash"] = 450000,
            ["items"] = {
                ["codeine_pooch"] = 0,
            }
        },
    },
    ["percfarm"] = {
        Location = {x = 239.85, y = 355.74, z = 104.60},
        Blip = {id = 42, color = 1},
        Color = {r = 232, g = 232, b = 232},
        Label = "Perc Farm",
        Rewards = {
            ["cash"] = 0,
            ["dcash"] = 450000,
            ["items"] = {
                ["perc_pooch"] = 0,
            }
        },
    },
    ["heroinfarm"] = {
        Location = {x = 868.90, y = -915.15, z = 25.04},
        Blip = {id = 42, color = 1},
        Color = {r = 232, g = 232, b = 232},
        Label = "Heroin Farm",
        Rewards = {
            ["cash"] = 0,
            ["dcash"] = 450000,
            ["items"] = {
                ["heroin_pooch"] = 0,
            }
        },
    },
    ["xanaxfarm"] = {
        Location = {x = -1374.84, y = -327.20, z = 38.43},
        Blip = {id = 42, color = 1},
        Color = {r = 232, g = 232, b = 232},
        Label = "Xanax Farm",
        Rewards = {
            ["cash"] = 0,
            ["dcash"] = 450000,
            ["items"] = {
                ["xanax_pooch"] = 0,
            }
        },
    },
    ["weedfarm"] = {
        Location = {x = 99999999, y = 9999999, z = 8999999},
        Blip = {id = 42, color = 1},
        Color = {r = 232, g = 232, b = 232},
        Label = "Weed Field",
        Rewards = {
            ["cash"] = 0,
            ["dcash"] = 450000,
            ["items"] = {
                ["weed"] = 0,
            }
        },
    },
    ["moneywash"] = {
        Location = {x = 900.39, y = -183.16, z = 72.87},
        Blip = {id = 42, color = 1},
        Color = {r = 232, g = 232, b = 232},
        Label = "Money Wash",
        Rewards = {
            ["cash"] = 0,
            ["dcash"] = 450000,
            ["items"] = {
                ["laundrycard"] = 1,
            }
        },
    },
}

-- Administrative Groups
-- This allows specific groups to have administrative control over the resource (e.g., for capturing zones).
Config.AdministrativeGroups = {
    "admin",
    "superadmin",
}

-- Turf War Settings
Config.CaptureTimer = 180 -- Time (in seconds) required to capture a turf.
Config.CaptureCooldown = 600 -- Time (in seconds) before a turf can be captured again.
Config.VehicleSpawnTimer = 0 -- Time (in seconds) before a vehicle can respawn.
Config.ContestedColor = {r = 0, g = 0, b = 0} -- Color for contested turf.

