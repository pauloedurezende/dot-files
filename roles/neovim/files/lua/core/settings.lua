local g = vim.g;
local opt = vim.opt;

-- Settings
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.backup = false -- Dont make a backup before overwriting a file
opt.clipboard = "unnamedplus" -- Use the clipboard register '*' for all yank, delete, change and put operations which would normally go to the unnamed register
opt.cmdheight = 2 -- Number of screen lines to use for the command-line. Prevents "hit-enter" prompts
opt.colorcolumn = "80" -- Show a highlighted column, useful to align text.
opt.conceallevel = 0 -- Text is shown normally
opt.cursorline = true -- Highlight the current text line of the cursor
opt.encoding = "utf-8" -- Change the output encoding that is shown in the terminal
opt.expandtab = true -- Use the appropriate number of spaces to insert a <Tab>
opt.fileencoding = "utf-8" -- Change the output encoding of the file that is written
opt.hidden = true -- Allows background buffers
opt.laststatus = 2 -- Always display the status bar
opt.mouse = "a" -- Enables mouse support in all modes
opt.number = true -- Show the line number
opt.pumheight = 10 -- Maximum number of items to show in the popup menu
opt.relativenumber = true -- Show the line number relative to the line with the cursor
opt.ruler = true -- Show the line and column number of the cursor position, separated by a comma
opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor.
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.showmode = false -- If in Insert, Replace or Visual mode put a message on the last line
opt.signcolumn = "yes" -- Always show the signcolumn
opt.smartindent = true -- Do smart autoindenting when starting a new line
opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations
opt.splitbelow = true -- splitting a window will put the new window below the current one
opt.splitright = true -- Splitting a window will put the new window right of the current one
opt.swapfile = false -- Avoid creating a swapfile
opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
opt.title = true -- Set the title of the window will be set to the value of 'titlestring'
opt.updatetime = 300 -- If this many milliseconds nothing is typed the swap file will be written to disk
opt.wrap = false -- Show the big lines without breaking
opt.writebackup = false -- Dont make a backup before overwriting a file
opt.termguicolors = true -- Emits true (24-bit) colours in the terminal

opt.formatoptions:remove({ 'c', 'r', 'o' })
opt.shortmess:append({ c = true })
opt.iskeyword:append({ ["-"] = true })
opt.whichwrap:append({ h = true, l = true, ["<"] = true, [">"] = true, ["["] = true, ["]"] = true })

-- disable some builtin vim plugins
g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logipat = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_matchit = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tutor = 1
g.loaded_rplugin = 1
g.loaded_syntax = 1
g.loaded_synmenu = 1
g.loaded_optwin = 1
g.loaded_compiler = 1
g.loaded_bugreport = 1
g.loaded_ftplugin = 1
