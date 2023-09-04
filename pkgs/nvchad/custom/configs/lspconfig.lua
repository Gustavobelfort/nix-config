local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  -- lua stuff
  "lua_ls",

  -- shell
  "bashls",
  -- "awk_ls",

  -- c
  "clangd",

  -- rust
  "rust_analyzer",

  -- web dev
  "cssls",
  "html",
  "tsserver",
  "jsonls",
  "tailwindcss",
  "eslint",

  -- python
  "pyright",

  -- yaml
  "yamlls",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["yamlls"].setup{
  settings = {
    yaml = {
      format = {
        bracketSpacing = "false",
      },
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    },
  }
}
