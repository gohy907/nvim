local bufnr = vim.api.nvim_get_current_buf()

-- Code actions
vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp "codeAction"
end, { silent = true, buffer = bufnr, desc = "Rust Code Actions" })

-- Hover actions
vim.keymap.set("n", "K", function()
  vim.cmd.RustLsp { "hover", "actions" }
end, { silent = true, buffer = bufnr, desc = "Rust Hover Actions" })

-- Debug
vim.keymap.set("n", "<F5>", function()
  vim.cmd.RustLsp "debuggables"
end, { silent = true, buffer = bufnr, desc = "Rust Debuggables" })

-- Run
vim.keymap.set("n", "<leader>rr", function()
  vim.cmd.RustLsp "runnables"
end, { silent = true, buffer = bufnr, desc = "Rust Runnables" })
