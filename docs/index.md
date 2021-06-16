# About Latte
Latte is a lightweight and performant framework that focuses on modularity and object principle in programming. It is used to create reliable, flexible, and maintainable user interfaces within Roblox, also can be used as a standalone class-based framework in Vanilla Lua.

## Why
User interface development has been notoriously horrible in Roblox without any proper structuring, as a result, majority of the user interfaces in Roblox are more likely to be categorised as "if it works, it works" level. While they work as expected, it creates a lot of problems in being flexible and maintainable. 

Latte strives to solve the major disadvantages found in user interface development in the coding aspect, advocating the use of modules for components, and creating a really clear and maintainable structure. 

## Used in
Latte Framework is used in the following games:

![Frappé](./assets/Frappe.png){ style="height:64px;width:64px" loading=lazy }
![Burger Queen](./assets/BurgerQueen.png){ style="height:64px;width:64px" loading=lazy }

!!! info "Want to add your game?"
    Submit an issue on GitHub, with your group/game information and logo attached.

## Vanilla Lua
Latte technically is compatible with Vanilla Lua, but it requires further editing of the source code as Latte is originally coded in the Luau environment, components like `script`, does not exist in Vanilla Lua.

## Disadvantages
Latte is a lightweight and performant framework, it still has some disadvantages pushing you away from using Latte. Here's a few:

- Build time: Latte builds everything at first run, and then link every single module into a table, and finally link it back to every modules. Larger modules or greater amount of modules will affect the build time. Which means the UI will take more time to actually deploy.
- Not declarative: Latte is not an alternative to Roact, it does not have an actual render, nor can you create UI in a declarative way, as declarative as Roact or Flutter (Enoria in Roblox). We do plan to create a new utility to overcome this disadvantage, though.