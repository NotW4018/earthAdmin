local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('notw4018:getplayers', function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local players  = {}

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		table.insert(players, {
			source      = xPlayer.source,
			identifier  = xPlayer.getIdentifier(),
            name        = GetPlayerName(xPlayers[i]),
			job         = xPlayer.getJob(),
            group       = xPlayer.getGroup(),
            job       = xPlayer.job.label,
            grade          = xPlayer.job.grade_label,
		})
	end
	cb(players)
end)


RegisterNetEvent('delete_objects')
AddEventHandler('delete_objects', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'mod' or xPlayer.getGroup() == 'admin' or  xPlayer.getGroup() == 'superadmin' then
		TriggerClientEvent('notw4018:objects', -1)
	end
end)

RegisterNetEvent('delete_peds')
AddEventHandler('delete_peds', function()
	if xPlayer.getGroup() == 'mod' or xPlayer.getGroup() == 'admin' or  xPlayer.getGroup() == 'superadmin' then
		TriggerClientEvent('notw4018:peds', -1)
	end
end)


RegisterNetEvent('delete_cars')
AddEventHandler('delete_cars', function()
	if xPlayer.getGroup() == 'mod' or xPlayer.getGroup() == 'admin' or  xPlayer.getGroup() == 'superadmin' then
		TriggerClientEvent('notw4018:cars', -1)
	end
end)

RegisterNetEvent('bringall')
AddEventHandler('bringall', function()
	local players = ESX.GetPlayers()
    	local xPlayer = ESX.GetPlayerFromId(source)
	local playerCoords = xPlayer.getCoords()
	for i=1, #players, 1 do
		local xTarget = ESX.GetPlayerFromId(players[i])
		xTarget.setCoords(playerCoords)
	end
end)

RegisterCommand('adminmenu', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
  
    if xPlayer.getGroup() == 'mod' or xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then
		TriggerClientEvent('notw4018:admin', source)
    else
      	xPlayer.showNotification('You dont have permissions!')
    end
end)
