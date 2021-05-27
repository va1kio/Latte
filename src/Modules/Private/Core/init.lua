local Core = {}
Core.Shared = {}
Core.Out = {
	__index = function(_, key: string)
		return Core.Out[key]
	end,
}

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

for _, possiblyModule in ipairs(script.Parent:GetChildren()) do
	if possiblyModule:IsA("ModuleScript") and possiblyModule ~= script then
		Core[possiblyModule.Name] = require(possiblyModule)
	end
end

Core.Out = setmetatable({}, Core.Out)
Core.__index = Core
return setmetatable({}, Core)