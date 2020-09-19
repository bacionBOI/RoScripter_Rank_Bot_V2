local http = require(script.Parent.Http)


return {
	denyJoinRequest = function(userId)
		return http.delete('group/handleJoinRequest', game.HttpService:JSONEncode({userID = userId}))
	end;
	acceptJoinRequest = function(userId)
		return http.post('group/handleJoinRequest', game.HttpService:JSONEncode({userID = userId}))
	end;
	shout = function(msg)
		return http.post('group/shout', game.HttpService:JSONEncode({message = msg}))
	end;
	demote = function(userId)
		return http.post('ranker/demote', game.HttpService:JSONEncode({userID = userId}))
	end;
	promote = function(userId)
		return http.post('ranker/promote', game.HttpService:JSONEncode({userID = userId}))
	end;
	setRank = function(userId,rankId)
		return http.post('ranker/setRank', game.HttpService:JSONEncode({userID = userId, RankID = rankId}))
	end
}
