return {{
	"LazyVim/LazyVim",
	import = "lazyvim.plugins"
	}, {
		"navarasu/onedark.nvim",
		config = function()
			require('onedark').setup {
				style = 'warmer',
				transparent = true,
				code_style = {
					comments = 'italic',
				}
			}
			require('onedark').load()
		end
	}, {
		"wakatime/vim-wakatime",
		lazy = false
	}, {
		'stevearc/dressing.nvim',
		opts = {},
	}, {
		"mattn/emmet-vim",
		lazy = true
	}, {
		"rcarriga/nvim-notify",
		opts = {
			stages = "slide"
		}
	}, {
		"itchyny/calendar.vim",
		lazy = false
	}, {
		"folke/which-key.nvim",
		opts = {
			preset = "modern"
		}
	}, {
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true
	}, {
		"nvim-telescope/telescope.nvim",
		requires = {"nvim-lua/plenary.nvim"},
		config = function()
			require("telescope").setup {
				defaults = {
					file_ignore_patterns = {"node_modules", ".git"}
				}
			}
		end
	}, {
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup()
		end
	}, {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
		  require("nvim-treesitter.configs").setup{
			highlight = { enable = true },
			ensure_installed = { "javascript", "lua", "python", "html", "css", "json", "yaml", "typescript", "tsx", "graphql", "bash", "vim", "cpp", "rust", "go", "java", "c"},
		  }
		end,
	}, {
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint,
			},
			})
		end,
	}, {
		"windwp/nvim-autopairs",
		opts = {
			check_ts = true, -- Treesitter integration
		},
	}, {
		"numToStr/Comment.nvim",
		config = function()
		  	require("Comment").setup()
		end,
	}, {
		"f-person/git-blame.nvim",
		lazy = true,
	}
}
