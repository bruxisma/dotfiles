local global, fn = vim.g, vim.fn

global.mapleader = ","
-- TODO: Move this to the OSC52 plugin entry. global.clipboard = OSC52()

--[[ for copying text across SSH via `"+y`
local function OSC52()
  if not os.getenv("SSH_TTY") or not os.getenv("SSH_CLIENT") then
    return nil
  end
  local osc52 = require("osc52")
  osc52.setup {}
  local function paste()
    return {
      fn.split(fn.getreg(""), "\n"),
      fn.getregtype(""),
    }
  end
  local function copy(lines, _)
    osc52.copy(table.concat(lines, "\n"))
  end
  return {
    name = "osc52",
    copy = { ["+"] = copy, ["*"] = copy },
    paste = { ["+"] = paste, ["*"] = paste },
  }
end
]]


global.is_kornshell = 0
global.is_posix = 1
global.sh_fold_enabled = 3

-- vim-gitgutter plugin (nvim doesn't support unicode literals 🙄)
-- NOTE: There are now better alternatives to vim-gitgutter, and I should move to it
-- Furthermore, I don't think these are working anymore, anyhow!
global.gitgutter_sign_removed_first_line = fn.eval([["\uf476"]])
global.gitgutter_sign_modified_removed = fn.eval([["\uf45a"]])
global.gitgutter_sign_modified = fn.eval([["\uf459"]])
global.gitgutter_sign_removed = fn.eval([["\uf458"]])
global.gitgutter_sign_added = fn.eval([["\uf457"]])
global.gitgutter_map_keys = 0

if fn.executable("rg") then
  global.gitgutter_grep = "rg --color never"
end
