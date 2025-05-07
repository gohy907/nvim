This is my config for [Neovim v0.11.1](https://github.com/neovim/neovim) powered by [NvChad v2.5](https://github.com/NvChad/NvChad)

# Features
- All features of latest NvChad
- .cpp and .cs files autocompletion
- .cpp and .cs files syntax highlighting
- .cpp and .cs files autoformatting on save
- .cpp and .cs debuggers:
    - `<Space>db` toggles breakpoint on line
    - `<F5>` starts debugger
    - `<F5>t` stops debugger
    - `<F5>r` restarts debugger
    - `<F6>` steps into the code 
    - `<F7>` steps over the code 
    - `<F8>` steps out of the code
    - **All of these mappings can be easily changed to your taste in "dap" section of mappings.lua** 
- Automatic installation of neccesary LSP servers, DAPs, formatters and linters via mason.nvim

# Defaults
- NvDash opens at start 
    - You can disable that by editing [chadrc.lua](./lua/chadrc.lua)
- Comments are in italic 
    - You can change that by editing [chadrc.lua](./lua/chadrc.lua)
- "oxocarbon" theme
    - You can change that via NvChad, press `<leader>th` to change the theme to your liking *(`<leader>` stands for Space key)* 

# Installation
## Linux
Delete your previous Neovim configs:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

And install this config: 

```bash
git clone https://github.com/gohy907/nvim ~/.config/nvim && nvim 
```

After lazy.nvim installs all plugins, wait for treesitter to install all plugins and mason.nvim to install all LSPs
You should see `[mason-lspconfig.nvim] clangd was successfully installed` in command line when it's all done

To install .cpp debugger run `:MasonInstall codelldb` and wait for mason.nvim to install it
To install .cs debugger run `:MasonInstall netcoredbg` and wait for mason.nvim to install it

After mason.nvim finishes with that, reopen Neovim and you are ready to go!

# Uninstallation
## Linux 
Delete this config with these commands:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```
