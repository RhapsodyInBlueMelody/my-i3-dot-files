-- lua/mappings.lua

-- Disable arrow keys function
local function disable_arrow_keys()
    local modes = {'', 'i'}
    local keys = {'<Up>', '<Down>', '<Left>', '<Right>'}
    
    for _, mode in ipairs(modes) do
        for _, key in ipairs(keys) do
            vim.api.nvim_set_keymap(mode, key, '<Nop>', { noremap = true, silent = true })
        end
    end
end

-- Movement in insert mode
local function insert_mode_movement()
    local movements = {
        ['<C-h>'] = '<Left>',
        ['<C-j>'] = '<Down>',
        ['<C-k>'] = '<Up>',
        ['<C-l>'] = '<Right>'
    }
    
    for key, action in pairs(movements) do
        vim.api.nvim_set_keymap('i', key, action, { noremap = true, silent = true })
    end
end

local function auto_brackets()
    local brackets = {
        ['('] = '()',
        ['{'] = '{}',
        ['['] = '[]',
        ["'"] = "''",
        ['"'] = '""'
    }
    for open_bracket, bracket_pair in pairs(brackets) do
        vim.api.nvim_set_keymap('i', open_bracket, bracket_pair .. '<Left>', { noremap = true, silent = true })
    end
end


-- Quick actions
local function quick_actions()
    local actions = {
        ['<leader>w'] = ':w<CR>',
        ['<leader>q'] = ':q!<CR>',
        ['<leader>x'] = ':x<CR>'
    }
    for key, action in pairs(actions) do
        vim.api.nvim_set_keymap('n', key, action, { noremap = true, silent = true })
    end
end

-- Telescope mappings
local function telescope_mappings()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
end

-- Window management
local function window_management()
    local windows = {
        ['<leader>s'] = ':split<CR>',
        ['<leader>v'] = ':vsplit<CR>'
    }

    for key, action in pairs(windows) do
        vim.api.nvim_set_keymap('n', key, action, { noremap = true, silent = true })
    end
end


-- Commentary
local function commenting_mappings()
    vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true }) -- Ctrl + /
    vim.api.nvim_set_keymap('v', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true }) -- Ctrl + /
end


-- Enhanced Buffer and Tab Navigation
local function enhanced_buffer_tab_navigation()
    local navigations = {
        ['<S-l>'] = ':bnext<CR>',
        ['<S-h>'] = ':bprevious<CR>',
        ['<leader>bn'] = ':enew<CR>',
        ['<leader>bd'] = ':bdelete<CR>',
        ['<leader>bD'] = ':bdelete!<CR>',
        ['<leader>ba'] = ':%bdelete<CR>',
        ['<leader>bl'] = ':buffers<CR>',
        ['<leader>bs'] = ':buffer<Space>',
        ['<leader>b'] = ':ls<CR>:buffer<Space>',

        -- Tab Navigation
        ['<leader>tn'] = ':tabnew<CR>',      -- New tab
        ['<leader>tc'] = ':tabclose<CR>',    -- Close current tab
        ['<leader>to'] = ':tabonly<CR>',     -- Close all other tabs
        ['<leader>tl'] = ':tabs<CR>',        -- List tabs
        ['<leader>t.'] = ':tabnext<CR>',     -- Next tab
        ['<leader>t,'] = ':tabprevious<CR>', -- Previous tab

        -- Quick tab switching
        ['<leader>1'] = '1gt',
        ['<leader>2'] = '2gt',
        ['<leader>3'] = '3gt',
        ['<leader>4'] = '4gt',
        ['<leader>5'] = '5gt',
        ['<leader>6'] = '6gt',
        ['<leader>7'] = '7gt',
        ['<leader>8'] = '8gt',
        ['<leader>9'] = '9gt',
    }

    for key, action in pairs(navigations) do
        vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLinePick<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>bc', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', key, action, { noremap = true, silent = true })
    end
end





-- Completion mappings (if using nvim-cmp)
local function completion_mappings()
    -- These can be customized based on your completion setup
    vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, expr = true, silent = true })
end

-- Main setup function
local function setup()
    -- Set leader key
    vim.g.mapleader = ' '

    -- Call individual mapping functions
    disable_arrow_keys()
    insert_mode_movement()
    quick_actions()
    window_management()
    auto_brackets()
    commenting_mappings()
    enhanced_buffer_tab_navigation()

    -- Conditional mappings (check if module exists)
    pcall(telescope_mappings)
    pcall(completion_mappings)
end

-- Execute setup
setup()

-- Return the module for potential external use
return {
    setup = setup
}
