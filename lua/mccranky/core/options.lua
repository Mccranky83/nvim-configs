local opt = vim.opt -- for conciseness

-- font settings
opt.guifont = "Rec Mono Duotone:h15"

-- file encodings
local encodings = {
  "utf-8",
  "gbk",
  "shift-jis",
  "latin1",
  "iso-2022-jp",
  "euc-jp",
  "ucs-2le",
  "ucs-2be",
  "utf-16le",
  "utf-16be",
}
opt.encoding = "utf-8"
opt.fileencodings = table.concat(encodings, ",")

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- cursor column
opt.cursorcolumn = true -- highlight the current cursor column

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- fold options
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

-- shared data

-- !: global variables; h: store the command-line history
-- ': command-line history; <: search history; s: input-line history
opt.shada = "!,'3000,<1000,s1000,h"

-- spell checking
opt.spell = false
opt.spelllang = { "en_us" }

-- session settings
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
