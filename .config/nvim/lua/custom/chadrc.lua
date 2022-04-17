local M = {}

-- PLUGINS
local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"

M.plugins = {
   status = {
      colorizer = true, -- color hex code
      alpha = true, -- dashboard
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   default_plugin_config_replace = {
      nvim_treesitter = plugin_conf.treesitter,
      nvim_tree = plugin_conf.nvimtree,
   },

   install = userPlugins,
}

-- UI
M.ui = {
   theme = "monekai",
}

-- Mappings no plugins
M.mappings = {
  misc = {
    close_buffer = "<C-w>"
  }
}

return M
