--JC2MP player tp

-- Define the function.
player_tp = function(args)
		
	local chat_string = args.text:split(" ")

	if #chat_string == 2 and string.lower(chat_string[1]) == "/goto" then
		for player_ints in Server:GetPlayers() do
			if(player_ints:GetName() == chat_string[2]) then
				Chat:Send(args.player, "Teleporting you to " .. player_ints:GetName(), Color(200, 100,3))
				args.player:SetPosition(player_ints:GetPosition())
				return
			end
		end
		return false
	end
	return true
end
-- Subscribe our function to the PlayerChat event.
Events:Subscribe("PlayerChat", player_tp)
