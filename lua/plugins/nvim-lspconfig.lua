local lspinstall = require "lspinstall"
local lspconfig = require "lspconfig"

--- Install servers
lspinstall.setup()

local function isinstalled(value)
	for _, v in pairs(lspinstall.installed_servers()) do
		if v == value then
			return true
		end
	end
	return false
end

local servers = { "clojure", "java" }
for _, server in pairs(servers) do
	if not isinstalled(server) then
		lspinstall.install_server(server)
	end
end

local settings = {
	jdtls = {
		cmd = { "jdtls" },
		root_dir = function(fname)
			return lspconfig.utils.root_pattern("pom.xml", "gradle.build", ".git")(fname) or vim.fn.getcwd()
		end,
		capabilities = capabilities
	}
}

--- Setup installed servers
local function setupservers()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = { properties = { "documentation", "detail", "additionalTextEdits" } }
	for _, server in pairs(lspinstall.installed_servers()) do
		if settings[server] then
			lspconfig[server].setup(settings[server])
		else
			lspconfig[server].setup { capabilities = capabilities }
		end
	end
end

setupservers()

lspinstall.post_install_hook = function()
	setupservers()
	require("utils").exec "bufdo e"
end
