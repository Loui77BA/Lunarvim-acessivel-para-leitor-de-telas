--------------------------------------------------------------------------------
-- lua/user/diagnostics.lua
-- Configurações de diagnóstico do Neovim
--------------------------------------------------------------------------------

vim.diagnostic.config({
  virtual_text = { spacing = 4, prefix = "INFO" },
  update_in_insert = true,
  underline       = true,
  severity_sort   = true,
  float = {
    focusable = false,
    style     = "minimal",
    border    = "rounded",
    source    = "always",
    header    = "",
    prefix    = "",
  },
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = "Erro" },
      { name = "DiagnosticSignWarn",  text = "Aviso" },
      { name = "DiagnosticSignHint",  text = "Dica" },
      { name = "DiagnosticSignInfo",  text = "Info" },
    },
  },
})

-- Adicionar mapeamento para garantir que Esc funcione no modo de inserção
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })

-- Caso queira personalizar as cores dos diagnósticos, pode usar algo assim:
-- vim.cmd([[
--   highlight DiagnosticError guifg=#EC5241
--   highlight DiagnosticWarn  guifg=#EFB839
--   highlight DiagnosticInfo  guifg=#7EA9A7
--   highlight DiagnosticHint  guifg=#A3BA5E
-- ]])
