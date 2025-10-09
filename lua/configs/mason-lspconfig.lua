local servers = require "configs.lsp-servers"

-- List of servers to ignore during install
local ignore_install = {}

-- Build a list of lsp servers to install minus the ignored list.
local all_servers = vim.tbl_filter(function(s)
  return not vim.tbl_contains(ignore_install, s)
end, servers)

require("mason-lspconfig").setup {
  ensure_installed = all_servers,
  automatic_installation = false,
}
