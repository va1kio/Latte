# Signals
Signals are the most preferable way to have communication between each other in Latte. Opposed to Bindables, Signals **do not** deep copy parameters, as a result, you do not need to do any deep comparison if you happen to compare a table in a parameter with another table.

## Constructors
!!! abstract ".new(Name: string)"
    Creates a new Signal

## Methods
!!! abstract ":GetSignal(Name: string)"
    Gets the corresponding Signal with the name

!!! abstract ":Emit(...)"
    Fires the Signal with the parameters, all registered functions will be called

!!! abstract ":Register(Callback: function)"
    Register a callback to the Signal. Parameters within the callback are the parameters passed by :Emit()

!!! abstract ":Destroy()"
    Do clean up on the Signal, all registered callbacks are cleared, removing the Signal itself from the memory
