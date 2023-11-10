-- SOURCE Configuration Files
require('config.kickstart')
require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.lazy')
--require('config.languages')
require('config.themes')

if vim.g.vscode ~= nil then require('config.vscode') end
