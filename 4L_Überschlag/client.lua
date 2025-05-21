
function ShowAdvancedNotification(title, subtitle, message, icon, iconType)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage(icon, icon, true, iconType, title, subtitle)
    DrawNotification(false, true)
end

local hasFlipped = false

function IsValidVehicleType(vehicle)
    local vehicleClass = GetVehicleClass(vehicle)
    
    return (vehicleClass >= 0 and vehicleClass <= 7) or vehicleClass == 9 or vehicleClass == 12 or vehicleClass == 18
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        
        local player = GetPlayerPed(-1)  
        local vehicle = GetVehiclePedIsIn(player, false)  
        
        if vehicle ~= 0 and IsValidVehicleType(vehicle) then
            local roll = GetEntityRoll(vehicle)  
            
            if (roll > 87 or roll < -87) and not hasFlipped then
                hasFlipped = true  
                
                ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 3.4)
                
                ShowAdvancedNotification("Warning!", "~r~Fahrzeug Unfall", "Dein Fahrzeug hat sich überschlagen! Ruf ein Krankenwagen.", "CHAR_CALL911", 1)
                
                SetVehicleEngineHealth(vehicle, 200.0)
                SetVehicleUndriveable(vehicle, true)
                
                SetDisableVehicleEngineFires(vehicle, true)
            end
            
            if roll > -20 and roll < 20 and hasFlipped then
                hasFlipped = false  
            end
        else
            hasFlipped = false  
        end
    end
end)
