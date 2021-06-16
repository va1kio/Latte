# Examples
Latte can be hard to understand and learn without reading the examples, this document holds all examples on using Latte, as well as using its system-level libraries

## Generic
=== "Template"
    ``` lua
    local module = {}

    function module:Initialize()

    end

    function module:Start()

    end

    return module
    ```

=== "Example 1"
    ``` lua
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
    ```

## Collections
=== "Getting a Collection"
    ``` lua
    ...

    function module:Initialize()
        self.Core.Collection.new("Example-Collection")
    end

    function module:Start()
        self.Core.println(self.Core.Collection:Get("Example-Collection").Name)
    end
    ```

=== "Destroying a Collection"
    ``` lua
    ...

    function module:Initialize()
        self.Core.Collection.new("Example-Collection")
    end

    function module:Start()
        self.Core.Collection:Get("Example-Collection"):Destroy()
    end
    ```

=== "Append & Get"
    ``` lua
    ...

    function module:Initialize()
        self.Collection = self.Core.Collection.new("Example-Collection")
        self.Collection:Append("Example-1", "Hello World!")
    end

    function module:Start()
        self.Core.println(self.Collection:Get("Example-1"))
    end
    ```

=== "Increment"
    ``` lua
    ...

    function module:Initialize()
        self.Collection = self.Core.Collection.new("Example-Collection")
        self.Collection:Append("Example-1", 5)
    end

    function module:Start()
        self.Core.println(self.Collection:Get("Example-1"))
        self.Collection:Increment("Example-1", 255)
        self.Core.println(self.Collection:Get("Example-1"))
    end
    ```

=== "Remove"
    ``` lua
    ...

    function module:Initialize()
        self.Collection = self.Core.Collection.new("Example-Collection")
        self.Collection:Append("Example-1", 5)
    end

    function module:Start()
        self.Collection:Remove("Example-1")
    end
    ```

## Signals
=== "Creating a Signal"
    ``` lua
    ...

    function module:Initialize()
        self.Core.Signals.new("Example-Signal")
    end
    ```

=== "Emit & Register"
    ``` lua
    ...

    function module:Initialize()
        self.Core.Signals.new("Example-Signal"):Register(function(...)
            self.Core.println(...)
        end)
    end

    function module:Start()
        self.Core.Signals:GetSignal("Example-Signal"):Emit("Hello ", "World!")
    end
    ```

=== "Destroying a Signal"
    ``` lua
    ...

    function module:Initialize()
        self.Core.Signals.new("Example-Signal"):Destroy()
    end
    ```

## Sort
=== "Merge Sort"
    ``` lua
    ...
    function module:Initialize()
        local demoTable = {}
        for _ = 1, 150 do
            table.insert(demoTable, math.random(1, 9999))
        end

        self.Core.println(table.unpack(demoTable))
        self.Core.println(table.unpack(self.Core.Sort.Merge(demoTable)))
    end
    ```
    
=== "Bubble Sort"
    ``` lua
    ...
    function module:Initialize()
        local demoTable = {}
        for _ = 1, 150 do
            table.insert(demoTable, math.random(1, 9999))
        end

        self.Core.println(table.unpack(demoTable))
        self.Core.println(table.unpack(self.Core.Sort.Bubble(demoTable)))
    end
    ```

=== "Quick Sort"
    ``` lua
    ...
    function module:Initialize()
        local demoTable = {}
        for _ = 1, 150 do
            table.insert(demoTable, math.random(1, 9999))
        end

        self.Core.println(table.unpack(demoTable))
        self.Core.println(table.unpack(self.Core.Sort.Quick(demoTable)))
    end
    ```

=== "Bogo Sort"
    ``` lua
    ...
    function module:Initialize()
        local demoTable = {}
        for _ = 1, 7 do
            table.insert(demoTable, math.random(1, 9999))
        end

        self.Core.println(table.unpack(demoTable))
        self.Core.println(table.unpack(self.Core.Sort.Bogo(demoTable)))
    end
    ```

## SetTimeout
=== "5 seconds interval"
    ``` lua
    ...
    function module:Initialize()
        self.Core.setTimeout(function()
            self.Core.println("Hello world!")
        end, 5)
    end
    ```