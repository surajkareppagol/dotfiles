-- MASON-LSPCONFIG

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"autotools_ls",
		"clangd",
		"cssls",
		"jqls",
		"marksman",
		"denols",
		"pyright",
	},
})

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
})

-- INSTALL WITH MASON: stylua black clang-format htmlbeautifier isort

-- COMPLETION

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["clangd"].setup({
	capabilities = capabilities,
})

require("lspconfig")["luals"].setup({
	capabilities = capabilities,
})

require("lspconfig")["rust_analyzer"].setup({
	capabilities = capabilities,
})

require("lspconfig")["cssls"].setup({
	capabilities = capabilities,
})

require("lspconfig")["marksman"].setup({
	capabilities = capabilities,
})

require("lspconfig")["autotools-ls"].setup({
	capabilities = capabilities,
})

-- TREE SITTER

local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { "c", "css", "cpp", "nix", "lua", "vim", "vimdoc", "query", "regex", "bash", "html" },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
