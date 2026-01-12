vim.filetype.add({
  extension = {
    genexpr = "genexpr",
    gendsp = "genexpr",
    maxproj = "json",
    maxpat = "json",
    jxs = "jitter-xml-shader",
  }
})

vim.treesitter.language.register("xml", { "jitter-xml-shader" })
