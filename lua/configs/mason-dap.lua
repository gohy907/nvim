require("mason-nvim-dap").setup {
  ensure_installed = { "netcoredbg", "codelldb" },
  automatic_installation = { exclude = {} },
}
