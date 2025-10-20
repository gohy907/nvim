local dap = require "dap"
dap.adapters.coreclr = {
  type = "executable",
  command = "netcoredbg",
  args = { "--interpreter=vscode" },
}
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
    end,
  },
}

dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

  -- On windows you may have to uncomment this:
  -- detached = false,
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/target/debug/" .. vim.fn.substitute(vim.fn.getcwd(), "^.*/", "", ""),
        "file"
      )
    end,
    cwd = "${workspaceFolder}",
  },
  {
    type = "codelldb",
    request = "launch",
    name = "Launch with args",
    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/target/debug/" .. vim.fn.substitute(vim.fn.getcwd(), "^.*/", "", ""),
        "file"
      )
    end,
    args = function()
      local args = {}
      vim.ui.input({ prompt = "args: " }, function(input)
        args = vim.split(input, " ")
      end)
      return args
    end,
    cwd = "${workspaceFolder}",
  },
  {
    type = "codelldb",
    request = "attach",
    name = "Attach to process",
    pid = function()
      return vim.fn.input "Input pid: "
    end,
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
