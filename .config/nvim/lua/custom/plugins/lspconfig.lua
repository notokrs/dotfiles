local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local servers = { "html", "cssls", "pyright" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         -- root_dir = vim.loop.cwd,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   -- Typescript/Javascript
   lspconfig.tsserver.setup {
      on_attach = attach,
      capabilities = capabilities,
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
      root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json")
    }

   -- PHP
   lspconfig.intelephense.setup {
      on_attach = attach,
      capabilities = capabilities,
      cmd = { "intelephense", "--stdio" },
      filetypes = { "php" },
      root_dir = lspconfig.util.root_pattern("composer.json", ".git")
   }

   end
return M