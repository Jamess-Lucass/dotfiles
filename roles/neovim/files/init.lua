local g = vim.g
local o = vim.o

o.ma = true
o.cursorline = true
o.expandtab = true
o.mouse = a
o.number = true
o.relativenumber = true
o.wrap = false
o.tabstop = 2
o.shiftwidth = 2
o.backup = false
o.termguicolors = true

--mappings
g.mapleader = "."

require('james.packer')
