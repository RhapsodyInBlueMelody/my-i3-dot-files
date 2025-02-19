local function get_time_based_greeting()
    local hour = tonumber(os.date("%H"))
    if hour < 6 then
        return "🌙 Late Night Hacker"
    elseif hour < 12 then
        return "☀️ Morning Warrior"
    elseif hour < 18 then
        return "🌞 Afternoon Coder"
    else
        return "🌇 Evening Developer"
    end
end

local function center_ascii(lines)
    local width = vim.o.columns
    local centered_lines = {}
    for _, line in ipairs(lines) do
        local margin = math.floor((width - #line) / 2)
        margin = math.max(margin, 0)
        table.insert(centered_lines, string.rep(" ", margin) .. line)
    end

    return centered_lines
end

local ascii_art = {
    '	⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷',
    '	⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇',
    '	⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽',
    '	⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕',
    '	⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕',
    '	⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕',
    '	⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄',
    '	⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕',
    '	⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿',
    '	⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '	⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟',
    '	⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠',
    '	⡝⡵⡈⢟⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⣿⠿⠋⣀⣈',
    '	⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪',
    '',
    '   ' .. get_time_based_greeting() .. ', ' .. os.getenv("USER") .. '!',
    '   Current Time: ' .. os.date("%Y-%m-%d %H:%M:%S"),
    '',
    '   Neovim - Your Coding Sanctuary',
}

vim.g.startify_custom_header = center_ascii(ascii_art)

vim.g.startify_lists = {
    { type = 'files', header = { '   Recent Files' } },
    { type = 'dir', header = { '   Recent Files in ' .. vim.fn.getcwd() } },
    { type = 'sessions', header = { '   Sessions' } },
    { type = 'bookmarks', header = { '   Bookmarks' } },
}

vim.g.startify_bookmarks = {
    { c = '~/.config/nvim/init.lua' },
    { z = '~/.bashrc' }
}
