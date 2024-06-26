local global = vim.g

if os.getenv("SSH_TTY") and os.getenv("SSH_CLIENT") then
  local clipboard = require("vim.ui.clipboard.osc52")
  global.clipboard = {
    name = "OSC 52",
    paste = { ["+"] = clipboard.paste("+"), ["*"] = clipboard.paste("*") },
    copy = { ["+"] = clipboard.copy("+"), ["*"] = clipboard.copy("*") },
  }
end

global.editorconfig = false
global.mapleader = ","
global.is_kornshell = 0
global.is_posix = 1
global.sh_fold_enabled = 3
global.gitmoji_aliases = {
  ["adhesive-bandage"] = { "patch" },
  alembic = { "try", "experiment" },
  alien = { "extern", "external" },
  ambulance = { "critical", "hotfix" },
  ["chart-with-upwards-trend"] = { "analytics", "stats" },
  ["arrow-down"] = { "downgrade" },
  ["arrow-up"] = { "upgrade" },
  art = { "format", "fmt" },
  bento = { "assets", "asset" },
  bookmark = { "version", "release", "tag" },
  boom = { "abi", "break" },
  ["building-construction"] = { "architecture", "arch" },
  bulb = { "comments", "comment" },
  ["busts-in-silhouette"] = { "contrib", "contributor", "contributors" },
  ["camera-flash"] = { "snapshot" },
  ["card-file-box"] = { "database" },
  ["children-crossing"] = { "ux" },
  ["clown-face"] = { "mock" },
  coffin = { "dead" },
  construction = { "wip" },
  ["construction-worker"] = { "ci" },
  dizzy = { "animations" },
  fire = { "delete" },
  ["globe-with-meridians"] = { "translate", "i18n", "l10n" },
  ["goal-net"] = { "catch" },
  ["green-heart"] = { "fix-ci" },
  hammer = { "build" },
  ["heavy-minus-sign"] = { "rm" },
  ["heavy-plus-sign"] = { "add" },
  iphone = { "mobile", "responsive" },
  label = { "types", "typing", "type-safety" },
  lipstick = { "ui", "style" },
  lock = { "cve" },
  ["loud-sound"] = { "logs", "log" },
  ["monocle-face"] = { "inspect", "data" },
  mute = { "quiet", "silence" },
  ["page-facing-up"] = { "license" },
  ["passport-control"] = { "permissions", "permission", "roles", "role", "auth" },
  memo = { "docs" },
  pencil2 = { "typos", "typo" },
  pushpin = { "pin" },
  recycle = { "refactor" },
  rewind = { "revert" },
  rocket = { "deploy" },
  ["rotating-light"] = { "lint" },
  ["see-no-evil"] = { "ignore" },
  sparkles = { "feature", "new" },
  ["speech-balloon"] = { "text" },
  ["test-tube"] = { "test-fail", "failing-test", "failing-tests", "tdd" },
  ["triangular-flag-on-post"] = { "flag", "feature-flag" },
  truck = { "rename", "mv", "move" },
  ["twisted-rightwards-arrows"] = { "merge" },
  wastebasket = { "deprecated", "deprecate" },
  wheelchair = { "a11y" },
  ["white-check-mark"] = { "test-pass", "passing-test", "passing-tests", "tests", "test" },
  wrench = { "configuration", "config", "cfg" },
  zap = { "performance", "perf" },
}
