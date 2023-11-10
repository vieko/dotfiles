-- SOURCE Configuration Files
require('config.kickstart')
require('config.options')
require('config.keymaps')
require('config.lazy')
require('config.functions')
require('config.themes')
require('config.autocmds')

if vim.g.vscode ~= nil then require('config.vscode') end
