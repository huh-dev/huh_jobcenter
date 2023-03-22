fx_version 'cerulean'
game 'gta5'

author 'huh#5502'
description 'Et Jobcenter som udnytter ox scripts'
version '1.0.0'
lua54 'yes'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {'@es_extended/imports.lua','@ox_lib/init.lua'}

dependencies {
    'es_extended',
    'ox_lib',
    'ox_target'
}