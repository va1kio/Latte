SetTimeout
==========

A JavaScript's `setTimeout()` implementation in Luau. This implementation does not use the native `wait()` implementation, but using a custom one with `RunService`

This does not work with Vanilla Lua, as it uses `RunService`, a Roblox exclusive singleton.

Methods
=======
!!! abstract (Callback: function, Interval: number?)
Creates a new TimeoutObject, fires the Callback function after the specified time has passed