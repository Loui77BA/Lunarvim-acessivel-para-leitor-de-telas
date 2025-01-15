--------------------------------------------------------------------------------
-- lua/user/ui.lua
--------------------------------------------------------------------------------

-- Define o tema preferido
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

-- Define a fonte recomendada e tamanho
vim.o.guifont = "FiraCode Nerd Font:h18"

-- Aumenta o espaçamento entre linhas para melhor legibilidade
vim.o.linespace = 4

-- Outras possíveis personalizações de UI
lvim.builtin.bufferline.active = true -- se quiser gerenciar tabs/buffers no topo
lvim.builtin.lualine.active = true     -- barra de status inferior
