ESX = nil

invisible = false
godmode = false
ids = false
run = false


RegisterNetEvent('notw4018:admin', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Admin Menu ♕",
            txt = ""
        },
		{
            id = 2,
            header = "Admin Options ",
            txt = "Select",
            params = {
                event = "notw4018:options",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Server Options",
            txt = "Select",
            params = {
                event = "notw4018:srwoptions",
                args = {
                    number = 1,
                    id = 3
                }
            }
        },
        {
            id = 4,
            header = "Player List",
            txt = "Select",
            params = {
                event = "notw4018:list",
                args = {
                    number = 1,
                    id = 4
                }
            }
        },
        {
            id = 5,
            header = "Teleport Locations",
            txt = "Select",
            params = {
                event = "notw4018:teleports",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
    })
end)

RegisterNetEvent('notw4018:options', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Admin Options ♕",
            txt = ""
        },
		{
            id = 2,
            header = "Teleport",
            txt = "Select",
            params = {
                event = "notw4018:tpm",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Noclip",
            txt = "Select",
            params = {
                event = "notw4018:noclip",
                args = {
                    number = 1,
                    id = 3
                }
            }
        },
        {
            id = 4,
            header = "Fix Car",
            txt = "Select",
            params = {
                event = "notw4018:fixcar",
                args = {
                    number = 1,
                    id = 4
                }
            }
        },
        {
            id = 5,
            header = "Wash Car",
            txt = "Select",
            params = {
                event = "notw4018:wash",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 6,
            header = "Invisible",
            txt = "Select",
            params = {
                event = "notw4018:invisible",
                args = {
                    number = 1,
                    id = 6
                }
            }
        },
        {
            id = 7,
            header = "Car Spawn",
            txt = "Select",
            params = {
                event = "notw4018:spawn",
                args = {
                    number = 1,
                    id = 7
                }
            }
        },
        {
            id = 8,
            header = "Admin ID",
            txt = "Select",
            params = {
                event = "notw4018:ids",
                args = {
                    number = 1,
                    id = 8
                }
            }
        },
        {
            id = 9,
            header = "Fast Run",
            txt = "Select",
            params = {
                event = "notw4018:run",
                args = {
                    number = 1,
                    id = 9
                }
            }
        },
        {
            id = 10,
            header = "Plate Change",
            txt = "Select",
            params = {
                event = "notw4018:plate",
                args = {
                    number = 1,
                    id = 10
                }
            }
        },
        {
            id = 11,
            header = "◀",
            txt = "",
            params = {
                event = "notw4018:admin",
                args = {
                    number = 1,
                    id = 11
                }
            }
        },
    })
end)


RegisterNetEvent(
    "notw4018:tpm",
    function()
        local WaypointHandle = GetFirstBlipInfoId(8)

        if DoesBlipExist(WaypointHandle) then
            local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

            for height = 1, 1000 do
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                if foundGround then
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    break
                end

                Wait(5)
            end
            ESX.ShowNotification('You are teleported to the location!')
        else
            ESX.ShowNotification('Mark a location!')
        end
    end
)


RegisterNetEvent('notw4018:fixcar')
AddEventHandler('notw4018:fixcar',function()
	local kurac = nil
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		 kurac =  GetVehiclePedIsIn(PlayerPedId(),false)
	else 
        ESX.ShowNotification('You need to be in a car!')
	end
	if kurac then
	    SetVehicleFixed(kurac)
	    SetVehicleDeformationFixed(kurac)
        ESX.ShowNotification('You repaired the car!')
	end
end)

RegisterNetEvent('notw4018:wash')
AddEventHandler('notw4018:wash',function()
	local kurac = nil
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		 kurac =  GetVehiclePedIsIn(PlayerPedId(),false)
	else 
        ESX.ShowNotification('You need to be in a car!')
	end
	if kurac then
		SetVehicleDirtLevel(kurac, 0)
        ESX.ShowNotification('You cleaned the car!')
	end
end)

RegisterNetEvent('notw4018:invisible')
AddEventHandler('notw4018:invisible', function()
    if invisible == false then
        ESX.ShowNotification('Invisible ON!')
		SetEntityVisible(PlayerPedId(),false)
		invisible = true
    else
		SetEntityVisible(PlayerPedId(),true)
		invisible = false
        ESX.ShowNotification('Invisible OFF!')
    end
end)

RegisterNetEvent("notw4018:spawn", function()
    local dialog = exports['zf_dialog']:DialogInput({
        header = "Spawn Car", 
        rows = {
            {
                id = 1, 
                txt = "Car Name"
            },
        }
    })
    
    if dialog ~= nil then
        if dialog[1].input == nil then
            ESX.ShowNotification('All fields must be filled in!')
        else
            TriggerEvent("esx:spawnVehicle", dialog[1].input)
        end
    end
end, false)


RegisterNetEvent(
    "notw4018:ids",
    function()

        if not ids then
            ESX.ShowNotification('ID ON!')
            ids = true
        else
            ids = false
            ESX.ShowNotification('ID OFF!')
        end
    end
)




CreateThread(function()
	while true do
		if not ids then
			Wait(2000)
		else

			for _, id in ipairs(GetActivePlayers()) do
				local loc = GetEntityCoords(GetPlayerPed(id))
				local loc = vector3(loc.x, loc.y, loc.z + 1.3)
                local player = PlayerPedId()
                local health = (GetEntityHealth(player) - 100)
				if not NetworkIsPlayerTalking(id) then
					DrawText3D(
						loc,
						string.format("~g~[ID: %d ]\n ~p~[PLAYER: %s]\n ~y~[HEALTH: "..health.."]",GetPlayerServerId(id), GetPlayerName(id)), 
						255,
						true
					)
				else
					DrawText3D(
						loc,
                        string.format("~g~[ID: %d ]\n ~p~[🎤 PLAYER: %s]\n ~y~[HEALTH: "..health.."]",GetPlayerServerId(id), GetPlayerName(id)), 
						255,
						true
					)
				end
            end
        end 
        Wait(0)
    end
end)

function DrawText3D(coords, text, scale2)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)

    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)


    -- Format the text
    SetTextScale(0.0, 0.45 * scale)
    SetTextFont(6)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextOutline()
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end


RegisterNetEvent(
    "notw4018:run",
    function()

        if not run then
            ESX.ShowNotification('Fast Run ON!')
            run = true
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
        else
            run = false
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.00)
            ESX.ShowNotification('Fast Run OFF!')
        end
    end
)



RegisterNetEvent("notw4018:plate", function()
    local dialog = exports['zf_dialog']:DialogInput({
        header = "Plate", 
        rows = {
            {
                id = 1, 
                txt = "Plate Number"
            },
        }
    })
    
    if dialog ~= nil then
        if dialog[1].input == nil then
            ESX.ShowNotification('All fields must be filled in!')
        else
            TriggerEvent("notw4018:platechange", dialog[1].input)
        end
    end
end, false)


RegisterNetEvent('notw4018:platechange')
AddEventHandler('notw4018:platechange', function(tablica)
	local kurac = nil
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		 kurac =  GetVehiclePedIsIn(PlayerPedId(),false)
	else 
        ESX.ShowNotification('You need to be in a car!')
	end
	if kurac then
        SetVehicleNumberPlateText(kurac, tablica)
	end
end)

RegisterNetEvent('notw4018:list')
AddEventHandler('notw4018:list', function()
	ESX.TriggerServerCallback('notw4018:getplayers', function(player)
        local players = GetActivePlayers()
		local menu = {}

        TriggerEvent('nh-context:sendMenu', {
            {
                id = 0,
                header = 'PLAYERS >  '.. #players .. ' / 64',
                txt = ''
            },
        })

		if player ~= nil then
            for i=1, #player, 1 do
				table.insert(menu, {
					id = k,
					header = 'Name > ' ..player[i].name,
					txt = 'ID > ' ..player[i].source,
					params = {
						event = '',
						args = {}
					}
				})
			end
            if #menu ~= 0 then
                TriggerEvent('nh-context:sendMenu', menu)
            else
                TriggerEvent('nh-context:sendMenu', {
                    {
                        id = 1,
                        header = 'No Players!',
                        txt = ''
                    }
                })
            end
        else
            TriggerEvent('nh-context:sendMenu', {
                {
                    id = 1,
                    header = 'No Players!',
                    txt = ''
                }
            })
        end
    end)
end)


RegisterNetEvent('notw4018:teleports', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Locations",
            txt = ""
        },
        {
            id = 2,
            header = "Airport",
            txt = "Select",
            params = {
                event = "notw4018:airport",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Hospital",
            txt = "Select",
            params = {
                event = "notw4018:hospital",
                args = {
                    number = 1,
                    id = 3
                }
            }
        },
        {
            id = 4,
            header = "Police",
            txt = "Select",
            params = {
                event = "notw4018:police",
                args = {
                    number = 1,
                    id = 4
                }
            }
        },
        {
            id = 5,
            header = "Mechanic",
            txt = "Select",
            params = {
                event = "notw4018:mechanic",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 6,
            header = "Taxi",
            txt = "Select",
            params = {
                event = "notw4018:taxi",
                args = {
                    number = 1,
                    id = 6
                }
            }
        },
        {
            id = 7,
            header = "Store",
            txt = "Select",
            params = {
                event = "notw4018:store",
                args = {
                    number = 1,
                    id = 7
                }
            }
        },
        {
            id = 8,
            header = "Garage",
            txt = "Select",
            params = {
                event = "notw4018:garage",
                args = {
                    number = 1,
                    id = 8
                }
            }
        },
        {
            id = 9,
            header = "Clothing Store",
            txt = "Select",
            params = {
                event = "notw4018:clothing",
                args = {
                    number = 1,
                    id = 9
                }
            }
        },
        {
            id = 10,
            header = "Casino",
            txt = "Select",
            params = {
                event = "notw4018:casino",
                args = {
                    number = 1,
                    id = 10
                }
            }
        },
        {
            id = 11,
            header = "◀",
            txt = "",
            params = {
                event = "notw4018:admin",
                args = {
                    number = 1,
                    id = 11
                }
            }
        },
    })
