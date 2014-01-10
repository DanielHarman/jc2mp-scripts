--JC2MP onscreen stuff

-- Define the function.
function onrender()

    local playervel = LocalPlayer:GetLinearVelocity()
    local playerpos = LocalPlayer:GetPosition()
    local altitude = math.abs(playerpos.y) * 3.6 - 720
    local vvel = -playervel.y

    if tonumber(altitude) > 1000 then
        vvecString = string.format("Altitude %i", altitude /1000).."km "
    else
        vvecString = string.format("Altitude %i", altitude) .. "m "
    end

    local vvelString = string.format("VVelocity %i", math.abs(vvel) * 3.6).."km/h"

    --print (tostring(Render.Height))

    Render:DrawText(Vector2(220,10), "You are connected to nimphina.co.uk", Color(255,255,255))
    Render:DrawText(Vector2(220,30), vvecString .. vvelString, Color(255,255,255))
    Render:DrawText(Vector2(220,50), "Player position " .. tostring(LocalPlayer:GetPosition()), Color(255,255,255))
    Render:DrawText(Vector2(Render.Height -20, Render.Width -20), os.date("!%c"), Color(255,255,255), 10, 5)


    if altitude >= 0 then -- So we are working for postitve
        if altitude > 3000 then -- So the scale is limited to 3KM
            altitude = 3000
        end
        Render:FillArea(Vector2(Render.Width /64, Render.Height /1.02), Vector2(10, -altitude/20), Color(0,255,0)) --Draw meter bar

        for i=0,15 do -- Draw 15 lines
            if i == 5 or i == 10 or i == 15 then --if these numbers (as they represent 1,2,3KM) draw a longer line and the number
                Render:FillArea(Vector2(Render.Width /128, Render.Height /1.02 -i*10 ), Vector2(40, 1), Color(255,255,255))
                if i == 0 then
                    Render:DrawText(Vector2(Render.Width /64 + 22, Render.Height /1.02 -i*10 -10), tostring(0) .. "km", Color(255,255,255))
                else
                    Render:DrawText(Vector2(Render.Width /64 + 22, Render.Height /1.02 -i*10 -10), tostring(i/5) .. "km", Color(255,255,255))
                end
            else
                Render:FillArea(Vector2(Render.Width /128, Render.Height /1.02 -i*10 ), Vector2(20, 1), Color(255,255,255)) --Draw a smaller line
            end
        end



    else -- This is for negative altitude
        --Do this bit later
        Render:FillArea(Vector2(Render.Width /64, Render.Height /1.02), Vector2(10, altitude), Color(255,0,0))

        for i=0,10 do -- Draw 15 lines
            if i == 0 or i == 5 or i == 10 then --if these numbers (as they represent 1,2,3KM) draw a longer line and the number
                Render:FillArea(Vector2(Render.Width /128, Render.Height /1.02 -i*10 ), Vector2(40, 1), Color(255,255,255))
                Render:DrawText(Vector2(Render.Width /64 + 22, Render.Height /1.02 -i*10 -10), tostring(i) .. "m", Color(255,255,255))
            else
                Render:FillArea(Vector2(Render.Width /128, Render.Height /1.02 -i*10 ), Vector2(20, 1), Color(255,255,255)) --Draw a smaller line
            end
       	end
    end
    return true
end


Events:Subscribe("Render", onrender)
