--JC2MP onscreen stuff

-- Define the function.
function gameload()

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

    --print (tostring(Render.Size))

    Render:DrawText(Vector2(220,10), "You are connected to nimphina.co.uk", Color(255,255,255))
    Render:DrawText(Vector2(220,30), vvecString .. vvelString, Color(255,255,255))
    Render:DrawText(Vector2(220,50), "Player position " .. tostring(LocalPlayer:GetPosition()), Color(255,255,255))
    return true
end


Events:Subscribe("Render", gameload)
