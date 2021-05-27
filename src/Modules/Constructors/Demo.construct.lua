local module = {}

function module:Initialize()
	self._Signal = self.Core.Signals.new("Demo")
	self._Signal:Register(function(Argument)
		local collection = self.Core.Collections:Get(Argument)
		self.Core.println("Got " .. Argument)
		self.Core.SetTimeout(function()
			self.Core.println(table.concat(collection:Get("Original").Value, ", "))
			self.Core.println(table.concat(collection:Get("SortedResult").Value, ", "))
		end, 5)
	end)
end

function module:Start()
	local collection = self.Core.Collections.new(script.Name)
	local demoTable = {}
	for _ = 1, 150 do
		table.insert(demoTable, math.random(1, 9999))
	end

	collection:Append("Original", table.pack(table.unpack(demoTable)))
	collection:Append("SortedResult", self.Core.Sort.Bubble(demoTable))
	self._Signal:Emit(collection.Name)
end

return module