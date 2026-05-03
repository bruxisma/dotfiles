local alias = package.loaded.prelude.alias

alias("grc", "edit", "$MYGVIMRC")
alias("rc", "edit", "$MYVIMRC")

alias("unstage", "lua", "package.loaded.gitsigns.reset_hunk()")
alias("stage", "lua", "package.loaded.gitsigns.stage_hunk()")
alias("blame", "lua", "package.loaded.gitsigns.blame_line { full = true }")

alias("debug", "lua", "package.loaded.dapui.toggle()")

alias("rename", "lua", "vim.lsp.buf.rename()")
alias("act", "lua", "vim.lsp.buf.code_action()")
alias("fmt", "lua", "vim.lsp.buf.format()")

alias("files", "Telescope file_browser")
alias("ls", "Telescope buffers")

alias("chmod", "Chmod")
alias("rm", "Delete")

alias("todo", "TodoTrouble")
alias("json", "%!jq .")
alias("lgrep", "silent", "lgrep")
alias("grep", "silent", "grep")
alias("aliases", "lua", "vim.iter(package.loaded.prelude.aliases):map(vim.print)")
