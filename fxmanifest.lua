fx_version 'cerulean'
game 'gta5'
author 'NotW4018#4018'
description 'AdminMenu'

shared_script 'config.lua'

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}	

client_script {
	'client.lua',
	'noclip.lua',
	'deleteobjects.lua'
}

