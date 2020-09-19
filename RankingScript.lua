local Assets = {
	-- Cloneable
	Asset1 = {
		RankID = 0,
		GamepassID = 0
	}
}




if not game:GetService('ReplicatedStorage'):WaitForChild('RankingEvent') then
	script.Parent.RankingEvent.Parent = game:GetService('ReplicatedStorage')
else
	return 'There'
end
local rankModule = require(script.Parent.Modules.Ranking)

game.ReplicatedStorage.RankingEvent.OnServerEvent:Connect(function(Player,method,args)
	if method == 'RankUser' then
		rankModule.setRank(args.userId, args.RankID)
	end
end)

--[[
	Example:
	game.ReplicatedStorage.RankingEvent:FireServer("RankUser", {
		userId = 0, -- Player to Rank UserID
		RankID = 0 -- Role ID
	})
--]]
