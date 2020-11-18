local config = require(script.Parent.Config)

return {
	delete = function(path,body)
		local Delete = game.HttpService:RequestAsync({
			Url = config.GlitchURL..'/'..path,
			Method = "DELETE",
			Headers = {
				["Content-Type"] = Enum.HttpContentType.ApplicationJson
			},
			Body = body
		})
		local Body = game.HttpService:JSONDecode(Delete.Body)
		if Body.Sucess then
			return true
		end
	end;
	post = function(path,body)
		local POST = game.HttpService:PostAsync(config.GlitchURL..'/'..path,body)
		local Body = game.HttpService:JSONDecode(POST.Body)
		if Body.Sucess then
			return true
		else
			error(Body.Errors)
		end
	end
}
