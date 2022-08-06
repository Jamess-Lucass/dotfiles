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
