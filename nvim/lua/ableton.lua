vim.filetype.add({
  extension = {
    maxproj = "json",
    maxpat = "json",
    jxs = "jitter-xml-shader",
  }
})

vim.treesitter.language.register("xml", "jitter-xml-shader")
