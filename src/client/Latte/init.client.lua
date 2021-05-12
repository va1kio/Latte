local definedPrefixes = {
	["Components"] = "comp",
	["Constructors"] = "construct",
	["Utilities"] = "util"
}

local preOut = {}
local Core = {}
Core._shared = {}
Core.Exported = {}
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

local function Initialize()
	for _, possiblyFolder in ipairs(script:FindFirstChild("Source"):GetChildren()) do
		if possiblyFolder:IsA("Folder") and possiblyFolder.Name ~= "Private" and definedPrefixes[possiblyFolder.Name] then
			local prefix = definedPrefixes[possiblyFolder.Name]
			preOut[possiblyFolder.Name] = {}
			Core.Exported[possiblyFolder.Name] = setmetatable({}, {
				__index = function(_, key: string)
					return preOut[possiblyFolder.Name][key]
				end,
			})

			for _, possiblyModule in ipairs(possiblyFolder:GetDescendants()) do
				if possiblyModule:IsA("ModuleScript") and string.match(possiblyModule.Name, ".%." .. prefix) then
					preOut[possiblyFolder.Name][string.gsub(possiblyModule.Name, "%." .. prefix, "")] = require(possiblyModule)
					Core.warn("loaded " .. possiblyModule.Name .. ".lua...")
				end
			end
		end
	end
	
	for _, folder in pairs(preOut) do
		for name, module in pairs(folder) do
			Core.println(name)
			module.Core = Core
			module.__index = module
			module = setmetatable({}, module)
			module:Initialize()
		end
	end
	
	for _, folder in pairs(preOut) do
		for _, module in pairs(folder) do
			module:Start()
		end
	end
end

Initialize()