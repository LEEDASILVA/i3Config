vim.g.mapleader = " "

local keymap = vim.keymap

vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<cmd>Explore<cr>", { noremap = true })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
-- split window vertically
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window horizontally
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- make split windows equal width & height
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
-- close current split window
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
keymap.set("n", "<C-l>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<C-h>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- keymap.set("n", "<C-S-l>", "<cmd>tabmove +1<CR>", { desc = "move the current tab right" })
-- keymap.set("n", "<C-S-h>", "<cmd>tabmove -1<CR>", { desc = "move the current tab left" })

-- Function to toggle the display of dots for spaces
function ToggleWhitespace()
	if vim.opt.list:get() then
		vim.opt.list = false
	else
		vim.opt.list = true
		vim.opt.listchars:append("space:·")
	end
end

vim.api.nvim_set_keymap("n", "<leader>s.", ":lua ToggleWhitespace()<CR>", { noremap = true, silent = true })

-- move line of code up or down
keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
