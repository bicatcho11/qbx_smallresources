CreateThread(function()
    local sleep
    while true do
        sleep = 1000
        local pos = GetEntityCoords(cache.ped)

        for loc in pairs(Config.Teleports) do
            for k, v in pairs(Config.Teleports[loc]) do
                local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
                if dist < 2 then
                    sleep = 0
                    DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 255, false, false, 0, true, nil, nil, false)

                    if dist < 1 then
                        DrawText3D(v.drawText, v.coords)
                        if IsControlJustReleased(0, 51) then
                            if k == 1 then
                                if v.AllowVehicle then
                                    SetPedCoordsKeepVehicle(cache.ped, Config.Teleports[loc][2].coords.x, Config.Teleports[loc][2].coords.y, Config.Teleports[loc][2].coords.z)
                                else
                                    SetEntityCoords(cache.ped, Config.Teleports[loc][2].coords.x, Config.Teleports[loc][2].coords.y, Config.Teleports[loc][2].coords.z)
                                end

                                if type(Config.Teleports[loc][2].coords) == 'vector4' then
                                    SetEntityHeading(cache.ped, Config.Teleports[loc][2].coords.w)
                                end
                            elseif k == 2 then
                                if v.AllowVehicle then
                                    SetPedCoordsKeepVehicle(cache.ped, Config.Teleports[loc][1].coords.x, Config.Teleports[loc][1].coords.y, Config.Teleports[loc][1].coords.z)
                                else
                                    SetEntityCoords(cache.ped, Config.Teleports[loc][1].coords.x, Config.Teleports[loc][1].coords.y, Config.Teleports[loc][1].coords.z)
                                end

                                if type(Config.Teleports[loc][1].coords) == 'vector4' then
                                    SetEntityHeading(cache.ped, Config.Teleports[loc][1].coords.w)
                                end
                            end
                        end
                    end
                end
            end
        end

        Wait(sleep)
    end
end)
