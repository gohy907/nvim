This is my config for Neovim v0.11.1 powered by NvChad v2.5

# Features
- All features of latest NvChad
- clang formatting of .cpp files on save
- Debugger powered by codelldb
    - `<Space>db` toggles breakpoint on line
    - `<F5>` starts debugger
    - `<F5>t` stops debugger
    - `<F5>r` restarts debugger
    - `<F6>` steps into the code 
    - `<F7>` steps over the code 
    - `<F8>` steps out of the code
    - **All of these mappings can be easily changed to your taste in "dap" section of mappings.lua** 
- Automatic installation of neccesary LSP servers, DAPs, formatters and linters via mason.nvim

# Installation
## Linux
Delete your previous Neovim configs:

`rm -rf ~/.config/nvim`
`rm -rf ~/.local/state/nvim`
`rm -rf ~/.local/share/nvim`

And install this config: 

`git clone https://github.com/gohy907/nvim ~/.config/nvim && nvim`

After lazy.nvim installs all plugins, wait for treesitter to finish installation of parsers and use `:MasonInstallAll` command

After mason.nvim finishes with that, reopen Neovim and you are ready to go!

# Defaults
- NvDash opens at start 
    - You can disable that by editing chadrc.lua
- Comments are in italic 
    - You can change that by editing chadrc.lua
