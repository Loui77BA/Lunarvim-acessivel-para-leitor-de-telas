--------------------------------------------------------------------------------
-- lua/user/whichkey.lua
--------------------------------------------------------------------------------

lvim.builtin.which_key.setup = {
    plugins = {
      spelling = { enabled = false }, -- Remove verificação ortográfica
    },
    layout = {
      height = { min = 4, max = 25 }, -- Altura dinâmica para menus verticais
      align = "center",               -- Centraliza os itens no menu
    },
    window = {
      border = "rounded",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
    },
  }

  lvim.builtin.which_key.mappings = {
    ["/"] = {
      "<cmd>lua vim.notify('Comentar linha atual', vim.log.levels.INFO)<CR>" ..
      "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
      "Comentar Linha"
    },
    [";"] = {
      "<cmd>lua vim.notify('Abrindo painel personalizado', vim.log.levels.INFO)<CR><cmd>lua require('alpha').start()<CR>",
      "Abrir Painel Personalizado"
    },
    ["f"] = { "<cmd>Telescope find_files<CR>", "Procurar Arquivo" },
    ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorar Arquivos" },
    ["r"] = { "<cmd>Telescope oldfiles<CR>",  "Arquivos Recentes" },
    ["q"] = {
      "<cmd>lua vim.notify('Saindo do LunarVim', vim.log.levels.INFO)<CR>" ..
      "<cmd>qa<CR>",
      "Sair"
    },
    ["w"] = { "<cmd>w<CR>", "Salvar Arquivo" },
  }

  -- Adiciona "Arquivos Recentes" via <leader>;r
  lvim.builtin.which_key.mappings[";r"] = {
    "<cmd>lua vim.notify('Abrindo arquivos recentes', vim.log.levels.INFO)<CR><cmd>Telescope oldfiles<CR>",
    "Arquivos Recentes",
  }
