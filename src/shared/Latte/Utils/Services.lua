return setmetatable({}, {
	__index = function(_, Key: string)
		return game.GetService(game, Key)
	end
})