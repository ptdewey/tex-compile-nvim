# tex-compile-nvim
Lightweight Neovim plugin allowing easy compilation of latex files from within Neovim.

## Installation and Setup
### Dependencies
* latexmk

### Setup

Lazy:
```lua
{
    "ptdewey/tex-compile-nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("tex-compile-nvim").setup()
    end,
}
```

Packer:
```lua
use {
    "ptdewey/tex-compile-nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("tex-compile-nvim").setup()
    end,
}
```

## Usage
This plugin provides two different commands for compiling latex files:

Compiling once: `:LatexCompile`

Live compiling (compiling on save): `:LatexCompileLive`

Running either command will compile tex files in the current working directory.
