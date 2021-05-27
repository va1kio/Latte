local Core = {}
Core.Shared = {}
Core.Out = {
	__index = function(_, key: string)
		return Core.Out[key]
	end,
}

function Core:Import(ModuleName, Category)
	if Core.Out[Category] then
		return Core.Out[Category][ModuleName]
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

for _, possiblyModule in ipairs(script:GetChildren()) do
	if possiblyModule:IsA("ModuleScript") and possiblyModule ~= script then
		Core[possiblyModule.Name] = require(possiblyModule)
	end
end

Core.Out = setmetatable({}, Core.Out)
return Core