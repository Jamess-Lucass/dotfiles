local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function check_packer_install()
  local path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  
  if fn.empty(fn.glob(path)) > 0 then
		fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', path })
		cmd 'packadd packer.nvim'
  end
end

local function startup()
	if packer == nil then
		packer = require('packer')
		packer.init()
	end

	local use = packer.use
	packer.reset()

	use('wbthomason/packer.nvim')

	use {
    'folke/tokyonight.nvim',
    config = function ()
      require('james.plugins.tokyonight')
    end
  }

	use {
    'nvim-lualine/lualine.nvim',
    config = function ()
      require('james.plugins.lualine')
    end
  }
end

check_packer_install()
startup()
