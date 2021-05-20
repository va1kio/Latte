local Core = {}
Core._shared = {}
Core.Exported = setmetatable({}, {
	__index = function(_, key: string)
		return Core.Exported[key]
	end,
})
Core._private = {}
Core._private.signals = {}
Core.__index = Core

function Core:GetService(Service: name)
	return game:GetService(Service)
end

function Core.newSignal(Name: string)
	local signalObject = {
		__index = {
			Register = table.insert
		}
	}

	function signalObject.__index:Emit(...)
		for _, slot in ipairs(self) do
			slot(self, ...)
		end
	end

	Core._private.signals[Name] = setmetatable({}, signalObject)
	return Core._private.signals[Name]
end

function Core:GetSignal(Name: string)
	return Core._private.signals[Name]
end

function Core.warn(...)
	warn("Latte; " .. ...)
end

function Core.println(...)
	print("Latte; " .. ...)
end

function Core.error(...)
	error("Latte; " .. ..., debug.traceback)
end

return Core