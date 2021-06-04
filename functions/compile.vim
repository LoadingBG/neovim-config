" Commands:
" haxe:       sudo add-apt-repository ppa:haxe/releases -y
"             sudo apt-get update
"             sudo apt-get install haxe -y
" dart:       sudo apt-get update
"             sudo apt-get install apt-transport-https
"             sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
"             sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
"             sudo apt-get update
"             sudo apt-get install dart
" java:       sudo apt install openjdk-11-jdk-headless
" kotlin:     sdk install kotlin
" scala:      sudo apt install scala
" groovy:     sdk install groovy
" clojure:    sudo apt install clojure
" lisp:       sudo apt install clisp
" hy:         pip install hy
" python:     (preinstalled)
" r:          sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
"             sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
"             sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
"             sudo apt install r-base
" julia:      sudo apt install julia
" nim:        sudo apt-get install nim
" c:          sudo apt install tcc
" cpp:        (preinstalled)
" cs:         sudo apt install gnupg ca-certificates
"             sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
"             echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
"             sudo apt update
"             sudo apt install mono-devel
" d:          sudo wget https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
"             sudo apt-get update --allow-insecure-repositories
"             sudo apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring
"             sudo apt-get update && sudo apt-get install dmd-compiler dub
" rust:       curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
"             sudo cargo install cargo-script
" go:         sudo add-apt-repository ppa:longsleep/golang-backports
"             sudo apt update
"             sudo add-apt-repository ppa:longsleep/golang-backports
" fortran:    (preinstalled)
" pascal:     (preinstalled)
" haskell:    sudo add-apt-repository -y ppa:hvr/ghc
"             sudo apt-get update
"             sudo apt-get install -y cabal-install-XXX ghc-YYY
" ocaml:      sudo apt install ocaml
" lua:        sudo apt install lua5.3
" dosbatch:   (preinstalled for WSL)
" powershell: (preinstalled for WSL)
" sh:         (preinstalled)
" perl:       (preinstalled)
" php:        sudo apt update
"             sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath
" javascript: sudo apt install nodejs
"             sudo apt install npm
" typescript: sudo npm install typescript
"             sudo npm install ts-node
" coffee:     sudo apt install coffeescript
" ruby:       sudo apt-get install ruby-full
" crystal:    curl -sSL https://dist.crystal-lang.org/apt/setup.sh | sudo bash
"             curl -sL "https://keybase.io/crystal/pgp_keys.asc" | sudo apt-key add -
"             echo "deb https://dist.crystal-lang.org/apt crystal main" | sudo tee /etc/apt/sources.list.d/crystal.list
"             sudo apt-get update
"             sudo apt install crystal libssl-dev libxml2-dev libyaml-dev libgmp-dev libz-dev
" elixir:     sudo apt-get install elixir (requires Erlang)
" erlang:     wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
"             sudo apt-get update
"             sudo apt-get install esl-erlang
" st:         (preinstalled)
" nasm:       sudo apt install nasm
" apl:        wget https://mirrors.sarata.com/gnu/apl/apl-1.8.tar.gz
"             tar xzf apl-1.8.tar.gz
"             cd apl-1.8
"             ./configure
"             make
"             sudo make install
" html:       sudo apt install firefox

map <F9> :call <SID>CompileAndRun()<CR>
imap <F9> <ESC>:call <SID>CompileAndRun()<CR>
function! s:CompileAndRun()
    let l:file = expand('%:p')
    let l:noext = expand('%:p:r')
    let l:path = expand('%:p:h')
    let l:name = expand('%:t:r')
    let l:command_map = {
        \'haxe'      : 'haxe --run '              . l:file,
        \'dart'      : 'dart run '                . l:file,
        \'java'      : 'java '                    . l:file,
        \'kotlin'    : 'kscript '                 . l:file,
        \'scala'     : 'scala '                   . l:file,
        \'groovy'    : 'groovy '                  . l:file,
        \'clojure'   : 'clojure '                 . l:file,
        \'lisp'      : 'clisp '                   . l:file,
        \'hy'        : 'hy '                      . l:file,
        \'python'    : 'python3 '                 . l:file,
        \'r'         : 'r '                       . l:file,
        \'julia'     : 'julia '                   . l:file,
        \'nim'       : 'nimrun '                  . l:path,
        \'c'         : 'tcc -run '                . l:file,
        \'cpp'       : 'g++ '                     . l:file . ' -o ' . l:noext . ' && ' . l:noext . ' ; rm ' . l:noext,
        \'cs'        : 'mcs '                     . l:file . ' && mono ' . l:noext . '.exe ; rm ' . l:noext . '.exe',
        \'d'         : 'rdmd '                    . l:file,
        \'rust'      : 'cargo script '            . l:file,
        \'go'        : 'go run '                  . l:file,
        \'fortran'   : 'gfortran '                . l:file . ' -o ' . l:name . ' && ' . l:noext . ' ; rm ' . l:noext,
        \'pascal'    : 'instantfpc '              . l:file,
        \'haskell'   : 'runghc '                  . l:file,
        \'ocaml'     : 'ocaml '                   . l:file,
        \'lua'       : 'lua '                     . l:file,
        \'dosbatch'  : 'cmd.exe /c //wsl$/Ubuntu' . l:file,
        \'powershell': 'powershell.exe '          . l:file,
        \'sh'        : 'chmod +x '                . l:file . ' && ' . l:file,
        \'perl'      : 'perl '                    . l:file,
        \'php'       : 'php '                     . l:file,
        \'javascript': 'node '                    . l:file,
        \'typescript': 'ts-node '                 . l:file,
        \'coffee'    : 'coffee '                  . l:file,
        \'ruby'      : 'ruby '                    . l:file,
        \'crystal'   : 'crystal '                 . l:file,
        \'elixir'    : 'elixir '                  . l:file,
        \'erlang'    : 'escript '                 . l:file,
        \'st'        : 'gst '                     . l:file,
        \'nasm'      : 'nasm -felf64 '            . l:file . ' -o ' . l:noext . '.o && ld ' . l:noext . '.o -o ' . l:noext . ' && ' . l:noext . ' ; rm ' . l:noext . '.o ' . l:noext,
        \'apl'       : 'apl '                     . l:file,
        \'html'      : 'firefox '                 . l:file
    \}
    let l:command = get(l:command_map, &filetype, '')
    if l:command == ''
        echohl ErrorMsg
        echo '[ERROR]'
        echohl Normal
        echon &filetype . ' files cannot be executed.'
    else
        exec 'w'
        exec 'belowright vnew'
        exec 'term ' . l:command
        exec 'startinsert'
    endif
endfunction
