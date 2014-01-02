--Player join and leave texts

on_player_join = function(args)
	Chat:Broadcast(args.player:GetName() .. " joined the server", Color(200, 100,3))
	return
end
on_player_leave = function(args)
	Chat:Broadcast(args.player:GetName() .. " left the server", Color(200, 100,3))
	return
end

Events:Subscribe("PlayerJoin", on_player_join)
Events:Subscribe("PlayerQuit", on_player_leave)