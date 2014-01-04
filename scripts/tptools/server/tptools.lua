--JC2MP player tp

-- Define the function.
player_tp = function(args)
		
	local chat_string = args.text:split(" ")

	if #chat_string >= 2 and string.lower(chat_string[1]) == "/tpp" then -- if string is greater or equal to two and contains /tpp

		for player_ints in Server:GetPlayers() do -- Run through list of players on the server

			if(player_ints:GetName() == chat_string[2]) then --if the player is the one we are looking for
				
				Chat:Send(args.player, "Teleporting you to " .. player_ints:GetName(), Color(200, 100,3))
				args.player:SetPosition(player_ints:GetPosition()) --Set player to the position of the player he wanted to tp to
				
				return
			end

		end
		return false

	elseif string.lower(chat_string[1]) == "/tpv" then

		if #chat_string < 4 then
			Chat:Send(args.player, "You need to enter 3 numbers", Color(200, 100,3))
				
		else 

			local new_player_vector = Vector3(tonumber(chat_string[2]), tonumber(chat_string[3]), tonumber(chat_string[4]))
		
			Chat:Send(args.player, "Teleporting you to " .. tostring(new_player_vector), Color(200, 100,3))
			args.player:SetPosition(new_player_vector)

		end

	end

	return true

end
-- Subscribe our function to the PlayerChat event.
Events:Subscribe("PlayerChat", player_tp)
