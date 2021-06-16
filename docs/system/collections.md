# Collections
A collection is a storage object, used to store data and to be shared between each others.

## Constructors
!!! abstract ".new(Name: string)"
    Creates a new collection, the name should be unique.

## Methods
!!! abstract ":Get(Name: string)"
    Gets a collection if it exists

!!! abstract ":Append(Name: string, Value: any)"
    Appends a new data value into a collection, name must be unique

!!! abstract ":Increment(Name: string, Delta: number)"
    Increments an existing data value, the value must be a number at first

!!! abstract ":Remove(Name: string)"
    Removes an existing data value from the collection

!!! abstract ":Destroy()"
    Destroys the collection, this removes every single data value or collection, found in the collection. Collection will be completely locked after being destroyed.