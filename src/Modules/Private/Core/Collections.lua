local Collections = {}
local _collectionsHolder = {}

local function checkConflicts(Table, Name, Verbose)
	for _, item in ipairs(Table) do
		if item.Name and item.Name == Name then
			assert(Verbose ~= true, "Table " .. tostring(Table) .. " already have an existing item named " .. Name)
			return false
		end
	end
end

function Collections.new(Name)
	checkConflicts(_collectionsHolder, Name, true)
	local collectionObject = setmetatable({
		["Name"] = Name,
		["_IsCollection"] = true,
		["_Items"] = {}
	}, Collections)
	
	collectionObject.new = nil
	table.insert(_collectionsHolder, collectionObject)
	return collectionObject
end

function Collections:Get(Name)
	if self and self._IsCollection then
		for _, item in ipairs(self._Items) do
			if item.Name and item.Name == Name then
				return item
			end
		end
	else
		for _, collection in ipairs(_collectionsHolder) do
			if collection._IsCollection and collection.Name and collection.Name == Name then
				return collection
			end
		end
	end
	
	return nil
end

function Collections:Append(Name, Value)
	if not self or not self._IsCollection then
		error("Attempted to use :Append on a locked collection or nil")
	end
	
	checkConflicts(self._Items, Name, true)
	table.insert(self._Items, {
		["Name"] = Name,
		["Value"] = Value
	})
end

function Collections:Increment(Name, Delta)
	if not self or not self._IsCollection then
		error("Attempted to use :Increment on a locked collection or nil")
	end
	
	for _, item in ipairs(self._Items) do
		if item.Name and item.Name == Name and type(item.Value) == "number" then
			item.Value = item.Value + Delta
		end
	end
end

function Collections:Remove(Name)
	if not self or not self._IsCollection then
		error("Attempted to use :Remove on a locked collection or nil")
	end
	
	for index, item in ipairs(self._Items) do
		if item.Name and item.Name == Name then
			table.remove(self._Items, index)
			return item
		end
	end
end

function Collections:Destroy()
	if not self or not self._IsCollection then
		error("Attempted to use :Destroy on a locked collection or nil")
	end
	local cachedName = self.Name
	
	self._IsCollection = nil
	for index = 1, #self._Items do
		table.remove(self._Items, index)
	end
	self.Name = nil
	self._Items = nil
	
	for index, item in ipairs(_collectionsHolder) do
		if item.name == cachedName and not self._IsCollection then
			table.remove(_collectionsHolder, index)
			return
		end
	end
end

Collections.__index = Collections
return Collections