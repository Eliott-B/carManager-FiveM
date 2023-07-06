RegisterCommand('sv', function(source, args)
    if not IsModelInCdimage(args[1]) or not IsModelAVehicle(args[1]) then
        Notify('~r~~h~ERROR :~h~ `' .. args[1] .. '` is not a ID car ...')

        return
    end

    RequestModel(args[1])

    while not HasModelLoaded(args[1]) do
        Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    if (IsPedSittingInAnyVehicle(playerPed)) then 
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        SetEntityAsMissionEntity(vehicle ,true ,true )
        DeleteVehicle(vehicle)
    end 

    local vehicle = CreateVehicle(args[1], pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetEntityAsNoLongerNeeded(vehicle)

    SetModelAsNoLongerNeeded(args[1])
    Notify('~y~Your ' .. string.upper(args[1]) .. ' appear !')
end, false)


function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end