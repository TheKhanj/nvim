My configs for neovim.

# Installation
Clone the project at `~/.config/nvim/`
`git clone git@github.com:TheKhanj/nvim.git ~/.config/nvim`

Cd into the directory `~/.config/nvim`
`cd ~/.config/nvim`

Initialize and update git submodules
```sh
git submodule init
git submodule update
```

Install neovim, you'd probably prefer latest version of neovim which is 0.9.
Crappy distros like ubuntu do not have latest version in their repository, for
those distros just follow the [official
guide](https://github.com/neovim/neovim/releases/). Install it by extracting
tar ball.

Run neovim by `nvim`.

> For running commands in neovim I've mapped `;` to `:`, so instead of pressing
> `:` you should press `;` to go to command line mode.

## Installing packages
I use a package manager called
[packer](https://github.com/wbthomason/packer.nvim) for managing my packages.
At first you wanna install all packages by going to command line mode and
running `PackerInstall`.

## Lsp
LSP is a language server protocol invented by microsoft for supporting features
like **go to definition** and those stuff. It's basically an interface,
different languages implement their own version of that interface. It's most
common reason that is preventing people from using vim. But they simply **don't
know** that there's a solution.

For LSP support I use [coc](https://github.com/neoclide/coc.nvim) plugin. It
should be noted that for it to work properly **nodejs** and **yarn** package
manager should be installed on your system. You can install them by
[nvm](git@github.com:nvm-sh/nvm.git) or [volta](https://docs.volta.sh/guide/).
I prefer volta personally cause it's written in Rust and is much snappier.

> After you run `PackerInstall` packer tries to run `yarn install` in coc's
> directory. Sometimes this fails. You might want to run it manually by going
> to directory `~/.local/share/nvim/site/pack/packer/start/coc.nvim` and
> running `yarn install` manually.

For supporting different languages you just need to install the language server
for that language. Coc provides an easy command to do that but you can totally
install it globally on your system or in any other way that you want. Language
servers are just RPC servers that you run them on a codebase and you can ask
different requests about your codebase from them. PHPStorm and all other crappy
IDEs use them as well in background.

For example to install install **intelephense** language server for php you
should run the following command.
`CocInstall coc-phpls`

> I prefer to have [psalm](https://github.com/vimeo/psalm) language server on
> my php code as well, but due to the fact that the language server is under
> heavy development right now I prefer to clone it somewhere in my filesystem
> and always use the up to date master branch. I just symlink `psalm` binary to
> the location of the cloned project.

## Treesitter
[Treesitter](https://github.com/tree-sitter/tree-sitter) is an incremental
parsing system for languages. The most simple use case of it in neovim is to
provide color highlighting. But it's worth noting that some great other stuff
can be done with it too.

For different languages you can install it's treesitter definition by running
following command. `TSInstall php`

## Telescope
[Telescope](https://github.com/nvim-telescope/telescope.nvim) is my fuzzy
finder. It's written by lovely 😍[TJ](https://github.com/tjdevries). He is
a core neovim developer. He has an awesome youtube channel BTW.

For basic fuzzy finding press `\ + t + f`. You can find other mappings in
configs.

## Nvim-tree
[Nvim](https://github.com/nvim-tree/nvim-tree.lua) tree
is basically my file manager. To trigger it press `<ctrl> + \`

## Formatter
I use [this](https://github.com/mhartington/formatter.nvim) as my
formatter. To trigger it just press `\ + a`.

## Fugitive
It's a minimal plugin for working with git cli inside vim. It's awesome.

## Tmux
I use tmux, this plugin helps me to navigate between vim's windows and
tmux panes seamlessly.

## Firenvim
It's nothing important, just a plugin to have vim inside browsers too.

## Twig
Syntax highlighter for twig files.
