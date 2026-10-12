local opt = vim.opt

opt.splitright = true

opt.splitbelow = true

opt.fixeol = false

opt.completeopt = 'menuone,noselect'

vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
-- Start with everything expanded; folds are opt-in per keystroke.
opt.foldlevel = 99

opt.wrap = false
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "TermClose", "TermLeave" }, {
    callback = function(args)
        -- Only real file buffers: a reload is meaningless for a terminal or
        -- scratch buffer, and checktime inside one (yazi's float, say) can
        -- reload and wipe buffers in the middle of an autocmd chain.
        if not vim.api.nvim_buf_is_valid(args.buf) or vim.bo[args.buf].buftype ~= "" then
            return
        end
        -- Notebooks are excluded: jupytext rewrites the .ipynb through an
        -- external process on every :w, so checktime sees a changed file and
        -- reloads the buffer. That re-runs the conversion and leaves molten's
        -- output anchors pointing at lines that no longer exist, which throws
        -- E966 out of image.nvim's renderer.
        if vim.api.nvim_buf_get_name(args.buf):match("%.ipynb$") then
            return
        end
        if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
            vim.cmd.checktime()
        end
    end,
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    callback = function()
        vim.notify("File changed on disk, buffer reloaded", vim.log.levels.INFO)
    end,
})
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.nu = true
opt.relativenumber = true
opt.statuscolumn = table.concat({
    "%s",
    [[%{%v:relnum == 0 ? "%#CursorLineNr#" : "%#LineNr#"%}]],
    [[%{v:virtnum > 0 ? "   " : printf("%3d", v:lnum)}]],
    " %#LineNr#",
    [[%{v:virtnum > 0 ? "  " : printf("%-2d", v:relnum)}]],
    "%C ",
})
opt.signcolumn = "yes"
