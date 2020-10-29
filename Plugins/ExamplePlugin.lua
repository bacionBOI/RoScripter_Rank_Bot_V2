-- Example Plugin
function examplePlugin(player,method, args)
    if method == 'printscr' then
        print(args.Message..' - '..player.Name)
    elseif method == 'errorscr' then 
        error(args.Message.. ' - '..player.Name)
    end
end

game.Players.PlayerAdded:Connect(function(Player)
    examplePlugin(Player, "printscr", {Message = "a player has joined!"})
end)

-- don't use my example, make ur own plugin
