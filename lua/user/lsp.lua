--------------------------------------------------------------------------------
-- lua/user/lsp.lua
-- Configurações e ajustes de LSP
--------------------------------------------------------------------------------

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Lista de servidores que serão configurados automaticamente:
local servers = { "bashls", "tsserver", "html", "cssls", "jdtls", "gopls", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      -- Adiciona highlight ao texto sob o cursor
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_create_autocmd("CursorHold", {
          group = "lsp_document_highlight",
          pattern = "*",
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          group = "lsp_document_highlight",
          pattern = "*",
          callback = vim.lsp.buf.clear_references,
        })
      end
    end,
  }
end

-- Remover configuração duplicada para HTML
-- lspconfig.html.setup({
--   capabilities = capabilities,
--   cmd = { "vscode-html-language-server", "--stdio" },
--   filetypes = { "html" },
--   init_options = {
--     configurationSection = { "html", "css", "javascript" },
--     embeddedLanguages = {
--       css = true,
--       javascript = true,
--     },
--     provideFormatter = true,
--   },
-- })
