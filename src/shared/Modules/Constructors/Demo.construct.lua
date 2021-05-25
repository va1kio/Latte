local module = {}

function module:Initialize()
	self._Signal = self.Core.Signals.new("CoronavirusCured")
	self._Signal:Register(function(CountriesCured)
		self.Core.println(table.concat(CountriesCured, ", "))
	end)
end

function module:Start()
	self._Signal:Emit({"USA", "Japan", "UK", "China", "Russia"})
end

return module