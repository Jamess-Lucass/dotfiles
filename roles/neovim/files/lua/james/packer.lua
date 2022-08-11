local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', path })
  cmd 'packadd packer.nvim'
end

if packer == nil then
  packer = require('packer')
  packer.init()
end

local use = packer.use
packer.reset()

-- Packer
use('wbthomason/packer.nvim')

use {
  'lspcontainers/lspcontainers.nvim',
  requires = {
    'neovim/nvim-lspconfig',
    'nvim-lua/lsp_extensions.nvim',
  },
  config = function ()
    require('james.plugins.lspconfig')
  end
}

-- lua line
use {
  'nvim-lualine/lualine.nvim',
  config = function ()
    require('james.plugins.lualine')
  end
}

-- Treesitter
use {
  'nvim-treesitter/nvim-treesitter',
  run = 'TSUpdate',
  config = function ()
    require('james.plugins.treesitter')
  end
}

-- completion
use {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'ray-x/cmp-treesitter',
    {
      'tzachar/cmp-tabnine',
      run = "./install.sh",
    },
    'onsails/lspkind-nvim'
  },
  config = function ()
    require('james.plugins.cmp')
    require('james.plugins.cmp_tabnine')
    require('lspkind').init()
  end
}

-- Telescope
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { { 'nvim-lua/plenary.nvim' } },
  config = function ()
    require('james.plugins.telescope')
  end
}

-- Themes
use {
  'folke/tokyonight.nvim',
  config = function ()
    require('james.plugins.tokyonight')
  end
}

use {
  'weilbith/nvim-code-action-menu',
  requires = {
    'kosayoda/nvim-lightbulb'
  },
  cmd = 'CodeActionMenu',
  config = function ()
    require('james.plugins.code_action_menu')
  end
}
