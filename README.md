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
If you are coming from an *NIX operating system, the command `make` usually should come with your operating system or distribution. If you have installed `Rojo`, you can execute `make` within the project directory, which should build a `.rbxlx` file.

For your information, the `.gitignore` file has already ignored the `.rbxlx` file, you do not really need to remove the built file when you are about to publish your change.

However, if you are using Windows, you have to install a variation of `make` that works with Windows, such as the one provided by GNUWin32, or via Chocolately (`choco install make`). You can also use WSL/WSL2 if you prefer it that way.