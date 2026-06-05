vim.opt.guicursor = ""
vim.g.netrw_liststyle = 3

-- best paste remap
vim.keymap.set("v", "<leader>p", '"_dP')

-- drag text up and down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- search and replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- search across files
vim.keymap.set("n", "<leader>f", ":vimgrep /<C-r><C-w>/ **/*<CR>:copen<CR>")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.keymap.set("n", "<leader>jj", ":Ex<CR>")
vim.keymap.set("i", "jj", "<Esc>")
-- vim.keymap.set("x", "<C-_>", "gc")

-- clipboard settings
vim.opt.clipboard:append("unnamedplus")
vim.keymap.set("x", "<C-c>", '"+y', { noremap = true, silent = true })

vim.g.tmux_navigator_no_mappings = 1

-- relative line numbers
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.opt.smartindent = true
-- vim.opt.wrap = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50

-- -- undo tree settings

vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undo = os.getenv("HOME").."/.vim/undodir"
-- vim.opt.undofile = true

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- lsp saga
-- to show errors in line
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", {})

vim.diagnostic.config({ virtual_text = false })

vim.o.winborder = "rounded"
-- to toggle terminal
-- vim.keymap.set('n', '<A-k>', ':Lspsaga term_toggle<CR>',{})
--to open outline
vim.keymap.set("n", "<A-o>", ":Lspsaga outline<CR>", {})


vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

