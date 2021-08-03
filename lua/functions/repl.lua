local utils = require "utils"

--[[
Commands:
haxe:       npm install haxe-repl
dart:       (none)
java:       (installed)
kotlin:     (installed)
scala:      (installed)
groovy:     (insatlled)
clojure:    sudo apt install leiningen
lisp:       (installed)
hy:         (installed)
python:     (preinstalled)
r:          (installed)
julia:      (installed)
nim:        (installed)
c:          (none)
cpp:        wget https://root.cern.ch/download/cling//cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
            tar -xf cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
            export PATH=$PATH:(/path/to/cling_2020-11-05_ROOT-ubuntu2004)/bin
cs:         (installed)
d:          sudo apt-get update -y
            sudo apt-get install -y dub
rust:       rustup toolchain add nightly
            cargo +nightly install papyrus
go:         go install -i https://github.com/sbinet/igo
            sudo mv (/path/to/$GOROOT)/bin/igo /usr/bin
fortran:    gem install frepl (requires Ruby)
pascal:     (none)
haskell:    (installed)
ocaml:      (installed)
lua:        (insatlled)
dosbatch:   (installed for WSL)
powershell: (installed for WSL)
sh:         (preinstalled)
perl:       (preinstalled)
lua:        (installed)
php:        (installed)
javascript: (installed)
typescript: (installed)
coffee:     (installed)
ruby:       (installed)
crystal:    git clone https://github.com/crystal-community/icr.git
            cd icr
            make (requires Make)
            sudo make install (requires Make)
elixir:     (installed)
erlang:     (installed)
st:         (preinstalled)
nasm:       sudo apt install libedit-dev
            git clone https://github.com/yrp604/rappel.git
            cd rappel
            CC=clang make (requires Clang)
            sudo mv bin/rappel /usr/bin
html:       (none)
--]]
local commands = {
	haxe       = "npx haxe-repl",
--dart       = "", 
	java       = "jshell",
	kotlin     = "kotlin",
	scala      = "scala",
	groovy     = "groovysh",
	clojure    = "lein repl",
	lisp       = "clisp",
	hy         = "hy",
	python     = "python3",
	r          = "R",
	julia      = "julia",
	nim        = "nim secret",
--c          = "", 
	cpp        = "cling",
	cs         = "csharp",
	d          = "dub run drepl",
	rust       = "papyrus",
	go         = "igo",
	fortran    = "frepl",
--pascal     = "", 
	haskell    = "ghci",
	ocaml      = "ocaml",
	lua        = "lua",
	dosbatch   = "cmd.exe",
	powershell = "powershell.exe",
	sh         = "bash",
	perl       = "perl -de1",
	php        = "php -a",
	javascript = "node",
	typescript = "ts-node",
	coffee     = "npx coffee",
	ruby       = "irb",
	crystal    = "icr",
	elixir     = "iex",
	erlang     = "erl",
	st         = "gst",
	nasm       = "rappel",
--html       = ""
}

local bufferpairs = {}

utils.augroup("repl", {
	utils.genautocmd("BufUnload", { "*" }, "call v:lua.stoprepl(expand('<abuf>'))"),
	utils.genautocmd("BufWinEnter", { "*" }, "call v:lua.startrepl()")
})

function _G.startrepl()
	local command = commands[vim.o.filetype]
	if command then
		local codenr = vim.fn.bufnr('%')
		utils.exec("belowright " .. (vim.o.lines / 4) .. " new")
		bufferpairs[codenr] = vim.fn.bufnr('%')
		utils.exec("term " .. command)
		utils.exec "wincmd p"
	end
end
function _G.stoprepl(bufnr)
	local replnr = bufferpairs[tonumber(bufnr)]
	if replnr then
		utils.exec(replnr .. "bdelete!")
		bufferpairs[bufnr] = nil
	end
end
