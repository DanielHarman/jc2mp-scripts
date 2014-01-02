--JC2MP chat clear

-- Define the function.
clear = function(args)
		
	local chat_string = args.text:split(" ")

	if string.lower(chat_string[1]) == "/clear" then
		local counter = 0
		while counter < 20 do
			
			Chat:Send(args.player, " ", Color(0, 0,0))
			counter = counter + 1
		end
		return false
	end
	return true
end
-- Subscribe our function to the PlayerChat event.
Events:Subscribe("PlayerChat", clear)
