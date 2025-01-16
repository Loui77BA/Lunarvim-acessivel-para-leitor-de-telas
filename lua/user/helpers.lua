--------------------------------------------------------------------------------
-- lua/user/helpers.lua
-- Funções auxiliares genéricas, ex: feedback_message
--------------------------------------------------------------------------------

local M = {}

--- Exibe mensagem no Neovim via vim.notify com título "LunarVim"
--  Útil para feedback auditivo em leitores de tela.
---@param message string
function M.feedback_message(message)
  vim.notify(message, vim.log.levels.INFO, {
    title = "LunarVim",
    timeout = 3000,
  })
end

--- Função para exibir uma mensagem de erro
---@param message string
function M.error_message(message)
  vim.notify(message, vim.log.levels.ERROR, {
    title = "LunarVim - Erro",
    timeout = 5000,
  })
end

--- Função para exibir uma mensagem de aviso
---@param message string
function M.warning_message(message)
  vim.notify(message, vim.log.levels.WARN, {
    title = "LunarVim - Aviso",
    timeout = 4000,
  })
end

-- Adicionar mapeamento para garantir que Esc funcione no modo de inserção
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })

return M
