local Core = {}
Core.Signals = require(script.Signals)
Core.Collections = require(script.Collections)
Core.Shared = {}
Core.Out = setmetatable({}, {
	__index = function(_, key: string)
		return Core.Exported[key]
	end,
})

function Core:Import(ModuleName, Category)
	if self.Out[Category] then
		return self.Out[Category][ModuleName]
	end
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

Core.warn("Core.Shared is now deprecated and replaced by Core.Collections")
Core.__index = Core
return setmetatable({}, Core)