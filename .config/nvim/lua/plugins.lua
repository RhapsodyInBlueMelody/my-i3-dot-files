-- lua/plugins.lua
vim.call('plug#begin', '~/.vim/plugged')

-- Core Plugins
vim.fn['plug#']('tpope/vim-fugitive')           -- Git integration
vim.fn['plug#']('tpope/vim-surround')           -- Surround operations
vim.fn['plug#']('tpope/vim-commentary')         -- Commenting
vim.fn['plug#']('airblade/vim-gitgutter')       -- Git gutter
vim.fn['plug#']('akinsho/bufferline.nvim')      -- Bufferline

-- Completion and LSP
vim.fn['plug#']('hrsh7th/nvim-cmp')             -- Completion framework
vim.fn['plug#']('hrsh7th/cmp-nvim-lsp')         -- LSP completion source
vim.fn['plug#']('hrsh7th/cmp-buffer')           -- Buffer completion
vim.fn['plug#']('hrsh7th/cmp-path')             -- Path completion
vim.fn['plug#']('L3MON4D3/LuaSnip')             -- Snippet engine
vim.fn['plug#']('saadparwaiz1/cmp_luasnip')     -- Luasnip completion source
vim.fn['plug#']('rafamadriz/friendly-snippets') -- Snippets-snippets
vim.fn['plug#']('jiangmiao/auto-pairs')         -- auto-pairs
vim.fn['plug#']('kylechui/nvim-surround')       -- surround

-- LSP
vim.fn['plug#']('onsails/lspkind.nvim')         -- Icons for completion menu
vim.fn['plug#']('neovim/nvim-lspconfig')        -- Native LSP configuration
vim.fn['plug#']('williamboman/mason.nvim')      -- LSP package manager
vim.fn['plug#']('williamboman/mason-lspconfig.nvim')

-- Telescope
vim.fn['plug#']('nvim-lua/plenary.nvim')        -- Telescope dependency
vim.fn['plug#']('nvim-telescope/telescope.nvim')

-- Treesitter
vim.fn['plug#']('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Themes
vim.fn['plug#']('mhinz/vim-startify')

-- Games
vim.fn['plug#']('ThePrimeagen/vim-be-good')

-- Optional: Plugins with configuration
vim.fn['plug#']('prettier/vim-prettier', {
    ['do'] = 'npm install',
    ['for'] = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'python', 'html'}
})

-- Finalize plugin installation
vim.call('plug#end')

-- Optional: Plugin-specific configurations can be added here
