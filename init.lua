if vim.g.started_by_firenvim then
  -- настройки, специфичные для Firenvim (например, внешний вид, плагины)
end

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

-- Check .cpp FileType
vim.api.nvim_create_autocmd("FileType", {
  -- Set needed FileType
  pattern = "cpp",
  -- If FileType type .cpp do:
  callback = function()
    -- Write all macros for cpp projects
    vim.fn.setreg(
      "a",
      "y/;"
        .. enter
        .. 'ostd::cout << "'
        .. esc
        .. 'pa: " << '
        .. esc
        .. "pa << std::endl;"
        .. esc
        .. " "
    )
  end,
})
