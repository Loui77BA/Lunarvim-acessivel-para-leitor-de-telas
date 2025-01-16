--------------------------------------------------------------------------------
-- lua/user/telescope.lua
-- Ajustes adicionais do Telescope com notificações otimizadas
--------------------------------------------------------------------------------

local actions = require("telescope.actions")
local state = require("telescope.actions.state")

-- Variável para armazenar o item selecionado anteriormente
local previous_entry = nil

-- Função para notificar apenas quando a seleção mudar
local function notify_selected_once(prompt_bufnr)
  local entry = state.get_selected_entry(prompt_bufnr)
  if entry and entry ~= previous_entry then
    vim.notify("Selecionado: " .. entry.value, vim.log.levels.INFO)
    previous_entry = entry
  end
end

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
  path_display     = { "shorten" }, -- Mostra o caminho de forma reduzida
  sorting_strategy = "ascending",
  mappings = {
    i = {
      -- Navegar com feedback auditivo otimizado
      ["<Up>"] = function(prompt_bufnr)
        actions.move_selection_previous(prompt_bufnr)
        notify_selected_once(prompt_bufnr)
      end,
      ["<Down>"] = function(prompt_bufnr)
        actions.move_selection_next(prompt_bufnr)
        notify_selected_once(prompt_bufnr)
      end,
      ["<CR>"] = function(prompt_bufnr)
        actions.select_default(prompt_bufnr)
        local entry = state.get_selected_entry(prompt_bufnr)
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
