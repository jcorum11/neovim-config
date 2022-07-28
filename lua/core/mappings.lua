local is_available = astronvim.is_available

local maps = { n = {}, v = {}, t = {}, [""] = {} }

maps[""]["<Space>"] = "<Nop>"

-- Normal --
-- Standard Operations
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>q<cr>", desc = "Quit" }
maps.n["<leader>h"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" }
maps.n["<leader>u"] = { function() astronvim.toggle_url_match() end, desc = "Toggle URL Highlights" }
maps.n["<leader>fn"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["gx"] = { function() astronvim.url_opener() end, desc = "Open the file under cursor with system app" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" }
maps.n["Q"] = "<Nop>"
maps.n["<leader>v"] = { "<cmd>vsplit<cr>", desc = "vsplit"}

-- Packer
maps.n["<leader>pc"] = { "<cmd>PackerCompile<cr>", desc = "Packer Compile" }
maps.n["<leader>pi"] = { "<cmd>PackerInstall<cr>", desc = "Packer Install" }
maps.n["<leader>ps"] = { "<cmd>PackerSync<cr>", desc = "Packer Sync" }
maps.n["<leader>pS"] = { "<cmd>PackerStatus<cr>", desc = "Packer Status" }
maps.n["<leader>pu"] = { "<cmd>PackerUpdate<cr>", desc = "Packer Update" }

-- Alpha
if is_available "alpha-nvim" then maps.n["<leader>d"] = { "<cmd>Alpha<cr>", desc = "Alpha Dashboard" } end

-- Bufdelete
if is_available "bufdelete.nvim" then
  maps.n["<leader>c"] = { "<cmd>Bdelete<cr>", desc = "Close window" }
else
  maps.n["<leader>c"] = { "<cmd>bdelete<cr>", desc = "Close window" }
end

-- Navigate buffers
if is_available "bufferline.nvim" then
  maps.n["<S-l>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer tab" }
  maps.n["<S-h>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer tab" }
  maps.n[">b"] = { "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer tab right" }
  maps.n["<b"] = { "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer tab left" }
  maps.n["bd"] = { "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort buffer by directory"}
else
  maps.n["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next buffer" }
  maps.n["<S-h>"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" }
end

-- Comment
if is_available "Comment.nvim" then
  maps.n["<leader>/"] = { function() require("Comment.api").toggle_current_linewise() end, desc = "Comment line" }
  maps.v["<leader>/"] = {
    "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>",
    desc = "Toggle comment line",
  }
end

-- GitSigns
if is_available "gitsigns.nvim" then
  maps.n["<leader>gj"] = { function() require("gitsigns").next_hunk() end, desc = "Next git hunk" }
  maps.n["<leader>gk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" }
  maps.n["<leader>gl"] = { function() require("gitsigns").blame_line() end, desc = "View git blame" }
  maps.n["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview git hunk" }
  maps.n["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" }
  maps.n["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset git buffer" }
  maps.n["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage git hunk" }
  maps.n["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage git hunk" }
  maps.n["<leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "View git diff" }
end

-- NeoTree
if is_available "neo-tree.nvim" then
  maps.n["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
  maps.n["<leader>o"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" }
end

-- Session Manager
if is_available "neovim-session-manager" then
  maps.n["<leader>Sl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" }
  maps.n["<leader>Ss"] = { "<cmd>SessionManager! save_current_session<cr>", desc = "Save this session" }
  maps.n["<leader>Sd"] = { "<cmd>SessionManager! delete_session<cr>", desc = "Delete session" }
  maps.n["<leader>Sf"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" }
  maps.n["<leader>S."] =
    { "<cmd>SessionManager! load_current_dir_session<cr>", desc = "Load current directory session" }
end

-- LSP Installer
if is_available "nvim-lsp-installer" then
  maps.n["<leader>li"] = { "<cmd>LspInfo<cr>", desc = "LSP information" }
  maps.n["<leader>lI"] = { "<cmd>LspInstallInfo<cr>", desc = "LSP installer" }
end

-- Smart Splits
if is_available "smart-splits.nvim" then
  -- Better window navigation
  maps.n["qh"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
  maps.n["qj"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
  maps.n["qk"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
  maps.n["ql"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }

  -- Resize with arrows
  maps.n["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" }
  maps.n["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" }
  maps.n["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" }
  maps.n["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" }
else
  maps.n["qh"] = { "<C-w>h", desc = "Move to left split" }
  maps.n["qj"] = { "<C-w>j", desc = "Move to below split" }
  maps.n["qk"] = { "<C-w>k", desc = "Move to above split" }
  maps.n["ql>"] = { "<C-w>l", desc = "Move to right split" }
  maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
  maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
  maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
  maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }
end

-- SymbolsOutline
if is_available "aerial.nvim" then maps.n["<leader>lS"] = { "<cmd>AerialToggle<cr>", desc = "Symbols outline" } end

-- Telescope
if is_available "telescope.nvim" then
  maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Search words" }
  maps.n["<leader>fW"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
      }
    end,
    desc = "Search words in all files",
  }
  maps.n["<leader>gt"] = { function() require("telescope.builtin").git_status() end, desc = "Git status" }
  maps.n["<leader>gb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" }
  maps.n["<leader>gc"] = { function() require("telescope.builtin").git_commits() end, desc = "Git commits" }
  maps.n["<leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Search files" }
  maps.n["<leader>fF"] = {
    function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    desc = "Search all files",
  }
  maps.n["<leader>fb"] = { function() require("telescope.builtin").buffers() end, desc = "Search buffers" }
  maps.n["<leader>fh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" }
  maps.n["<leader>fm"] = { function() require("telescope.builtin").marks() end, desc = "Search marks" }
  maps.n["<leader>fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Search history" }
  maps.n["<leader>fc"] =
    { function() require("telescope.builtin").grep_string() end, desc = "Search for word under cursor" }
  maps.n["<leader>sb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" }
  maps.n["<leader>sh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" }
  maps.n["<leader>sm"] = { function() require("telescope.builtin").man_pages() end, desc = "Search man" }
  maps.n["<leader>sn"] =
    { function() require("telescope").extensions.notify.notify() end, desc = "Search notifications" }
  maps.n["<leader>sr"] = { function() require("telescope.builtin").registers() end, desc = "Search registers" }
  maps.n["<leader>sk"] = { function() require("telescope.builtin").keymaps() end, desc = "Search keymaps" }
  maps.n["<leader>sc"] = { function() require("telescope.builtin").commands() end, desc = "Search commands" }
  maps.n["<leader>ls"] = {
    function()
      local aerial_avail, _ = pcall(require, "aerial")
      if aerial_avail then
        require("telescope").extensions.aerial.aerial()
      else
        require("telescope.builtin").lsp_document_symbols()
      end
    end,
    desc = "Search symbols",
  }
  maps.n["<leader>lR"] = { function() require("telescope.builtin").lsp_references() end, desc = "Search references" }
  maps.n["<leader>lD"] = { function() require("telescope.builtin").diagnostics() end, desc = "Search diagnostics" }
end

-- Terminal
if is_available "toggleterm.nvim" then
  local toggle_term_cmd = astronvim.toggle_term_cmd
  maps.n["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  maps.n["<leader>gg"] = { function() toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" }
  maps.n["<leader>tn"] = { function() toggle_term_cmd "node" end, desc = "ToggleTerm node" }
  maps.n["<leader>tu"] = { function() toggle_term_cmd "ncdu" end, desc = "ToggleTerm NCDU" }
  maps.n["<leader>tt"] = { function() toggle_term_cmd "htop" end, desc = "ToggleTerm htop" }
  maps.n["<leader>tp"] = { function() toggle_term_cmd "python" end, desc = "ToggleTerm python" }
  maps.n["<leader>tl"] = { function() toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" }
  maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  maps.n["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
  maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
end

-- Stay in indent mode
maps.v["<"] = { "<gv", desc = "unindent line" }
maps.v[">"] = { ">gv", desc = "indent line" }

-- Improved Terminal Mappings
maps.t["<esc>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" }
maps.t["jk"] = { "<C-\\><C-n>", desc = "Terminal normal mode" }
maps.t["<C-h>"] = { "<c-\\><c-n><c-w>h", desc = "Terminal left window navigation" }
maps.t["<C-j>"] = { "<c-\\><c-n><c-w>j", desc = "Terminal down window navigation" }
maps.t["<C-k>"] = { "<c-\\><c-n><c-w>k", desc = "Terminal up window navigation" }
maps.t["<C-l>"] = { "<c-\\><c-n><c-w>l", desc = "Terminal right window naviation" }

maps.n['mb'] = { function () require('fzf-lua').buffers() end, desc = 'fzf buffers' }
maps.n['mp'] = { function () require('fzf-lua').files() end, desc = 'fzf files' }
maps.n['mh'] = { function () require('fzf-lua').oldfiles() end, desc = 'fzf history' }
maps.n['mq'] = { function () require('fzf-lua').quickfix() end, desc = 'fzf quickfix' }
maps.n['mll'] = { function () require('fzf-lua').loclist() end, desc = 'fzf loclist' }
maps.n['ml'] = { function () require('fzf-lua').loclist() end, desc = 'fzf lines' }
maps.n['mt'] = { function () require('fzf-lua').tabs() end, desc = 'fzf tabs' }
maps.n['ma'] = { function () require('fzf-lua').args() end, desc = 'fzf args' }
maps.n['mg'] = { function () require('fzf-lua').grep() end, desc = 'fzf grep' }
maps.n['mgl'] = { function () require('fzf-lua').grep_last() end, desc = 'fzf grep_last' }
maps.n['mcw'] = { function () require('fzf-lua').cword() end, desc = 'fzf cword' }
maps.n['mcW'] = { function () require('fzf-lua').cWORD() end, desc = 'fzf cWORD' }
maps.n['mCW'] = { function () require('fzf-lua').cWORD() end, desc = 'fzf cWORD' }
maps.n['mgv'] = { function () require('fzf-lua').grep_visual() end, desc = 'fzf grep_visual' }
maps.n['mgp'] = { function () require('fzf-lua').grep_project() end, desc = 'fzf grep_project' }
maps.n['mcb'] = { function () require('fzf-lua').grep_curbuf() end, desc = 'fzf grep_curbuf' }
maps.n['mlcb'] = { function () require('fzf-lua').grep_lcurbuf() end, desc = 'fzf grep_lcurbuf' }
maps.n['mlg'] = { function () require('fzf-lua').live_grep() end, desc = 'fzf live_grep' }
maps.n['mlgr'] = { function () require('fzf-lua').live_grep_resume() end, desc = 'fzf live_grep_resume' }
maps.n['mlgg'] = { function () require('fzf-lua').live_grep_glob() end, desc = 'fzf live_grep_glob' }
maps.n['mlgn'] = { function () require('fzf-lua').live_grep_glob() end, desc = 'fzf live_grep_native' }
maps.n['mtag'] = { function () require('fzf-lua').tags() end, desc = 'fzf tags' }
maps.n['mbtag'] = { function () require('fzf-lua').btags() end, desc = 'fzf btags' }
maps.n['mbtg'] = { function () require('fzf-lua').tags_grep() end, desc = 'fzf tags_grep' }
maps.n['mbtgcw'] = { function () require('fzf-lua').tags_grep_cword() end, desc = 'fzf tags_grep_cword' }
maps.n['mtgcw'] = { function () require('fzf-lua').tags_grep_cword() end, desc = 'fzf tags_grep_cword' }
maps.n['mtgCW'] = { function () require('fzf-lua').tags_grep_cWORD() end, desc = 'fzf tags_grep_cWORD' }
maps.n['mtgv'] = { function () require('fzf-lua').tags_grep_visual() end, desc = 'fzf tags_grep_visual' }
maps.n['mtlg'] = { function () require('fzf-lua').tags_grep_visual() end, desc = 'fzf tags_live_grep' }
maps.n['mgls'] = { function () require('fzf-lua').git_files() end, desc = 'fzf git_files' }
maps.n['mgs'] = { function () require('fzf-lua').git_status() end, desc = 'fzf git_files' }
maps.n['mgc'] = { function () require('fzf-lua').git_commits() end, desc = 'fzf git_commits' }
maps.n['mgbc'] = { function () require('fzf-lua').git_bcommits() end, desc = 'fzf git_bcommits' }
maps.n['mgb'] = { function () require('fzf-lua').git_branches() end, desc = 'fzf git_branches' }
maps.n['mgst'] = { function () require('fzf-lua').git_stash() end, desc = 'fzf git_stash' }
maps.n['mr'] = { function () require('fzf-lua').resume() end, desc = 'fzf resume' }
maps.n['mbi'] = { function () require('fzf-lua').builtin() end, desc = 'fzf builtin' }
maps.n['mht'] = { function () require('fzf-lua').help_tags() end, desc = 'fzf help_tags' }
maps.n['mm'] = { function () require('fzf-lua').man_pages() end, desc = 'fzf man_pages' }
maps.n['mc'] = { function () require('fzf-lua').colorschemes() end, desc = 'fzf colorschemes' }
maps.n['mh'] = { function () require('fzf-lua').highlights() end, desc = 'fzf highlights' }
maps.n['mcmd'] = { function () require('fzf-lua').commands() end, desc = 'fzf commands' }
maps.n['ms'] = { function () require('fzf-lua').search_history() end, desc = 'fzf search_history' }
maps.n['mch'] = { function () require('fzf-lua').changes() end, desc = 'fzf changes' }
maps.n['mkey'] = { function () require('fzf-lua').keymaps() end, desc = 'fzf keymaps' }

-- harpoon
maps.n['<leader>ha'] = { function () require('harpoon.mark').add_file() end, desc = 'harpoon add_file' }
maps.n['<leader>hm'] = { function () require('harpoon.ui').toggle_quick_menu() end, desc = 'harpoon toggle_quick_menu' }
maps.n['<leader>ho'] = { function () require('harpoon.ui').nav_prev() end, desc = 'harpoon nav_prev' }
maps.n['<leader>hi'] = { function () require('harpoon.ui').nav_next() end, desc = 'harpoon nav_next' }

maps.n['mi'] = { '<cmd>setlocal foldmethod=indent<cr>', desc = 'foldmethod indent' }

astronvim.set_mappings(astronvim.user_plugin_opts("mappings", maps))
