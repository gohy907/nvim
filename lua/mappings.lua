require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })

--- dap ---
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle breakpoint" })
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "DAP: Continue debugging" })
map("n", "<F5>t", function()
  require("dap").terminate()
end, { desc = "DAP: Stop debugging" })
map("n", "<F5>r", function()
  require("dap").restart()
end, { desc = "DAP: Restart debugger" })
map("n", "<F6>", function()
  require("dap").step_into()
end, { desc = "DAP: Step into" })
map("n", "<F7>", function()
  require("dap").step_over()
end, { desc = "DAP: Step over" })
map("n", "<F8>", function()
  require("dap").step_out()
end, { desc = "DAP: Step out" })

map("n", "ш", "i")
map("n", "м", "v")
map("n", "в", "d")
map("n", "вв", "dd")
map("n", "В", "D")
map("n", "н", "y")
map("n", "Жц", ":w")
map("n", "Жй", ":q")
--map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
