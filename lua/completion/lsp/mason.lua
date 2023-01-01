local servers = {
	"sumneko_lua",
  "clangd",
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

