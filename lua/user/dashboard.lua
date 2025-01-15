--------------------------------------------------------------------------------
-- lua/user/dashboard.lua
-- Configuração do painel de boas-vindas (Alpha)
--------------------------------------------------------------------------------

local helpers_ok, helpers = pcall(require, "user.helpers")
if not helpers_ok then
  return
end

local feedback_message = helpers.feedback_message

-- Habilita o dashboard do LunarVim (Alpha)
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

-- Substitui a tecla ";" para abrir um painel personalizado ao invés do "which_key"
lvim.builtin.which_key.mappings[";"] = {
  function()
    feedback_message("Abrindo painel personalizado...")
    local status_ok, alpha = pcall(require, "alpha")
    if status_ok then
      local dashboard = require("alpha.themes.dashboard")

      -- Header (cabeçalho) com mensagem de boas-vindas
      dashboard.section.header.val = {
        "LunarVim em Português-BR!",
        "(Use as setas do para cima e para baixo para navegar e a tecla Enter para selecionar uma opção.)",
      }

      -- Botões iniciais
      dashboard.section.buttons.val = {
        dashboard.button("f", "Procurar Arquivo", "<cmd>Telescope find_files<CR>"),
        dashboard.button("r", "Arquivos Recentes", "<cmd>lua vim.notify('Abrindo arquivos recentes...', vim.log.levels.INFO)<CR><cmd>Telescope oldfiles<CR>"),
        dashboard.button("p", "Projetos", "<cmd>Telescope projects<CR>"),
        dashboard.button("t", "Buscar Texto", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("c", "Abrir config.lua", "<cmd>edit $MYVIMRC<CR>"),
        dashboard.button("u", "Atualizar Plugins (Lazy Sync)", "<cmd>Lazy sync<CR>"),
        dashboard.button("q", "Sair do Lunarvim", "<cmd>qa<CR>"),
      }

      -- Rodapé (footer)
      dashboard.section.footer.val = {
        "Lembre-se: a prática leva à perfeição!",
        "Divirta-se com LunarVim (mais acessível) 🚀",
      }

      -- Ajuste de destaque das seções
      dashboard.section.header.opts.hl   = "Include"
      dashboard.section.buttons.opts.hl  = "Keyword"
      dashboard.section.footer.opts.hl   = "Type"

      alpha.setup(dashboard.opts)
      alpha.start()
    else
      feedback_message("Erro ao carregar o painel personalizado (Alpha).")
    end
  end,
  "Abrir Painel Personalizado",
}

-- Se desejar, pode manter uma configuração adicional para o caso de fallback
local alpha_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if alpha_ok then
  dashboard.section.header.val = {
    "LunarVim!",
    "Use as setas para cima e para baixo para navegar e a tecla Enter para selecionar uma opção.)",
  }
  dashboard.section.buttons.val = {
    dashboard.button("f", "Procurar Arquivo", "<cmd>Telescope find_files<CR>"),
    dashboard.button("r", "Arquivos Recentes", "<cmd>lua vim.notify('Abrindo arquivos recentes...', vim.log.levels.INFO)<CR><cmd>Telescope oldfiles<CR>"),
    dashboard.button("p", "Projetos", "<cmd>Telescope projects<CR>"),
    dashboard.button("t", "Buscar Texto", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("c", "Abrir config.lua", "<cmd>edit $MYVIMRC<CR>"),
    dashboard.button("u", "Atualizar Plugins", "<cmd>Lazy sync<CR>"),
    dashboard.button("q", "Sair do LunarVim", "<cmd>qa<CR>"),
  }
  dashboard.section.footer.val = {
    "Lembre-se: a prática leva à perfeição!",
    "Divirta-se programando com LunarVim 🚀",
  }
  require("alpha").setup(dashboard.opts)
else
  vim.notify("Erro ao carregar alpha.themes.dashboard", vim.log.levels.ERROR)
end
