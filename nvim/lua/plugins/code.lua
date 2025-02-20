return {
	-- {
	-- 	"williamboman/mason.nvim",
	-- },
	{
		"neovim/nvim-lspconfig",
	},
	{
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
}
