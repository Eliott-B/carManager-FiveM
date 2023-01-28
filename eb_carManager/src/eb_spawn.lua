RegisterCommand('sv', function(source, args)
    if not IsModelInCdimage(args[1]) or not IsModelAVehicle(args[1]) then
        TriggerEvent('chat:addMessage', {
            args = {'^1^*ERROR :^r `' .. args[1] .. '` is not a ID car ...' }
        })

        return
    end

    RequestModel(args[1])

    while not HasModelLoaded(args[1]) do
        Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local vehicle = CreateVehicle(args[1], pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetEntityAsNoLongerNeeded(vehicle)

    SetModelAsNoLongerNeeded(args[1])

    TriggerEvent('chat:addMessage', {
		args = { '^5Your ^*' .. args[1] .. '^r appear !' }
	})
end, false)