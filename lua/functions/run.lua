local utils = require "utils"

--[[
Commands:
haxe:       sudo add-apt-repository ppa:haxe/releases -y
            sudo apt-get update
            sudo apt-get install haxe -y
dart:       sudo apt-get update
            sudo apt-get install apt-transport-https
            sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
            sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
            sudo apt-get update
            sudo apt-get install dart
java:       sudo apt install openjdk-11-jdk-headless
kotlin:     sdk install kotlin
scala:      sudo apt install scala
groovy:     sdk install groovy
clojure:    sudo apt install clojure
lisp:       sudo apt install clisp
hy:         pip install hy
python:     (preinstalled)
r:          sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
            sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
            sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
            sudo apt install r-base
julia:      sudo apt install julia
nim:        sudo apt-get install nim
c:          sudo apt install tcc
cpp:        (preinstalled)
cs:         sudo apt install gnupg ca-certificates
            sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
            echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
            sudo apt update
            sudo apt install mono-devel
d:          sudo wget https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
            sudo apt-get update --allow-insecure-repositories
            sudo apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring
            sudo apt-get update && sudo apt-get install dmd-compiler dub
rust:       curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
            sudo cargo install cargo-script
go:         sudo add-apt-repository ppa:longsleep/golang-backports
            sudo apt update
            sudo add-apt-repository ppa:longsleep/golang-backports
fortran:    (preinstalled)
pascal:     (preinstalled)
haskell:    sudo add-apt-repository -y ppa:hvr/ghc
            sudo apt-get update
            sudo apt-get install -y cabal-install-XXX ghc-YYY
ocaml:      sudo apt install ocaml
lua:        sudo apt install lua5.3
dosbatch:   (preinstalled for WSL)
powershell: (preinstalled for WSL)
sh:         (preinstalled)
perl:       (preinstalled)
php:        sudo apt update
            sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath
javascript: sudo apt install nodejs
            sudo apt install npm
typescript: sudo npm install typescript
            sudo npm install ts-node
coffee:     sudo apt install coffeescript
ruby:       sudo apt-get install ruby-full
crystal:    curl -sSL https://dist.crystal-lang.org/apt/setup.sh | sudo bash
            curl -sL "https://keybase.io/crystal/pgp_keys.asc" | sudo apt-key add -
            echo "deb https://dist.crystal-lang.org/apt crystal main" | sudo tee /etc/apt/sources.list.d/crystal.list
            sudo apt-get update
            sudo apt install crystal libssl-dev libxml2-dev libyaml-dev libgmp-dev libz-dev
elixir:     sudo apt-get install elixir (requires Erlang)
erlang:     wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
            sudo apt-get update
            sudo apt-get install esl-erlang
st:         (preinstalled)
nasm:       sudo apt install nasm
html:       sudo apt install firefox
--]]

utils.map("<F9>", ":call v:lua.run()<CR>", {})
function run()
	local file  = vim.fn.expand("%:p")
	local noext = vim.fn.expand("%:p:r")
	local path  = vim.fn.expand("%:p:h")
	local name  = vim.fn.expand("%:t:r")
	local commands = {
		haxe       = 'haxe --run '                    .. file,
		dart       = 'dart run '                      .. file,
		java       = 'java '                          .. file,
		kotlin     = 'kscript '                       .. file,
		scala      = 'scala '                         .. file,
		groovy     = 'groovy '                        .. file,
		clojure    = 'clojure '                       .. file,
		lisp       = 'clisp '                         .. file,
		hy         = 'hy '                            .. file,
		python     = 'python3 '                       .. file,
		r          = 'r '                             .. file,
		julia      = 'julia '                         .. file,
		nim        = 'nimrun '                        .. path,
		c          = 'tcc -run '                      .. file,
		cpp        = 'g++ '                           .. file .. ' -o ' .. noext .. ' && ' .. noext .. ' ; rm ' .. noext,
		cs         = 'mcs '                           .. file .. ' && mono ' .. noext .. '..exe ; rm ' .. noext .. '..exe',
		d          = 'rdmd '                          .. file,
		rust       = 'RUST_BACKTRACE=1 cargo script ' .. file,
		go         = 'go run '                        .. file,
		fortran    = 'gfortran '                      .. file .. ' -o ' .. name .. ' && ' .. noext .. ' ; rm ' .. noext,
		pascal     = 'instantfpc '                    .. file,
		haskell    = 'runghc '                        .. file,
		ocaml      = 'ocaml '                         .. file,
		lua        = 'lua '                           .. file,
		dosbatch   = 'cmd.exe /c //wsl$/Ubuntu'       .. file,
		powershel  = 'powershell.exe '                .. file,
		sh         = 'chmod +x '                      .. file .. ' && ' .. file,
		perl       = 'perl '                          .. file,
		php        = 'php '                           .. file,
		javascript = 'node '                          .. file,
		typescript = 'ts-node '                       .. file,
		coffee     = 'coffee '                        .. file,
		ruby       = 'ruby '                          .. file,
		crystal    = 'crystal '                       .. file,
		elixir     = 'elixir '                        .. file,
		erlang     = 'escript '                       .. file,
		st         = 'gst '                           .. file,
		nasm       = 'nasm -felf64 '                  .. file .. ' -o ' .. noext .. '..o && ld ' .. noext .. '..o -o ' .. noext .. ' && ' .. noext .. ' ; rm ' .. noext .. '..o ' .. noext,
		html       = 'firefox '                       .. file
	}
	local command = commands[vim.o.filetype]
	if command then
		utils.exec "w"
		utils.exec "belowright vnew"
		utils.exec("term " .. command)
		utils.exec "startinsert"
	else
		utils.exec "echohl ErrorMsg"
		utils.exec "echo '[ERROR]'"
		utils.exec "echohl Normal"
		utils.exec "echon &filetype . ' files cannot be executed.'"
	end
end
