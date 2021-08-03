local utils = require "utils"

utils.map("<C-d>", "v:lua.cpdt()", { expr = true })
function _G.cpdt()
	utils.exec "w"
	utils.exec "!cpdt %:p"
end