end)

RegisterNetEvent('notw4018:airport')
AddEventHandler('notw4018:airport', function()
    local igrac = PlayerPedId()
    SetEntityCoords(igrac, -1024.62, -2735.4, 19.13, false, false, false, true)
end)

RegisterNetEvent('notw4018:hospital')
AddEventHandler('notw4018:hospital', function()
    local igrac = PlayerPedId()
    SetEntityCoords(igrac, 339.6157, -1396.82, 32.508, false, false, false, true)
end)


RegisterNetEvent('notw4018:mechanic')
AddEventHandler('notw4018:mechanic', function()
    local igrac = PlayerPedId()
    SetEntityCoords(igrac, -367.928, -132.828, 38.683, false, false, false, true)
end)


RegisterNetEvent('notw4018:police')
AddEventHandler('notw4018:police', function()
    local igrac = PlayerPedId()
    SetEntityCoords(igrac, 415.6334, -979.993, 29.444, false, false, false, true)
end)



RegisterNetEvent('notw4018:taxi')
AddEventHandler('notw4018:taxi', function()
    local igrac = PlayerPedId()
    SetEntityCoords(igrac, 907.7783, -165.757, 74.123, false, false, false, true)
end)



RegisterNetEvent('notw4018:store')
AddEventHandler('notw4018:store', function()
    local igrac = PlayerPedId()
    SetEntityCoords(igrac, 27.39144, -1346.01, 29.497, false, false, false, true)
end)

RegisterNetEvent('notw4018:garage')
AddEventHandler('notw4018:garage', function()
    local igrac = PlayerPedId()
    SetEntityCoords(igrac, 218.5286, -808.701, 30.706, false, false, false, true)
end)

RegisterNetEvent('notw4018:clothing')
AddEventHandler('notw4018:clothing', function()
    local igrac = PlayerPedId()
    SetEntityCoords(igrac, -159.279, -302.625, 39.733, false, false, false, true)
end)

RegisterNetEvent('notw4018:casino')
AddEventHandler('notw4018:casino', function()
    local igrac = PlayerPedId()
    SetEntityCoords(igrac, 908.4822, 37.73477, 80.540, false, false, false, true)
end)

RegisterNetEvent('notw4018:srwoptions', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Options",
            txt = ""
        },
        {
            id = 2,
            header = "Delete Objects",
            txt = "Select",
            params = {
                event = "delete:obj",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Delete Peds",
            txt = "Select",
            params = {
                event = "delete:peds",
                args = {
                    number = 1,
                    id = 3
                }
            }
        },
        {
            id = 4,
            header = "Delete Cars",
            txt = "Select",
            params = {
                event = "delete:cars",
                args = {
                    number = 1,
                    id = 4
                }
            }
        },
        {
            id = 5,
            header = "Bring All",
            txt = "Select",
            params = {
                event = "notw4018:bringall",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 6,
            header = "◀",
            txt = "",
            params = {
                event = "notw4018:admin",
                args = {
                    number = 1,
                    id = 6
                }
            }
        },
    })
end)

RegisterNetEvent('notw4018:objects')
AddEventHandler('notw4018:objects', function()
	for object in EnumerateObjects() do
        SetEntityAsMissionEntity(object, false, false)
		DeleteObject(object)
		if (DoesEntityExist(object)) then 
			DeleteObject(object)
		end
    end
end)

AddEventHandler('delete:obj', function()
    TriggerServerEvent('delete_objects')
end)

RegisterNetEvent('notw4018:peds')
AddEventHandler('notw4018:peds', function()
	for ped in EnumeratePeds() do
		if not (IsPedAPlayer(ped))then
			DeleteEntity(ped)
			RemoveAllPedWeapons(ped, true)
		end
	end
end)

AddEventHandler('delete:peds', function()
    TriggerServerEvent('delete_peds')
end)


RegisterNetEvent('notw4018:cars')
AddEventHandler('notw4018:cars', function()
	for vehicle in EnumerateVehicles() do
		if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
			SetVehicleHasBeenOwnedByPlayer(vehicle, false)
			SetEntityAsMissionEntity(vehicle, false, false)
			DeleteVehicle(vehicle)
			if (DoesEntityExist(vehicle)) then
				DeleteVehicle(vehicle)
			end
		end
	end
end)


AddEventHandler('delete:cars', function()
    TriggerServerEvent('delete_cars')
end)


AddEventHandler('notw4018:bringall', function()
    TriggerServerEvent('bringall')
end)