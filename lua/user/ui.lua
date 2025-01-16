--------------------------------------------------------------------------------
-- lua/user/ui.lua
-- Interface (tema, fontes, etc.)
--------------------------------------------------------------------------------

-- Tema otimizado para pessoas com daltonismo ou baixa visão
lvim.colorscheme = "github_dark_colorblind"

-- Exibe número de linha absoluto e relativo
vim.o.number         = true
vim.o.relativenumber = true

-- Destaca a linha atual
vim.o.cursorline = true

-- Habilita cores verdadeiras no terminal
vim.o.termguicolors = true

-- Define fundo escuro
vim.o.background = "dark"

-- Define a fonte (recomendada) e tamanho
vim.o.guifont = "FiraCode Nerd Font:h18"

-- Aumenta o espaçamento entre linhas para melhor legibilidade
vim.o.linespace = 4

-- Adicionar mapeamento para garantir que Esc funcione no modo de inserção
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })

-- Configuração para exibir erros na barra de status
lvim.builtin.lualine.options = {
    theme = "github_dark_colorblind",
    globalstatus = true,
  }

  lvim.builtin.lualine.sections.lualine_c = {
    { "filename", path = 1 },
    {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
      diagnostics_color = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
      },
    },
  }

