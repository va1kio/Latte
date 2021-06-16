Collections
===========

A collection is a storage object, used to store data and to be shared between each others.

Constructors
============
.new(Name: string)
___
Creates a new collection, the name should be unique.

Methods
=======
:Get(Name: string)
___
Gets a collection if it exists

:Append(Name: string, Value: any)
___
Appends a new data value into a collection, name must be unique

:Increment(Name: string, Delta: number)
___
Increments an existing data value, the value must be a number at first

:Remove(Name: string)
___
Removes an existing data value from the collection

:Destroy()
___
Destroys the collection, this removes every single data value or collection, found in the collection. Collection will be completely locked after being destroyed.