# neovim-config
Configuration for NeoVim in WSL on Ubuntu 20.04

## Structure
```
.
├── init.lua      -> init.lua
└── lua           -> config
    ├── functions -> custom functions
    └── plugins   -> plugins
```
Every folder has a `loader.lua` file which loads the contents of the folder.
