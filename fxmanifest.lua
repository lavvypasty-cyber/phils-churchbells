fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'phil'
description 'church bells'
version '2.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/main.lua',
}

dependencies {
    'rsg-core',
    'xsound',
}

files {
    'sounds/*.mp3',
    'sounds/*.ogg',
    'sounds/*.wav',
}

lua54 'yes'
