-- Extras configurations for LunarVim

-- Set relative line numbers
vim.opt.relativenumber = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable line wrapping
vim.opt.wrap = true

-- Set color scheme
vim.cmd("colorscheme github_dark_colorblind")

-- Enable auto-completion
vim.opt.completeopt = "menuone,noselect"

-- Enable line numbers
vim.opt.number = true

-- Enable cursor line
vim.opt.cursorline = true

-- Set split window behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable persistent undo
vim.opt.undofile = true

-- Set timeout for mapped sequences
vim.opt.timeoutlen = 500

-- Enable hidden buffers
vim.opt.hidden = true

-- Set updatetime for CursorHold event
vim.opt.updatetime = 300

-- Enable folding based on syntax
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99

-- Configuração do terminal integrado
require("toggleterm").setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal', -- Alternar para 'vertical' ou 'float', se preferir
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  })

