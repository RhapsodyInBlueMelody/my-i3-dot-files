local M = {}

M.setup_statusline = function()
    local function get_git_branch()
        local branch = vim.fn.FugitiveHead()
        return branch ~= '' and ' ' .. branch or ''
    end

    local function get_file_type()
        local ft = vim.bo.filetype
        return ft ~= '' and ' ' .. ft or ''
    end

    local function lsp_progress()
        local clients = vim.lsp.get_active_clients()
        if #clients > 0 then
            return ' LSP:' .. #clients
        end
        return ''
    end

    function _G.tron_statusline()
        local mode_map = {
            n = 'NORMAL',
            i = 'INSERT',
            v = 'VISUAL',
            [''] = 'V-BLOCK',
            V = 'V-LINE',
            c = 'COMMAND',
            R = 'REPLACE',
            t = 'TERMINAL'
        }

        local mode = mode_map[vim.fn.mode()] or 'UNKNOWN'
        local filename = vim.fn.expand('%:t') ~= '' and vim.fn.expand('%:t') or '[No Name]'
        
        local left = string.format(" %s │ %s", mode, filename)
        local right = string.format("%s%s │ %s ", 
            get_git_branch(), 
            get_file_type(), 
            lsp_progress()
        )

        return string.format("%s%%=%%#Search#%s", left, right)
    end

    vim.o.statusline = "%{%v:lua.tron_statusline()%}"
    
    -- Statusline colors
    vim.cmd([[
        highlight StatusLine guifg=#3de1c9 guibg=NONE
        highlight StatusLineNC guifg=#008b8b guibg=NONE
    ]])
end

M.setup = function()
    vim.opt.background = "dark"

    -- Tron Legacy Color Palette
    local colors = {
        bg = "NONE",
        fg = "#00a595",
        cyan = "#3de1c9",
        blue = "#0081ff",
        green = "#00ee00",
        yellow = "#ffcf00",
        magenta = "#bc00ca",
        red = "#ff0000",
        gray = "#545454",
        dark_gray = "#1a1a1a",
        completion_bg = "#000000",
        completion_icon = "#FFA500",
        completion_text = "#3de1c9"
    }

    -- Highlight Groups
    local highlights = {
        -- Basic Syntax Highlights
        Normal = { fg = colors.fg, bg = colors.bg },
        Comment = { fg = "#008b8b", bg = colors.bg, italic = true },
        Constant = { fg = colors.yellow, bg = colors.bg },
        String = { fg = colors.green, bg = colors.bg },
        Identifier = { fg = colors.blue, bg = colors.bg },
        Statement = { fg = colors.magenta, bg = colors.bg },
        PreProc = { fg = "#ff00ff", bg = colors.bg },
        Type = { fg = "#0000ff", bg = colors.bg },
        Special = { fg = colors.red, bg = colors.bg },
        Function = { fg = "#00a48c", bg = colors.bg },
        
        -- Line and Cursor Highlights
        LineNr = { fg = colors.gray, bg = colors.bg },
        CursorLineNr = { fg = colors.fg, bg = colors.bg },
        CursorLine = { bg = colors.dark_gray },
        
        -- Selection and Search
        Visual = { bg = "#00a48c", fg = colors.bg },
        Search = { fg = "#000000", bg = colors.yellow },
        IncSearch = { fg = "#000000", bg = "#00cdcd" },
        
        -- Error and Warning
        Error = { fg = colors.red, bg = colors.bg },
        ErrorMsg = { fg = colors.red, bg = colors.bg },
        WarningMsg = { fg = colors.yellow, bg = colors.bg },
        
        -- Diff Highlights
        DiffAdd = { fg = colors.green, bg = colors.bg },
        DiffChange = { fg = colors.blue, bg = colors.bg },
        DiffDelete = { fg = colors.red, bg = colors.bg },
        
        -- Split and Menu
        VertSplit = { fg = colors.fg, bg = colors.bg },
        
        -- Completion Menu
        Pmenu = { 
            bg = colors.completion_bg, 
            fg = colors.completion_text 
        },
        PmenuSel = { 
            bg = "#00a48c", 
            fg = colors.completion_bg 
        },
        PmenuSbar = { 
            bg = colors.completion_bg 
        },
        PmenuThumb = { 
            bg = colors.cyan 
        }
    }

    -- Apply Highlights
    local function set_highlight(name, opts)
        vim.api.nvim_set_hl(0, name, opts)
    end

    -- Apply basic highlights
    for group, style in pairs(highlights) do
        set_highlight(group, style)
    end

    -- Floating Window and Border Highlights
    set_highlight('NormalFloat', { bg = 'None', fg = colors.cyan })
    set_highlight('FloatBorder', { bg = 'None', fg = colors.cyan })
    
    -- Telescope Highlights
    set_highlight('TelescopeNormal', { bg = 'None', fg = colors.cyan })
    set_highlight('TelescopeBorder', { bg = 'None', fg = colors.cyan })

    -- Completion Item Highlights
    set_highlight('CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
    set_highlight('CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
    set_highlight('CmpItemAbbrMatchFuzzy', { bg = 'NONE', fg = '#569CD6' })
    
    -- Completion Kind Highlights
    set_highlight('CmpItemKindFunction', { bg = 'NONE', fg = colors.completion_icon })
    set_highlight('CmpItemKindMethod', { bg = 'NONE', fg = colors.completion_icon })
    set_highlight('CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
    set_highlight('CmpItemKindClass', { bg = 'NONE', fg = colors.completion_icon })

    -- Diagnostic Highlights
    set_highlight('DiagnosticVirtualTextError', { fg = colors.red, bold = true })
    set_highlight('DiagnosticVirtualTextWarn', { fg = colors.yellow })
    set_highlight('DiagnosticVirtualTextInfo', { fg = colors.blue })
    set_highlight('DiagnosticVirtualTextHint', { fg = colors.fg })

    -- Additional Vim Command Highlights
    vim.cmd([[
        highlight Pmenu guibg=#000000 guifg=#3de1c9
        highlight PmenuSel guibg=#3de1c9 guifg=#000000
        highlight FloatBorder guifg=#3de1c9 guibg=NONE
        highlight SpecialComment guifg=#3de1c9 guibg=NONE
        highlight StatusLine guibg=None
        highlight StatusLineNC guibg=None
    ]])

    return colors  -- Return colors for potential later use
end

-- Add a function to set up colors after plugins are loaded
M.load_colors = function()
    M.setup()
    M.setup_statusline()
end

return M
