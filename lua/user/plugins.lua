--------------------------------------------------------------------------------
-- lua/user/plugins.lua
-- Declaração e configuração básica de plugins adicionais
--------------------------------------------------------------------------------

lvim.plugins = {
    -- Tema "github-nvim-theme" com variação colorblind
    { "projekt0n/github-nvim-theme" },

    -- Suporte avançado a TypeScript
    { "jose-elias-alvarez/typescript.nvim" },

    -- Autopairs para completar pares de parênteses, colchetes, aspas, etc.
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
    },

    -- Plugin para realçar e gerenciar comentários com TODO, FIX, etc.
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup {}
      end,
    },

    -- Telescope (ferramenta de busca e navegação)
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.0",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        local telescope = require("telescope")
        telescope.setup({
          defaults = {
            mappings = {
              i = {
                ["<CR>"] = function(prompt_bufnr)
                  local actions = require("telescope.actions")
                  local state = require("telescope.actions.state")
                  local selection = state.get_selected_entry()
                  if selection then
                    vim.cmd("echo 'Abrindo: " .. selection.value .. "'")
                  end
                  actions.select_default(prompt_bufnr)
                end,
                ["<Up>"] = function(prompt_bufnr)
                  local actions = require("telescope.actions")
                  local state = require("telescope.actions.state")
                  actions.move_selection_previous(prompt_bufnr)
                  local selection = state.get_selected_entry()
                  if selection then
                    vim.cmd("echo 'Selecionado: " .. selection.value .. "'")
                  end
                end,
                ["<Down>"] = function(prompt_bufnr)
                  local actions = require("telescope.actions")
                  local state = require("telescope.actions.state")
                  actions.move_selection_next(prompt_bufnr)
                  local selection = state.get_selected_entry()
                  if selection then
                    vim.cmd("echo 'Selecionado: " .. selection.value .. "'")
                  end
                end,
              },
            },
          },
        })
      end,
    },

    -- GitHub Copilot
    {
      "zbirenbaum/copilot.lua",
      event = { "VimEnter" },
      config = function()
        vim.defer_fn(function()
          require("copilot").setup({
            suggestion = {
              enabled = true,
              auto_trigger = true,
              keymap = {
                accept = "<C-J>",
                next = "<C-]>",
                prev = "<C-[>",
                dismiss = "<C-\\>",
              },
            },
            panel = { enabled = false },
          })
        end, 100)
      end,
    },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = { "zbirenbaum/copilot.lua" },
      config = function()
        require("copilot_cmp").setup()
      end,
    },

    -- Prettier (formatação)
    {
      "prettier/vim-prettier",
      build = "yarn install --frozen-lockfile --production",
      ft = {
        "javascript",
        "typescript",
        "css",
        "less",
        "scss",
        "json",
        "graphql",
        "markdown",
        "vue",
        "svelte",
        "yaml",
        "html",
      },
    },

    -- Null-ls (linters/formatters)
    {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
          sources = {
            null_ls.builtins.formatting.prettier.with({
              filetypes = {
                "html",
                "css",
                "javascript",
                "typescript",
                "json",
                "markdown",
              },
            }),
            null_ls.builtins.formatting.prettier,
          },
        })
      end,
    },
  }
