--------------------------------------------------------------------------------
-- lua/user/telescope.lua
-- Ajustes adicionais do Telescope
--------------------------------------------------------------------------------

lvim.builtin.telescope.defaults = {
  prompt_prefix   = "Buscar: ", -- Prefixo textual claro
  selection_caret = "> ",       -- Simboliza o item selecionado
  layout_strategy = "vertical",
  layout_config = {
    vertical = {
      width = 0.8,              -- Maior largura para legibilidade
      preview_height = 0.4,
    },
  },
  path_display     = { "absolute" },
  sorting_strategy = "ascending",
  mappings = {
    i = {
      -- Navegar com feedback auditivo
      ["<Up>"] = function(prompt_bufnr)
        local actions = require("telescope.actions")
        local state = require("telescope.actions.state")
        actions.move_selection_previous(prompt_bufnr)
        local entry = state.get_selected_entry()
        if entry then
          vim.notify("Selecionado: " .. entry.value, vim.log.levels.INFO)
        end
      end,
      ["<Down>"] = function(prompt_bufnr)
        local actions = require("telescope.actions")
        local state = require("telescope.actions.state")
        actions.move_selection_next(prompt_bufnr)
        local entry = state.get_selected_entry()
        if entry then
          vim.notify("Selecionado: " .. entry.value, vim.log.levels.INFO)
        end
      end,
      ["<CR>"] = function(prompt_bufnr)
        local actions = require("telescope.actions")
        local state = require("telescope.actions.state")
        actions.select_default(prompt_bufnr)
        local entry = state.get_selected_entry()
        if entry then
          vim.notify("Abrindo: " .. entry.value, vim.log.levels.INFO)
        end
      end,
    },
  },
}

-- Adicionar mapeamento para garantir que Esc funcione no modo de inserção
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })

-- Se quiser customizar a extensão "fzf" (se instalada):
-- lvim.builtin.telescope.extensions = {
--   fzf = {
--     fuzzy = true,
--     override_generic_sorter = true,
--     override_file_sorter = true,
--     case_mode = "smart_case",
--   },
-- }
