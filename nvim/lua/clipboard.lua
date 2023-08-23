local global = vim.g;
return function(config)
  -- Only activate if we are using SSH
  if not os.getenv("SSH_TTY") or not os.getenv("SSH_CLIENT") then
    return
  end
  local plugin = require(config.name)
  plugin.setup {}
  local function paste()
    return {
      vim.fn.split(vim.fn.getreg("") or "", "\n"),
      vim.fn.getregtype(""),
    }
  end
  local function copy(lines, _)
    plugin.copy(table.concat(lines, "\n"))
  end
  global.clipboard = {
    name = "osc52",
    copy = { ["+"] = copy, ["*"] = copy },
    paste = { ["+"] = paste, ["*"] = paste },
  }
end
