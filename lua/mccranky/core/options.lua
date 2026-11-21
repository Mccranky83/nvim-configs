vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.guifont = "Rec Mono Duotone:h15"

local encodings = {
	"ucs-bom",
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
opt.fileencodings = table.concat(encodings, ",")

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line & column highlight
opt.cursorline = true
opt.cursorcolumn = true

-- appearance
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- turn on persistent undo
local undodir = vim.fn.stdpath("data") .. "/undo"
opt.undodir = undodir
opt.undofile = true

-- fold options
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- using ufo provider requires a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

-- spell checking
opt.spell = false
opt.spelllang = { "en_us" }

-- session settings
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
