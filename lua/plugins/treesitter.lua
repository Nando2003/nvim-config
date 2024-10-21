return {
    {
    "nvim-treesitter/nvim-treesitter",
    version = false, 
    build = ":TSUpdate",
    event = { "LazyFile", "VeryLazy" },
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { 
          "css",
          "dockerfile",
          "elm",
          "fish",
          "gitcommit",
          "html",
          "http",
          "javascript",
          "json",
          "lua",
          "python",
          "regex",
          "rust",
          "scss",
          "toml",
          "yaml",
          "svelte",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end   
    }
}
