local base = require "nvchad.configs.lspconfig"
local on_attach = base.on_attach
local on_init = base.on_init
local capabilities = base.capabilities

-- list of servers configured with default config.
local servers = {
  "lua_ls",
  "clangd",
  "tinymist",
  "texlab",
  -- "hls",
  -- "ols",
}

local pid = vim.fn.getpid()

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

vim.lsp.config("omnisharp", {
  cmd = {
    "/home/gohy/.local/share/nvim/mason/bin/OmniSharp", -- CHANGE PATH TO YOURS
    "--languageserver",
    "--hostPID",
    tostring(pid),
  },
  capabilities = capabilities,
  filetypes = { "cs", "vb" },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
})
vim.lsp.enable("omnisharp")

vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
})
vim.lsp.enable("clangd")

local exe = "zathura"
local rgs = { "--synctex-forward", "%l:1:%f", "%p" }

vim.lsp.config("texlab", {
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          documentationFormat = { "plaintext" },
          snippetSupport = true,
        },
      },
    },
  },
  settings = {
    texlab = {
      experimental = {
        verbatimEnvironments = { "minted", "lstlisting" },
        mathEnvironments = { "cases", "equation", "equation*", "align", "align*" },
        enumEnvironments = { "enumerate", "itemize", "description" },
        citationCommands = { "textcite", "cite", "parencite", "supercite", "autocite" },
      },
      build = {
        auxDirectory = "build",
        logDirectory = "build",
        pdfDirectory = "build",
        onSave = true,
        args = {
          "-pdf",
          "-lualatex",
          "-interaction=nonstopmode",
          "-aux-directory=build",
          "-output-directory=build",
          "-synctex=1",
          "%f",
        },
      },
      forwardSearch = {
        executable = exe,
        args = rgs,
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true,
      },
      diagnosticsDelay = 200,
      latexFormatter = "latexindent",
      latexindent = {
        ["local"] = nil, -- local is a reserved keyword
        modifyLineBreaks = true,
      },
      -- bibtexFormatter = 'texlab',
      formatterLineLength = 120,
    },
  },
})
vim.lsp.enable("texlab")

vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        enable = false, -- Disable all diagnostics from lua_ls
        -- globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/love2d/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})
vim.lsp.enable("lua_ls")
