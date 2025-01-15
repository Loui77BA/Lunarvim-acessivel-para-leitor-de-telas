--------------------------------------------------------------------------------
-- lua/user/diagnostics.lua
--------------------------------------------------------------------------------

vim.diagnostic.config({
    -- Exibe texto virtual na linha, com prefixo
    virtual_text = { spacing = 4, prefix = "INFO" },

    -- Atualiza em modo de inserção
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

  -- Caso queira personalizar as cores dos diagnósticos, pode usar algo assim:
  -- vim.cmd([[
  --   highlight DiagnosticError guifg=#EC5241
  --   highlight DiagnosticWarn  guifg=#EFB839
  --   highlight DiagnosticInfo  guifg=#7EA9A7
  --   highlight DiagnosticHint  guifg=#A3BA5E
  -- ]])
