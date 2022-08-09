local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local defaultConfig = {
  capabilities = capabilities
}

local lspcontainer_servers = {
  "dockerls",
  "gopls",
  "html",
  "rust_analyzer",
  "sumneko_lua",
  "tsserver",
  "yamlls"
}

for _, server in pairs(lspcontainer_servers) do
  local config = require('james.plugins.lspcontainers').setup(defaultConfig, server)

  require('lspconfig')[server].setup(config)
end
