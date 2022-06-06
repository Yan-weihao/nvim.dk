local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("completion.lsp.lsp-installer")
require("completion.lsp.handlers").setup()
require "completion.lsp.lsp-signature"
-- require("user.lsp.null-ls")
-- require("user.lsp.lsp-utils")
