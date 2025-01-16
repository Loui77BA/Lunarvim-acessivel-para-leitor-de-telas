--------------------------------------------------------------------------------
-- lua/user/treesitter.lua
-- Configuração do Treesitter
--------------------------------------------------------------------------------

lvim.builtin.treesitter.ensure_installed = {
  "bash", "javascript", "typescript", "html", "css", "java",
  "go", "python", "lua", "json", "yaml"
}
lvim.builtin.treesitter.highlight.enable = true

-- Caso queira habilitar ou desabilitar outros recursos do TreeSitter:
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.rainbow.enable = true -- se tiver plugin rainbow

-- Adicionar mapeamento para garantir que Esc funcione no modo de inserção
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })
