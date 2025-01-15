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

return M
