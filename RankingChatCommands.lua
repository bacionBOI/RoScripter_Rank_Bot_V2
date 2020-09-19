local Config = require(script.Parent.Modules.Config)
local RankModule = require(script.Parent.Modules.Ranking)



local groupService = game:GetService("GroupService")
local groupInfo = groupService:GetGroupInfoAsync(Config.GroupID)

function getNextRank(CurrentRank)
	for i = 1, #groupInfo.Roles do
		local RankId = groupInfo.Roles[i].Rank
		if RankId > CurrentRank then
			return RankId
		end
	end 
end

function getPreviousRank(CurrentRank)
	table.sort(groupInfo.Roles,     function(a,b) return a.Rank > b.Rank end)
	for i = 1, #groupInfo.Roles do
		local RankId = groupInfo.Roles[i].Rank
		if RankId < CurrentRank then
			return RankId
		end
	end 
end

game.Players.PlayerAdded:Connect(function(Player)
	if Player:GetRankInGroup(Config.GroupID) >= Config.Rank_AloudToUseCommands then
		Player.Chatted:Connect(function(Message)
			local args = string.split(Config.RankPrefix..Message, " ")
			local plr = game.Players[args[2]]
			if Player:GetRankInGroup(Config.GroupID) > plr:GetRankInGroup(Config.GroupID) then
				if Message == Config.RankPrefix..'promote '..plr then
					RankModule.promote(plr.UserId)
				elseif Message == Config.RankPrefix..'demote '..plr then
					RankModule.demote(plr.UserId)
				elseif Message == Config.RankPrefix..'setrank '..plr..' '..args[3] then
					RankModule.setRank(plr.UserId, args[3])
				elseif Message == Config.RankPrefix..'denyJoinRequest '..plr then
					RankModule.denyJoinRequest(plr.UserId)
				elseif Message == Config.RankPrefix..'acceptJoinRequest '..plr then
					RankModule.acceptJoinRequest(plr.UserId)
				end
			if Message == Config.RankPrefix..'shout '..args[2] then
					RankModule.shout(args[2])
				end
			end
		end)
	end
end)
