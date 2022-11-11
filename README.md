# Overview

This repository currently holds the bare minimum set of common files that I use
in my day to day work across multiple operating systems (specifically, Windows,
Linux, and macOS).

When setting up a new environment, this repository is typically one of the
first things I pull down when I am ready to start working.

# Installing

To install/setup/initialize these dotfiles, use Python 3 and run

```console
$ python setup.py
```

# Tools

The following tools are required to get the full use out of this project:

 - [pwsh](https://github.com/powershell/powershell)
 - [neovim](https://github.com/neovim/neovim)
 - [ripgrep](https://crates.io/crates/ripgrep)
 - [delta](https://crates.io/crates/git-delta)
 - [lsd](https://crates.io/crates/lsd)
 - [fd](https://crates.io/crates/fd-find)
 - [gh](https://github.com/cli/cli)

The following font is used:

 - [Delugia Code](https://github.com/adam7/delugia-code)

# Development

To stay in line with "best practices", a few tools are used to make sure my
dotfiles meet my personal requirements. To do this a few development tools are
used:

 - [PSScriptAnalyzer](#)
 - [stylua](#)
 - [yamllint](#)

# Toolbox

Additional utilities in my toolbox include the following:

 - [hyperfine](https://crates.io/crates/hyperfine)
 - [onefetch](https://crates.io/crates/onefetch)
 - [silicon](https://crates.io/crates/silicon)
 - [pastel](https://crates.io/crates/pastel)
 - [typos](https://crates.io/crates/typos-cli)
 - [tokei](https://crates.io/crates/tokei)
 - [hexyl](https://crates.io/crates/hexyl)
 - [ambr](https://crates.io/crates/amber)
 - [bat](https://crates.io/crates/bat)
 - [btm](https://crates.io/crates/bottom)
 - [youtube-dl](#)

 - [golangci-lint](#)
 - [flarectl](#)
 - [task](https://taskfile.dev)
 - [dlv](#)
 - [fzf](https://github.com/junegunn/fzf)

**NOTE**: An automatic packaging solution for all these tools to create a
repository/metapackage/installer for all these tools will be put into a
separate project at a later date.
