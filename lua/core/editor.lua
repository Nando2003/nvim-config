local api = vim.api
local opt = vim.opt
local g = vim.g

vim.g.mapleader = " "
local function set_mappings()
    local opts = {noremap = true, silent = true}
    local mapping = {
        -- Abrir o explorador de arquivos
        {"n", "<leader>pv", "<Cmd>Ex<CR>", opts},
        
        -- Salvar o arquivo
        {"n", "<leader>w", "<Cmd>w<CR>", opts},
        
        -- Sair do Vim
        {"n", "<leader>q", "<Cmd>q<CR>", opts},
        
        -- Salvar e sair
        {"n", "<leader>wq", "<Cmd>wq<CR>", opts},
        
        -- Desfazer e refazer
        {"n", "<leader>u", "<Cmd>undo<CR>", opts},
        {"n", "<leader>r", "<Cmd>redo<CR>", opts},
        
        -- Mover para a próxima e anterior aba
        {"n", "<leader>tn", "<Cmd>tabnext<CR>", opts},
        {"n", "<leader>tp", "<Cmd>tabprevious<CR>", opts},

        -- Abrir um terminal em uma nova aba
        {"n", "<leader>t", "<Cmd>tabnew | terminal<CR>", opts},
        
        -- Mover para o início e fim da linha
        {"n", "<leader>h", "^", opts},  -- Início da linha
        {"n", "<leader>l", "$", opts},  -- Fim da linha
        
        -- Navegação entre janelas (splits)
        {"n", "<C-h>", "<C-w>h", opts},  -- Mover para a janela da esquerda
        {"n", "<C-j>", "<C-w>j", opts},  -- Mover para a janela de baixo
        {"n", "<C-k>", "<C-w>k", opts},  -- Mover para a janela de cima
        {"n", "<C-l>", "<C-w>l", opts},  -- Mover para a janela da direita
        
        -- Aumentar e diminuir o tamanho da janela
        {"n", "<C-Up>", "<Cmd>resize -2<CR>", opts},    -- Aumentar janela
        {"n", "<C-Down>", "<Cmd>resize +2<CR>", opts},  -- Diminuir janela
        {"n", "<C-Left>", "<Cmd>vertical resize -2<CR>", opts},  -- Aumentar largura da janela
        {"n", "<C-Right>", "<Cmd>vertical resize +2<CR>", opts}, -- Diminuir largura da janela

        -- Comentários (usando a funcionalidade de comentários)
        {"n", "<leader>/", "<Cmd>CommentToggle<CR>", opts},  -- Alternar comentários

        -- Navegação pelo histórico de pesquisa
        {"n", "<C-n>", "<Cmd>cnext<CR>", opts},  -- Próximo resultado da pesquisa
        {"n", "<C-p>", "<Cmd>cprev<CR>", opts},  -- Resultado anterior da pesquisa
                
        -- Ctrl + Z
        {"i", "<C-z>", "<Esc>:undo<CR>", opts},
        
        -- Ctrl + C
        {"v", "<C-c>", [["+yy]], opts},

        {"v", "<Tab>", ">gv", opts},
        {"v", "<S-Tab>", "<gv", opts},
    }

    for _, val in pairs(mapping) do
        api.nvim_set_keymap(unpack(val))
    end
end

local function set_options()
    local options = {
        ruler = true,
        number = true,
        relativenumber = true,

        foldmethod = "indent",
        foldlevel = 20,

        encoding = "utf-8",
        fileencoding = "utf-8",
        fileencodings = "utf-8",
        -- termencoding = "utf-8",

        backspace = "indent,eol,start",
        smartindent = true,

        tabstop = 4,
        shiftwidth = 4,
        expandtab = true,
        smarttab = true,
        softtabstop = 4,

        hidden = true,
        hlsearch = true,
        incsearch = true,
        ignorecase = true,
        smartcase = true,

        shell = 'pwsh', 
        shellcmdflag = '-nologo -noprofile -ExecutionPolicy RemoteSigned -command',       
        shellxquote = '', 
        history = 1000,

        -- colorcolumn = "80,88,120",
        -- termguicolors = true,
        wildignore = "*/tmp/*,*.so,*swp,*.zip,*pyc",
        autoread = true,
        updatetime=300,
        
        cursorline = true,
        wrap = false,
        swapfile = false,

    }

    for k, v in pairs(options) do
        opt[k] = v
    end

    vim.cmd(
    [[
    cnoreabbrev W w
    cnoreabbrev W! w!
    cnoreabbrev Q q
    cnoreabbrev Q! q!
    cnoreabbrev Qa qa
    cnoreabbrev Qa! qa!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev WQ wq
    cnoreabbrev Wqa wqa
    ]]
    )
    
end

set_options()
set_mappings()
