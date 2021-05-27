local RunService = game.GetService(game, "RunService")

local _yieldables = {}

RunService.Stepped:Connect(function()
	local clock = os.clock()
	for index, item in ipairs(_yieldables) do
		local difference = clock - item.Timestamp
		if difference >= item.Interval then
			table.remove(_yieldables, index)
			coroutine.resume(item.Thread, difference, clock)
		end
	end	
end)

return function(Callback, Interval)
	if type(Interval) ~= "number" or Interval < 0 then
		Interval = 0	
	end
	
	table.insert(_yieldables, {
		["Timestamp"] = os.clock(),
		["Interval"] = Interval,
		["Thread"] = coroutine.running()
	})
	coroutine.yield()
	Callback()
end