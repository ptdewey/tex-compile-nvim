# tex-compile-nvim

> [!IMPORTANT]
> This plugin is very small and I would recommend using a `ftplugin/tex.lua` file instead due to the addition of the `vim.system` function as it removes the need for Plenary as a dependency.
>
> Example usage: [ftplugin/tex.lua](https://github.com/ptdewey/dotfiles/blob/2ef65e8b6ed59d172c0308718c95880355f57cd8/config/nvim/ftplugin/tex.lua)

---

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

## Usage

`:LatexCompile`

