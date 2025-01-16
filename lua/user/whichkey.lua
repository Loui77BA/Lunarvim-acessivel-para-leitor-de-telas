--------------------------------------------------------------------------------
-- lua/user/whichkey.lua
-- Configurações do WhichKey
--------------------------------------------------------------------------------

lvim.builtin.which_key.setup = {
  plugins = {
    spelling = { enabled = false }, -- Remove verificações desnecessárias
  },
  layout = {
    height = { min = 4, max = 25 }, -- Altura dinâmica para menus verticais
    align = "center", -- Centraliza os itens no menu
  },
  window = {
    border = "rounded", -- Borda arredondada para melhor leitura
    position = "bottom", -- Menu aparece na parte inferior
    margin = { 1, 0, 1, 0 }, -- Margens internas
    padding = { 2, 2, 2, 2 }, -- Padding interno
  },
}

lvim.builtin.which_key.mappings = {
  -- Menu verticalizado e com feedback auditivo
  ["/"] = { "<cmd>lua vim.notify('Comentar linha atual', vim.log.levels.INFO)<CR><cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Comentar Linha" },
  [";"] = { "<cmd>lua vim.notify('Abrindo painel personalizado', vim.log.levels.INFO)<CR><cmd>lua require('alpha').start()<CR>", "Abrir Painel Personalizado" },
  ["f"] = { "<cmd>Telescope find_files<CR>", "Procurar Arquivo" },
  ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorar Arquivos" },
  ["r"] = { "<cmd>Telescope oldfiles<CR>", "Arquivos Recentes" },
  ["q"] = { "<cmd>lua vim.notify('Saindo do LunarVim', vim.log.levels.INFO)<CR><cmd>qa<CR>", "Sair" },
  ["w"] = { "<cmd>w<CR>", "Salvar Arquivo" },
}

-- Adiciona ao painel "Oldfiles"
lvim.builtin.which_key.mappings[";r"] = {
  "<cmd>lua vim.notify('Abrindo arquivos recentes', vim.log.levels.INFO)<CR><cmd>Telescope oldfiles<CR>",
  "Arquivos Recentes",
}

-- Adicionar mapeamento para garantir que Esc funcione no modo de inserção
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })
