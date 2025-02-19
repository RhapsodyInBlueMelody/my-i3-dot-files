-- Mouse Off
vim.o.mouse = ""

-- clipboard
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"

-- Vim Compatibility
vim.opt.compatible = false

-- Shell
vim.opt.shell = "/bin/zsh"

-- Cursor Shapes
vim.opt.guicursor = {
    "n-v-c:block",
    "i:ver25",
    "n:blinkwait25"
}

-- Undo Persistence
local undo_dir = vim.fn.expand("~/.vim/undo")
if vim.fn.isdirectory(undo_dir) == 0 then
    vim.fn.mkdir(undo_dir, "p")
end

vim.opt.undofile = true
vim.opt.undodir = undo_dir
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Context (if you have a Neovim plugin for this)
vim.g.context_enabled = 1
vim.g.context_max_height = 10
vim.g.context_add_mappings = 1

-- Indentation
vim.opt.smartindent = true

-- Text Wrapping
vim.opt.wrap = true

-- Encoding
vim.opt.encoding = "utf-8"

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Status Bar
vim.opt.laststatus = 2

-- Matching
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- File Path Completion
vim.opt.completeopt = { "menuone", "noselect", "preview" }
vim.opt.wildmode = { "longest", "list:full" }
vim.opt.wildmenu = true
vim.opt.path:append("**")
vim.opt.wildignorecase = true

-- Completion Options
vim.opt.complete = { ".", "w", "b", "u", "t", "i", "k" }

-- Highlight Completion Menu
vim.cmd([[
    highlight Pmenu ctermbg=gray guibg=gray
    highlight PmenuSel ctermbg=blue guibg=blue
]])

-- Clang Format Configuration
vim.g.clang_format_detect_style_file = 1
vim.g.clang_format_auto_format = 0
vim.g.clang_format_auto_format_on_insert_leave = 0

vim.g.clang_format_style_options = {
    BasedOnStyle = "Google",
    IndentWidth = 4,
    ColumnLimit = 100,
    AllowShortIfStatementsOnASingleLine = "false",
    BreakBeforeBraces = "Attach",
    SpaceBeforeParens = "ControlStatements",
    Standard = "C++11",
    AlignConsecutiveAssignments = "false",
    AlignOperands = "true",
    SpaceInEmptyParentheses = "false"
}

-- Clang Format Conditional Auto-format
vim.api.nvim_create_augroup("ClangFormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "ClangFormatOnSave",
    pattern = { "*.cpp", "*.c", "*.h", "*.hpp" },
    callback = function()
        local clang_format_file = vim.fn.findfile(".clang-format", ".;")
        if clang_format_file ~= "" then
            vim.cmd("ClangFormat")
        end
    end
})

-- Enhanced Text Rendering
vim.opt.list = true
vim.opt.listchars = {
    tab = '»\\ ',
    trail = '·',
    extends = '→',
    precedes = '←'
}
vim.opt.conceallevel = 2
vim.opt.colorcolumn = "80"

-- Color Column Highlight
vim.cmd([[
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
]])

-- Soft Wrapping with Visual Indicators
vim.opt.showbreak = "↪\\ "

-- Improved Syntax Highlighting
vim.cmd("syntax enable")
vim.opt.synmaxcol = 300

-- Folding Improvements
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

-- Indentation (Google Style)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Better Split Separators
vim.opt.fillchars:append("vert:│")

-- Line Wrapping
vim.opt.textwidth = 80
vim.opt.formatoptions:append("t")

require('bufferline').setup {
    options = {
        mode = "buffers",
        numbers = "both",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        color_icons = true,
    }
}


-- Optional: If you want to keep the file type highlighting logic
-- Note: This would typically be handled by a plugin in Neovim
local function setup_file_highlights()
    local highlights = {
        { ext = 'py',   fg = 'green',  guifg = '#00ee00' },
        { ext = 'c',    fg = 'blue',   guifg = '#00FFFF' },
        { ext = 'cpp',  fg = 'cyan',   guifg = '#3de1c9' },
        { ext = 'rs',   fg = 'red',    guifg = '#ff0000' },
        { ext = 'js',   fg = 'yellow', guifg = '#ffd000' },
        { ext = 'php',  fg = 'magenta',guifg = '#bc00ca' },
        { ext = 'html', fg = 'green',  guifg = '#00ee00' },
        { ext = 'css',  fg = 'blue',   guifg = '#00FFFF' },
        { ext = 'json', fg = 'cyan',   guifg = '#3de1c9' },
        { ext = 'md',   fg = 'white',  guifg = '#ffffff' },
        { ext = 'vim',  fg = 'green',  guifg = '#00ee00' },
        { ext = 'asm',  fg = 'red',    guifg = '#ff0000' }
    }

    for _, highlight in ipairs(highlights) do
        vim.cmd(string.format(
            "highlight def link %sColor %s", 
            highlight.ext, 
            highlight.fg
        ))
    end
end

-- Uncomment and call if you want to use this
-- setup_file_highlights()
