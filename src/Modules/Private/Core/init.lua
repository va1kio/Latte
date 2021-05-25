local Core = {}
Core.Signals = require(script.Signals)
Core.Shared = {}
Core.Out = setmetatable({}, {
	__index = function(_, key: string)
		return Core.Exported[key]
	end,
})

function Core.warn(...)
	warn("Latte; " .. ...)
end

function Core.println(...)
	print("Latte; " .. ...)
end

function Core.error(...)
	error("Latte; " .. ..., debug.traceback)
end

Core.__index = Core
return Core