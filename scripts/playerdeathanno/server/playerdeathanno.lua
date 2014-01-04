on_player_death = function(args)
	
	print ("Debug: reason"..args.reason) --Debug line for checking for unknown death reasons
	local death_reason = "something." -- Generic reason
	 --[[
		Reasons:
		0 - Natural causes 
		1 - Physics 
		2 - Bullets
		3 - 'splosions
		4 - ??hitting the water??
	]]
	if args.reason == 0 then
		death_reason = "natural causes."
	elseif args.reason == 1 then
		death_reason = "the great power of physics." 
	elseif args.reason == 2 then
		death_reason = "bullets."
	elseif args.reason == 3 then
		death_reason = "explosions."
	elseif args.reason == 4 then
		death_reason = "hitting something hard.."
	end


	if args.killer then --if the player was killed by another
		print(args.killer:GetName() .. " killed " .. args.player:GetName())
		Chat:Broadcast(args.killer:GetName() .. " killed ".. args.player:GetName() .. " with " .. death_reason, Color(255, 0,0))

	else --otherwise
		print(args.player:GetName() .. " died by " .. death_reason)
		Chat:Broadcast(args.player:GetName() .. " died by " .. death_reason, Color(255, 0,0))
	end
	return
end

--Subscribe to the playerdeath event
Events:Subscribe("PlayerDeath", on_player_death)
