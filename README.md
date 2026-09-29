# David's neovim config

## Prerequisites

* Neovim 0.12 or later. If installing from the release tarball, keep `bin/` and `share/` together (symlink the binary, don't copy it)
* Install [`Packer`](https://github.com/wbthomason/packer.nvim#quickstart)
* Install [`ripgrep`](https://github.com/BurntSushi/ripgrep) to enable `telescope` `grep_string` and `live_grep`
* Install a patched font if you want to enable icons with lualine.
* Install [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) and a C compiler so `nvim-treesitter` can build parsers (`cargo install --locked tree-sitter-cli`, not npm)

## Install

* Simply clone with `git clone https://github.com/DavidHospital/my-neovim-config .config/nvim`
* Start neovim, and run `:PackerSync`

## Setup

* Create a directory "~/.scratchpads" for `NoNeckPain` scratchpads to save to
* Run `:MasonInstall codelldb` for rust debugging
* Create a virtualenv at "~/.virtualenvs/debugpy" with `debugpy` installed for python debugging
