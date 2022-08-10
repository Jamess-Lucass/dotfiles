local function setup(config, server)
  local util = require('lspconfig/util')
  config.cmd = require('lspcontainers').command(server)

  if server == "dockerls" then
    config.before_init = function(params)
      params.processId = vim.NIL
    end

    config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
  end

  if server == "omnisharp" then
    config.before_init = function(params)
      params.processId = vim.NIL
    end

    config.root_dir = util.root_pattern("*.sln", "*.csproj", vim.fn.getcwd())
  end

  if server == "rust_analyzer" then
    config.root_dir = util.root_pattern(".git", vim.fn.getcwd())

    vim.api.nvim_exec([[
      autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"TypeHint", "ChainingHint", "ParameterHint" } }
    ]], false)
  end

  if server == "sumneko_lua" then
    config.settings = lua_settings
  end

  if server == "tsserver" then
    config.before_init = function(params)
      params.processId = vim.NIL
    end

    config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
  end

  if server == "yamlls" then
    config.before_init = function(params)
      params.processId = vim.NIL
    end

    config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
  end

  return config
end

return {
  setup = setup
}
