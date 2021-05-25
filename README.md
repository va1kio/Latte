# Latte
Latte is a modular, object-oriented, and class-based UI framework, meant to be used in production for Roblox experiences.

## Latte is not a replacement of Roact
Latte does not have anything such as an actual render like Roact, it is only a simple UI framework that follows the philosophy of modular, objects and classes, so you can write better code for your UI.

## Required tools
- Rojo

If you use Foreman but you do not have Rojo installed systemwide, use command `foreman install`

You can install Rojo in other methods, check out [the documentation](https://rojo.space)

## Installation
### Submodule
Add this repository as a submodule into your packages directory:
```
git submodule add https://github.com/va1kio/Latte packages/Latte
```

### Rojo Serve
Read `Building from source`

### RBXMX
Use command `rojo build` to build into a RBXMX file
```
rojo build --output "export.rbxmx"
```

and then import `export.rbxmx` into your game, and put it inside `ReplicatedStorage`

## Building from source
### UNIX
Execute `build.sh`

### Windows
Execute `build.ps1` (may not work, I am not a Windows user)