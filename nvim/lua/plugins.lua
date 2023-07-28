require("lazy").setup({
    ------------------------------------------------
    ------------------------------------------------
    "ggandor/lightspeed.nvim",
    ------------------------------------------------
    ------------------------------------------------
    "airblade/vim-rooter",
    -------------------------------------------------
    -------------------------------------------------
    -- the colorscheme should be available when starting Neovim
    {
        "shaunsingh/nord.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[colorscheme torte]])
        end,
    },
    -------------------------------------------------
    -------------------------------------------------
    -- lsp releated i.e. used in development
    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        lazy = false,
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
            "windwp/nvim-autopairs",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            require("config/cmp")
        end,
    },
    ------------------------------------------------
    ------------------------------------------------
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require("config/lsp")
        end,
    },
    ------------------------------------------------
    ------------------------------------------------
    {"jose-elias-alvarez/null-ls.nvim",
},
    ------------------------------------------------
    ------------------------------------------------

    -- NERD TREE --
    -- nerd tree setup and keymaps
    {
        "preservim/nerdtree",
        lazy = true,
        keys = {
            { "<space>o", "<cmd>NERDTree<cr>",       desc = "Nerd Tree Open" },
            { "<space>k", "<cmd>NERDTreeClose<cr>",  desc = "Nerd Tree Close" },
            { "<space>t", "<cmd>NERDTreeToggle<cr>", desc = "Nerd Tree Toggle" },
            { "<space>s", "<cmd>NERDTreeFind<cr>",   desc = "Nerd Tree Find" },
            { "<space>f", "<cmd>NERDTreeFocus<cr>",  desc = "Nerd Tree Focus" },
            { "<space>m", "<cmd>NERDTreeMirror<cr>", desc = "Nerd Tree Mirrion to new tab" },
        },
        config = function()
            vim.g.NERDTreeWinPos = "right"
        end,
    },
    ------------------------------------------------
    ------------------------------------------------

    {
        "windwp/nvim-autopairs",
        lazy = true,
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    ------------------------------------------------
    ------------------------------------------------
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup()
        end,
    },
    ------------------------------------------------
    ------------------------------------------------
    "nvim-lua/plenary.nvim",
    -------------------------------------------------
    -------------------------------------------------
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("config.mason")
        end,
    },
    -------------------------------------------------
    -------------------------------------------------
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = false,
        config = function()
            require("config.nullls")
        end,
    },
    -------------------------------------------------
    -------------------------------------------------
    {
        "akinsho/toggleterm.nvim",
        lazy = false,
        tag = "*",
        config = function()
            require("config.toggleterm")
        end,
    },
    ------------------------------------------------
    ------------------------------------------------
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<C-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
            { "<C-g>", "<cmd>lua require('telescope.builtin').git_files()<cr>",  desc = "Find git files" },
            { "<C-i>", "<cmd>lua require('telescope.builtin').live_grep()<cr>",  desc = "Live grep" },
            -- { "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>",    desc = "List buffers" },
            {
                "<C-s>",
                "<cmd>lua require('telescope.builtin').grep_string()<cr>",
                desc = "Grep string under the cursor",
            },
            {
                "<C-d>",
                "<cmd>lua require('telescope.builtin').diagnostics({bufnr = 0})<cr>",
                desc = "View diagnostics",
            },
            {
                "<C-c>",
                "<cmd>lua require('telescope.builtin').default_mappings.actions.close()<cr>",
                desc = "View diagnostics",
            },
            --     {"jk", "<esc>"}
        },
    },
    ------------------------------------------------
    ------------------------------------------------
    {
        "glepnir/flybuf.nvim",
        cmd = "FlyBuf",
        keys = {
            { "<C-b>", "<cmd>FlyBuf<cr>", desc = "List buffers" },
        },
        config = function()
            require("flybuf").setup({})
        end,
    },
    ------------------------------------------------
    ------------------------------------------------
    {
        "junegunn/fzf.vim",
        lazy = true,
        dependencies = { "junegunn/fzf", run = ":call fzf#install()" },
    },
    ------------------------------------------------
    ------------------------------------------------
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup({ options = { theme = "nord" } })
        end,
    },
    ------------------------------------------------
    ------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_install = "all",
                auto_install = true,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = false,
                },
                additional_vim_regex_highlighting = false,
            })
        end,
    },
    ------------------------------------------------
    ------------------------------------------------
    {
        "https://codeberg.org/esensar/nvim-dev-container",
        config = function()
            require("devcontainer").setup({})
        end,
    },
    ------------------------------------------------
    ------------------------------------------------
    {'tpope/vim-fugitive'}
})
