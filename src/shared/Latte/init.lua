local RunService = game:GetService("RunService")
local Exported = {}
assert(RunService:IsServer(), "Latte is supposed to be ran in client, aborting operation...")

local function setupModules()
	local latteTable = {}
	for _, folder in pairs(script:GetChildren()) do
		Classes[folder.Name] = {}
		for i,v in pairs(folder:GetChildren()) do
			if v:IsA("ModuleScript") and type(require(v)) == "table" then
				Exported[folder.Name][v.Name] = require(v)
				warn("Brewing " .. v.Name .. " to " .. folder.Name)
			end
		end
	end

	for name, entry in pairs(Exported) do
		warn("Setting up connections for " .. name)
		latteTable[name] = setmetatable({},{
			__index = function(self, key: string)
				return Exported[name][key]
			end
		})
	end

	for name, entry in pairs(Exported) do
		for i, v in pairs(entry) do
			warn("Linking Latte to " .. i)
			v.Latte = latteTable
			if name == "Constructors" then
				warn("Setting up constructor " .. i)
				v.setup()
			end
		end
	end
end

warn("Building dependencies")
setupModules()
warn("Finished, returning metatable")
return setmetatable(Exported, {
	__metatable = "table is read-only",
	__newindex = function() return end
})