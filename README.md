# Neovim config
Necessary informations about setting up nvim on the current system.  
The config was designed to be as flexible as possible.

## Table of contents
- [Todos](#todos)
- [Getting into this config](#getting-into-this-config)  
- [Dependencies](#dependencies)  
- [Formatting](#formatting)  
    - [C, C++](#c-c)

## Todos:

- [X] noice.nvim: remove or configure not to be annoying (removed + troubles.nvim)

## Getting into this config
To remember how to use nvim, type :Tutor
Look up which plugins are there in `nvim/lua/plugins/`  
To undestand how to use the plugin-specific and standard features, understand and memorize the defined keymaps in both `nvim/lua/core/keymaps.lua` and `nvim/lua/plugins/keymaps.lua`  

## Dependencies
Plugins like mason.nvim need accessible tools to be installed and reachable.  
>*Tools like e.g. language related commands (`$ go`, `$ python`, etc.)*  

To find out which tools are missing, try to orient on informations in the error logs mentioned.

## Formatting
Formatting is done by `conform.nvim` plugin.
### C, C++
To format c and c++ as you want, you have to make .clang-format in the root folder of your OS (e.g. ~/usr/) or of the project.
<details>
    <summary>Current example `.clang-format` </summary>

```yaml
BasedOnStyle: LLVM<br>
IndentWidth: 4  
AlignAfterOpenBracket: true  
```
</details>  

> [!TIP]
> To see how to handle this file you can go to [this documentation](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)

