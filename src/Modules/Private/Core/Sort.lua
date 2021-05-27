local Sort = {}

local function getLower(Former, Latter)
	assert(type(Former) == "table", "Argument Former must be a table!")
	assert(type(Latter) == "table", "Argument Latter must be a table!")
	local formerIndex = 1
	local latterIndex = 1
	
	return function()
		if not Latter[latterIndex] or Former[formerIndex] and Former[formerIndex] < Latter[latterIndex] then
			formerIndex = formerIndex + 1
			return Former[formerIndex - 1]
		else
			latterIndex = latterIndex + 1
			return Latter[latterIndex - 1]
		end
	end
end

local function mergeFunc(Former, Latter)
	assert(type(Former) == "table", "Argument Former must be a table!")
	assert(type(Latter) == "table", "Argument Latter must be a table!")
	local result = {}
	for item in getLower(Former, Latter) do
		table.insert(result, item)
	end
	
	return result
end

local function shuffle(Table)
	assert(type(Table) == "table", "Argument Table must be a table!")
	local randomIndex = math.random(1 , #Table)
	for index = 1, #Table do
		Table[index], Table[randomIndex] = Table[randomIndex], Table[index]
		randomIndex = math.random(1, #Table)
	end
	
	return Table
end
	
local function isInOrder(Table)
	assert(type(Table) == "table", "Argument Table must be a table!")
	local lastItem = Table[1]
	for index, item in ipairs(Table) do
		if item < lastItem then
			return false
		end
		
		lastItem = item
	end
	return true
end
	
function Sort.Bubble(Table)
	-- from rosettacode
	local total = #Table
	local changed
	repeat
		changed = false
		total = total - 1
		for index = 1, total do
			if Table[index] > Table[index + 1] then
				Table[index], Table[index + 1] = Table[index + 1], Table[index]
				changed = true
			end
		end
	until changed == false
	
	return Table
end

function Sort.Merge(Table)
	if #Table <= 1 then
		return Table
	end
	
	local halfTotal = math.floor(#Table / 2)
	return mergeFunc(Sort.Merge{unpack(Table, 1, halfTotal)}, Sort.Merge{unpack(Table, halfTotal + 1)})
end

function Sort.Bogo(Table)
	-- big trolling
	while not isInOrder(Table) do
		Table = shuffle(Table)
	end
	
	return Table
end

function Sort.Quick(Table)
	-- table.sort uses Quicksort, there's really no need to reimplement the QuickSort algorithm
	table.sort(Table)
	return Table
end

return setmetatable(Sort, {
	__call = function(_, Key, Table)
		if Sort[Key] and type(Sort[Key]) == "function" and type(Table) == "table" then
			Sort[Key](table.pack(unpack(Table)))
		end
	end
})