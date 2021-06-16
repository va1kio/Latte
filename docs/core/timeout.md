SetTimeout
==========

A JavaScript's `setTimeout()` implementation in Luau. This implementation does not use the native `wait()` implementation, but using a custom one with `RunService`

This does not work with Vanilla Lua, as it uses `RunService`, a Roblox exclusive singleton.

Methods
=======
(Callback: function, Interval: number?)