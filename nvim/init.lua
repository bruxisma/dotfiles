require "settings"

vim.opt.mouse = "a"
vim.opt.guifont = "Delugia:h10"

vim.api.nvim_set_keymap("i", "<Tab>", [[copilot#Accept("\<Tab>")]], {
  silent = true,
  script = true,
  expr = true,
})

vim.cmd [[colorscheme gruvbox]]

vim.g.is_kornshell = 0
vim.g.is_posix = 1
vim.g.sh_fold_enabled = 3

vim.g.gitmoji_aliases = {
 ["adhesive-bandage"] = { "patch" },
  alembic = {'try', 'experiment'},
  alien = {'extern', 'external'},
  ambulance = {'critical', 'hotfix'},
  ["chart-with-upwards-trend"] = {'analytics', 'stats'},
  ["arrow-down"] = {'downgrade'},
  ["arrow-up"] = {'upgrade'},
  art = {'format', 'fmt'},
  bento = {'assets', 'asset'},
  bookmark = {'version', 'release', 'tag'},
  boom = {'abi', 'break'},
  ["building-construction"] = {'architecture', 'arch'},
  bulb = {'comments', 'comment'},
  ["busts-in-silhouette"] = {'contrib', 'contributor', 'contributors'},
  ["camera-flash"] = {'snapshot'},
  ["card-file-box"] = {'database'},
  ["children-crossing"] = {'ux'},
  ["clown-face"] = {'mock'},
  coffin = {'dead'},
  construction = {'wip'},
  ["construction-worker"] = {'ci'},
  animation = {'animations'},
  fire = {'delete'},
  ["globe-with-meridians"] = {'translate', 'i18n', 'l10n'},
  ["goal-net"] = {'catch'},
  ["green-heart"] = {'fix-ci'},
  hammer = { 'build' },
  ["heavy-minus-sign"] = {'rm'},
  ["heavy-plus-sign"] = {'add'},
  iphone = {'mobile', 'responsive'},
  label = {'types', 'typing', 'type-safety'},
  lipstick = {'ui', 'style'},
  lock = {'cve'},
  ["loud-sound"] = {'logs', 'log'},
  ["monocle-face"] = {'inspect', 'data'},
  mute = {'quiet', 'silence'},
  ["page-facing-up"] = {'license'},
  ["passport-control"] = {'permissions', 'permission', 'roles', 'role', 'auth'},
  memo = {'docs'},
  pencil2 = {'typos', 'typo'},
  pushpin = {'pin'},
  recycle = {'refactor'},
  rewind = {'revert'},
  rocket = {'deploy'},
  ["rotating-light"] = {'lint'},
  ["see-no-evil"] = {'ignore'},
  sparkles = {'feature', 'new'},
  ["speech-balloon"] = {'text'},
  ["test-tube"] = {'test-fail', 'failing-test', 'failing-tests', 'tdd'},
  ["triangular-flag-on-post"] ={'flag', 'feature-flag'},
  truck = {'rename', 'mv', 'move'},
  ["twisted-rightwards-arrows"] = {'merge'},
  wastebasket = {'deprecated', 'deprecate'},
  wheelchair = {'a11y'},
  ["white-check-mark"] = {'test-pass', 'passing-test', 'passing-tests', 'tests', 'test'},
  wrench = {'configuration', 'config', 'cfg'},
  zap = {'performance', 'perf'}
}

-- Leftover from orginal vimrc. Will remain until it can be replaced.
vim.cmd [[
function! s:command(name, ...)
  return getcmdtype() == ':' && getcmdline() =~# '^' .. a:name
        \ ? join(a:000, ' ')
        \ : a:name
endfunction 

cnoreabbrev <expr> grc <SID>command("grc", "edit<Space>$MYGVIMRC")
cnoreabbrev <expr> rc <SID>command("rc", "edit<Space>$MYVIMRC")

cnoreabbrev <expr> unstage <SID>command("unstage", "GitGutterUndoHunk")
cnoreabbrev <expr> stage <SID>command("stage", "GitGutterStageHunk")

cnoreabbrev <expr> refresh <SID>command("refresh", "filetype<Space>detect")

cnoreabbrev <expr> reload <SID>command("reload", "source<Space>$MYVIMRC")
cnoreabbrev <expr> chmod <SID>command("chmod", "Chmod")

cnoreabbrev <expr> find <SID>command("find", "Files<Space>$HOME/Desktop")
cnoreabbrev <expr> rm <SID>command("rm", "Delete")
cnoreabbrev <expr> ls <SID>command("ls", "Telescope<Space>buffers")

cnoreabbrev <expr> json <SID>command("json", "%!jq<Space>.")

cnoreabbrev <expr> lgrep <SID>command("lgrep", "silent<Space>lgrep")
cnoreabbrev <expr> grep <SID>command("grep", "silent<Space>grep")

cnoreabbrev <expr> st <SID>command("st", "GFiles?")
]]
