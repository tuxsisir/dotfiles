local set = vim.opt

set.backup = false                          -- creates a backup file
set.clipboard:append("unnamedplus")         -- allows neovim to access the system clipboard
set.cmdheight = 1                           -- more space in the neovim command line for displaying messages
set.completeopt = { "menuone", "noselect" } -- mostly just for cmp
set.conceallevel = 0                        -- so that `` is visible in markdown files
set.fileencoding = "utf-8"                  -- the encoding written to a file
set.hlsearch = true                         -- highlight all matches on previous search pattern
set.ignorecase = true                       -- ignore case in search patterns
set.mouse = "a"                             -- allow the mouse to be used in neovim
set.pumheight = 10                          -- pop up menu height
set.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
set.showtabline = 0                         -- always show tabs
set.smartcase = true                        -- smart case
set.smartindent = true                      -- make indenting smarter again
set.splitbelow = true                       -- force all horizontal splits to go below current window
set.splitright = true                       -- force all vertical splits to go to the right of current window
set.swapfile = false                        -- creates a swapfile
set.termguicolors = true                    -- set term gui colors (most terminals support this)
set.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
set.undofile = false                        -- enable persistent undo
set.updatetime = 300                        -- faster completion (4000ms default)
set.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
set.expandtab = true                        -- convert tabs to spaces
set.shiftwidth = 4                          -- the number of spaces inserted for each indentation
set.tabstop = 4                             -- insert 4 spaces for a tab
set.cursorline = true                       -- highlight the current line
-- set.relativenumber = true                   -- set relative numbered lines
set.number = true                           -- set numbered lines
set.laststatus = 3                          -- only the last window will always have a status line
set.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
set.ruler = true                            -- hide the line and column number of the cursor position
set.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
set.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
set.wrap = false                            -- display lines as one long line
set.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
set.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
-- set.guifont = "monospace:h17"               -- the font used in graphical neovim applications
set.fillchars.eob=" "                       -- show empty lines at the end of a buffer as ` ` {default `~`}
set.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
set.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
set.iskeyword:append("-")                   -- treats words with `-` as single words
set.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
set.linebreak = true


set.list = true
set.listchars:append('trail:.')
set.listchars:append("tab:\\ →")
set.listchars:append('nbsp:␣')
-- set.listchars:append('space:')

set.visualbell = true
