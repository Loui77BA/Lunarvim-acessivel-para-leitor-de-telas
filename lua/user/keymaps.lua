--------------------------------------------------------------------------------
-- lua/user/keymaps.lua
--------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Função para mapear teclas de maneira segura
------------------------------------------------------------------------------
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end

  -- Aceitar sugestão do Copilot com Ctrl+J no modo de inserção
  map("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true })

  ------------------------------------------------------------------------------
  -- NvimTree (usando setas direcionais e <Enter> para abrir, <Esc> para fechar)
  ------------------------------------------------------------------------------

  local function nvimtree_keymaps(bufnr)
    local api = require("nvim-tree.api")
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "<Up>",    api.node.navigate.sibling.prev,  opts)
    vim.keymap.set("n", "<Down>",  api.node.navigate.sibling.next,  opts)
    vim.keymap.set("n", "<Left>",  api.node.navigate.parent_close,  opts)
    vim.keymap.set("n", "<Right>", api.node.open.edit,              opts)
    vim.keymap.set("n", "<CR>",    api.node.open.edit,              opts)
    vim.keymap.set("n", "<Esc>",   api.tree.close,                  opts)
  end

  -- Associa a função nvimtree_keymaps ao NvimTree
  lvim.builtin.nvimtree.setup.on_attach = nvimtree_keymaps

  -- Remove ícones do NvimTree para melhor acessibilidade
  lvim.builtin.nvimtree.setup.renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
      },
    },
  }

  ------------------------------------------------------------------------------
  -- Mapeamentos tipo VS Code
  ------------------------------------------------------------------------------

  -- Usando a API `vim.keymap.set`
  local safe_keymap_set = function(mode, lhs, rhs, opts)
    local default_opts = { noremap = true, silent = true }
    opts = vim.tbl_extend("force", default_opts, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- Explorer
  safe_keymap_set("n", "<C-e>", ":NvimTreeToggle<CR>")

  -- Buscar arquivos
  safe_keymap_set("n", "<C-p>", ":Telescope find_files<CR>")

  -- Terminal integrado (caso use plugin 'toggleterm')
  safe_keymap_set("n", "<C-t>", ":ToggleTerm<CR>")

  -- Início e fim do arquivo
  safe_keymap_set("n", "<C-Home>", "gg")
  safe_keymap_set("n", "<C-End>", "G")

  -- Navegar buffers
  safe_keymap_set("n", "<C-m>", ":bnext<CR>")

  -- Seleção visual com <C-l>
  safe_keymap_set("n", "<C-l>", "V")

  -- Selecionar tudo
  safe_keymap_set("n", "<C-a>", "ggVG")

  -- Copiar/Recortar/Colar usando clipboard do sistema
  safe_keymap_set("v", "<C-c>", '"+y')
  safe_keymap_set("v", "<C-x>", '"+d')
  safe_keymap_set("n", "<C-v>", '"+p')
  safe_keymap_set("v", "<C-v>", '"+P')
  safe_keymap_set("i", "<C-v>", '<C-r>+')

  -- Formatação com <C-i> (verifica filetype)
  safe_keymap_set("n", "<C-i>", function()
    local filetype = vim.bo.filetype
    if filetype == "html" then
      vim.cmd("lua vim.lsp.buf.format({ async = true, timeout_ms = 5000 })")
    else
      vim.lsp.buf.format({ async = true })
    end
  end)

  -- Buscar no arquivo atual
  safe_keymap_set("n", "<C-g>", ":Telescope current_buffer_fuzzy_find<CR>")

  -- Fechar buffer, salvar, etc.
  safe_keymap_set("n", "<C-q>", ":bd<CR>")
  safe_keymap_set("n", "<C-w>", ":wq<CR>")
  safe_keymap_set("n", "<C-d>", ":q!<CR>")

  -- Undo/Redo (como Ctrl+Z / Ctrl+Y)
  safe_keymap_set("n", "<C-z>", "u")
  safe_keymap_set("n", "<C-y>", "<C-r>")

  -- Salvar arquivo
  safe_keymap_set("n", "<C-s>", ":w<CR>")
  safe_keymap_set("i", "<C-s>", "<Esc>:w<CR>a")

  ------------------------------------------------------------------------------
  -- Remove possíveis mapeamentos de <C-s> no LunarVim
  ------------------------------------------------------------------------------
  lvim.keys.insert_mode["<C-s>"] = false
  lvim.keys.normal_mode["<C-s>"] = false
