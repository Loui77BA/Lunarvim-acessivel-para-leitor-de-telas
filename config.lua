--------------------------------------------------------------------------------
-- config.lua (arquivo principal do LunarVim)
--------------------------------------------------------------------------------

-- Carrega os módulos de configuração de forma organizada.
-- Caso precise omitir algum módulo, basta comentar a linha abaixo correspondente.

require("user.helpers")      -- Funções auxiliares e de feedback
require("user.dashboard")    -- Configuração do Dashboard (Alpha)
require("user.plugins")      -- Plugins e ajustes de cada plugin
require("user.lsp")          -- Configurações e ajustes de LSP
require("user.diagnostics")  -- Configurações de diagnóstico do Neovim
require("user.treesitter")   -- Configuração do Treesitter
require("user.telescope")    -- Ajustes adicionais do Telescope
require("user.ui")           -- Interface (tema, fontes, etc.)
require("user.whichkey")     -- Configurações do WhichKey
require("user.keymaps")      -- Mapeamentos gerais
require("user.extras")       -- Opcional: Módulo de extras (snippets, etc.)

-- Habilita format_on_save no LunarVim
lvim.format_on_save = true

-- Caso queira desabilitar format_on_save para algum filetype específico, pode fazer:
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.md" },
--   callback = function()
--     vim.b.format_on_save = false
--   end,
-- })

--------------------------------------------------------------------------------
-- Ajustes finais ou overrides podem ser colocados aqui, se necessário.
--------------------------------------------------------------------------------
