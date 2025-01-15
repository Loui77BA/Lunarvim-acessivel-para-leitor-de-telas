--------------------------------------------------------------------------------
-- lua/user/treesitter.lua
--------------------------------------------------------------------------------

lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "javascript",
    "typescript",
    "html",
    "css",
    "java",
    "go",
    "python",
    "lua",
    "json",
    "yaml",
  }

  lvim.builtin.treesitter.highlight.enable = true

  -- Caso queira habilitar ou desabilitar outros recursos do TreeSitter:
  lvim.builtin.treesitter.indent.enable = true
  lvim.builtin.treesitter.rainbow.enable = true -- se tiver plugin rainbow
