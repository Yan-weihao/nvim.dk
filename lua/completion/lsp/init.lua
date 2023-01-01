local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "completion.lsp.mason"
require("completion.lsp.mason-installer")
require("completion.lsp.handlers").setup()
require "completion.lsp.lsp-signature"
require "completion.lsp.lspconfig"
require "completion.lsp.settings.lua-language-server"
-- require("user.lsp.null-ls")
-- require("user.lsp.lsp-utils")
