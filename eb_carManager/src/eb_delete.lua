RegisterCommand('dv', function(source)
    local distanceToCheck = 5.0

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    if (DoesEntityExist(playerPed) and not IsEntityDead(playerPed)) then

        if (IsPedSittingInAnyVehicle(playerPed)) then 
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if (GetPedInVehicleSeat( vehicle, -1) == playerPed) then 
                SetEntityAsMissionEntity(vehicle ,true ,true )
                local model = GetEntityModel(vehicle)
                local name = GetDisplayNameFromVehicleModel(model)
                DeleteVehicle(vehicle)
                Notify('~y~Your ' .. name .. ' has been deleted!')
            else 
                Notify('~r~~h~ERROR :~h~ you are not the driver !')
            end 
        else
            local vehicle = GetClosestVehicle(GetEntityCoords(playerPed), 15.0, 0, 70)
            if (DoesEntityExist(vehicle)) then 
                SetEntityAsMissionEntity(vehicle ,true ,true )
                local model = GetEntityModel(vehicle)
                local name = GetDisplayNameFromVehicleModel(model)
                DeleteVehicle(vehicle)
                Notify('~y~Your ' .. name .. ' has been deleted!')
            else 
                Notify('~r~~h~ERROR :~h~ you are not in a vehicule or near a vehiucle !')
            end 
        end 
    end
end, false)

function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end