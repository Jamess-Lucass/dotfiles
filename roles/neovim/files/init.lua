local g = vim.g
local o = vim.o

o.number = true
o.relativenumber = true
o.wrap = false
o.mouse = a
o.tabstop = 2
o.shiftwidth = 2
o.backup = false
o.termguicolors = true

require('james.packer')
