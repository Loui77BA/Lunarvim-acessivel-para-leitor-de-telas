--------------------------------------------------------------------------------
-- lua/user/lsp.lua
--------------------------------------------------------------------------------

local lspconfig = require("lspconfig")

-- Capabilities para autocompletion (cmp_nvim_lsp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Lista de servidores que serão configurados
local servers = {
  "bashls",
  "tsserver",
  "html",
  "cssls",
  "jdtls",
  "gopls",
  "pyright",
}

-- Função de callback "on_attach" (executada quando um servidor LSP é anexado)
local function on_attach(client, bufnr)
  -- Se o LSP suportar destaque do texto sob o cursor
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

  -- Desativa signature help para evitar conflito
  if client.server_capabilities.signatureHelpProvider then
    client.server_capabilities.signatureHelpProvider = false
  end
end

-- Configura cada servidor da lista
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

--------------------------------------------------------------------------------
-- Configuração específica para HTML (exemplo)
--------------------------------------------------------------------------------
lspconfig.html.setup({
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
})
