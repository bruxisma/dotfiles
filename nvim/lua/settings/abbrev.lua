local function cabbrev(text, replace)
  local command = [[cnoreabbrev <expr> %s v:lua.settings.abbrev.command("%s", "%s")]]
  vim.cmd(command:format(text, text, replace))
end

function command(cmd, match)
  if vim.fn.getcmdtype() == ":" and vim.fn.getcmdline():match("^" .. cmd) then
    return match
  end
  return cmd
end

cabbrev { "ls", "Telescope buffers" }
