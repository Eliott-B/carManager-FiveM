RegisterCommand('rv', function(source)
    local distanceToCheck = 5.0

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    if (DoesEntityExist(playerPed) and not IsEntityDead(playerPed)) then

        if (IsPedSittingInAnyVehicle(playerPed)) then 
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if (GetPedInVehicleSeat( vehicle, -1) == playerPed) then 
                SetEntityAsMissionEntity(vehicle, true, true )
                SetVehicleFixed(vehicle)
                if (GetVehicleEngineHealth(vehicle) <= -4000) then
                    SetVehicleEngineHealth(vehicle, 1000)
                end
                SetVehicleDirtLevel(vehicle, 0)
                Notify('~b~Sucess')
            else 
                Notify('~r~ERROR : you are not the driver !')
            end 
        else
            Notify("~r~ERROR : you are not in a vehicule !")
        end 
    end
end, false)

function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end