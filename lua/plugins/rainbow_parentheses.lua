local utils = require "utils"

vim.g["rainbow#pairs"] = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
vim.g["rainbow#max_level"] = 100

utils.augroup("rainbow_parens", {
	utils.genautocmd("FileType", { "java" }, "let g:rainbow#pairs = [['{', '}']] | :RainbowParentheses"),
	utils.genautocmd("FileType", { "clojure", "lisp", "hy" }, "RainbowParentheses")
})
