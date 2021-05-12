local module = {}

function module:Initialize()
	self.Core.println("Summoned!")
	self.Core.newSignal("CoronavirusCured"):Register(function(Signal, CountriesCured: array)
		self.Core.println(table.concat(CountriesCured, ", "))
	end)
end

function module:Start()
	self.Core.println("Listening with Latte...")
	self.Core:GetSignal("CoronavirusCured"):Emit({"USA", "Japan", "UK", "China", "Russia", "Roblox", "Minecraft", "Funny monkey!"})
end

return module