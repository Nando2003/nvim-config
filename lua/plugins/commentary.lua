-- ~/.config/nvim/lua/plugins/commentary.lua

local api = vim.api

-- Configurando o vim-commentary
return {
    'tpope/vim-commentary',
    config = function()
        -- Mapeie Ctrl+/ para comentar/descomentar
        api.nvim_set_keymap('n', '<C-_>', '<Plug>CommentaryLine', { noremap = true, silent = true })
        api.nvim_set_keymap('v', '<C-_>', '<Plug>Commentary', { noremap = true, silent = true })
    end
}
