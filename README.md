# tex-compile-nvim
Lightweight Neovim plugin allowing easy compilation of latex files from within Neovim.

## Installation and Setup
### Dependencies
* latexmk

### Setup
Use your favorite package manager (I use lazy)

```lua
{
    -- install package from GitHub
    "ptdewey/tex-compile-nvim",

    -- ensure plenary is installed
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    -- run plugin setup
    require("tex-compile-nvim").setup()
}
```

## Usage
This plugin provides two different commands for compiling latex files:

Compiling once: `:LatexCompile`

Live compiling (compiling on save): `:LatexCompileLive`

Running either command will compile tex files in the current working directory.
