--------------------------------------------------------------------------------
-- lua/user/plugins.lua
-- Plugins e ajustes de cada plugin
--------------------------------------------------------------------------------

lvim.plugins = {
  { "projekt0n/github-nvim-theme" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "windwp/nvim-autopairs", event = "InsertEnter" },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup{
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = 'curved',
          winblend = 3,
        }
      }
    end,
  },
  { "folke/todo-comments.nvim", event = "BufRead" },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.0",
    dependencies = { { "nvim-lua/plenary.nvim" } },
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
  {
    "prettier/vim-prettier",
    build = "yarn install --frozen-lockfile --production",
    ft = {
      "javascript",
      "typescript",
      "typescriptreact",
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
        },
      })
    end,
  },
}
