local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Oil.nvim
map("n", "-", "<cmd>Oil<cr>", { desc = "Open oil.nvim" })
map("n", "<leader>-", "<cmd>Oil<cr>", { desc = "Open oil.nvim" })

map("n", "<leader>E", "<cmd>Neotree toggle buffers<cr>", { desc = "Toggle Buffers Explorer" })

-- Telescope
-- map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
-- map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")

-- Tranparent
map("n", "<leader>uT", "<cmd>TransparentEnable<cr>", { desc = "Enable background transparency" })
map("n", "<leader>ut", "<cmd>TransparentToggle<cr>", { desc = "Toggle background transparency" })

-- mini.nvim
map("n", "<leader>C", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })

-- some utilities
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and Replace RegExp" })
map("n", "tn", "<cmd>tabnew<cr>")
map("n", "<leader>n", "<cmd>noh<cr>", { desc = "Remove highlighting of search matches" })

-- utilities to center the screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- visual
map("v", "p", '"_dP')
map("v", "<", "<gv")
map("v", ">", ">gv")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- In visual mode replace p to P
-- https://vi.stackexchange.com/questions/39149/how-to-stop-neovim-from-yanking-text-on-pasting-over-selection
keymap.set("x", "p", "P")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
