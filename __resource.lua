fx_version 'cerulean'
game 'gta5'

author 'Thorough'
description 'TurfsV - Standalone Turf Wars and Gangs Management Resource'
version '1.0.0'

lua54 'yes'

shared_scripts {
    'shared/config.lua',
    '@ox_lib/init.lua',  -- Integrating ox_lib
    '@oxmysql/lib/MySQL.lua'  -- Integrating oxmysql
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

files {
    'locales/*.lua'
}

dependencies {
    'ox_lib',
    'oxmysql'
}

--[[ OLD
ui_page {
    'nui/index.html',
}

files {
    'nui/index.html',
    'nui/main.js',
    'nui/main.css',
    'nui/logo.png',
    'nui/gtafont.woff',
    'nui/gtafont.woff2',
}
]]
