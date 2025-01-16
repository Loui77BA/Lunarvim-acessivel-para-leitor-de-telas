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

-- Ativar wrap para exibir texto quebrado em linhas longas
vim.o.wrap = true

-- Adicionar mapeamento para exibir páginas de ajuda rapidamente
vim.api.nvim_set_keymap("n", "<C-h>", ":Telescope help_tags<CR>", { noremap = true, silent = true })

-- Adicionar mapeamento para abrir o terminal integrado
vim.api.nvim_set_keymap("n", "<C-t>", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- Adicionar mapeamento para alternar entre buffers
vim.api.nvim_set_keymap("n", "<C-Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

-- Adicionar mapeamento para salvar e sair rapidamente
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })

-- Adicionar mapeamento para abrir o NvimTree
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Adicionar mapeamento para abrir o Telescope
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })

-- Adicionar mapeamento para garantir que Esc funcione no modo de inserção
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })
