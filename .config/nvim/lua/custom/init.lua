local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
    use {
   	    "Pocco81/AutoSave.nvim",
   	    config = function()
      	local autosave = require "autosave"

        autosave.setup {
            enabled = true,
            execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
            events = { "InsertLeave", "TextChanged" },
            conditions = {
                exists = true,
                filetype_is_not = {},
                modifiable = true,
            },
            clean_command_line_interval = 2500,
            on_off_commands = true,
            write_all_buffers = false,
            }
        end,
    }

    use {
        "karb94/neoscroll.nvim",
        opt = true,
        config = function()
            require("neoscroll").setup()
        end,

       -- lazy loading
       setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
       end,
    }

    use {
      "williamboman/nvim-lsp-installer",
      config = function()
         local lsp_installer = require "nvim-lsp-installer"

         lsp_installer.on_server_ready(function(server)
            local opts = {}

            server:setup(opts)
            vim.cmd [[ do User LspAttachBuffers ]]
         end)
      end,
   }

   -- use{
   --  "prettier/vim-prettier",
   --  run = 'yarn install',
   --  ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'}
   -- }
end)

require ('custom.autocmds')