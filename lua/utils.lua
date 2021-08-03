local M = {}

--- Autocommands
function M.genautocmd(type, filters, cmd)
	return "autocmd " .. type .. " " .. table.concat(filters, ",") .. " " .. cmd
end

function M.augroup(name, autocmds)
	M.exec(string.format([[
	augroup %s
	autocmd!
	%s
	augroup END
	]], name, table.concat(autocmds, "\n")))
end

--- Map keys
local function mapkey(keys, cmd, mode, opts) -- Maps a key sequence to a command
	vim.api.nvim_set_keymap(mode, keys, cmd, opts)
end

function M.map(keys, cmd, opts)              -- The equivilent of ":map"
	mapkey(keys, cmd, "", opts)
end

function M.imap(keys, cmd, opts)             -- The equivilent of ":imap"
	mapkey(keys, cmd, "i", opts)
end

function M.nmap(keys, cmd, opts)             -- The equivilent of ":nmap"
	mapkey(keys, cmd, "n", opts)
end

--- Execute code
function M.exec(cmd)                         -- Executes a command
    vim.cmd(cmd)
end

function M.eval(expr)                        -- Evaluates an expression
	return vim.fn.eval(expr)
end

return M
