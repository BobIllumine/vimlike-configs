return {
	{
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "bash",
            "json",
            "markdown",
            "markdown_inline",
            "python",
            "javascript",
            "typescript",
            "html",
            "css",
            "rust",
            "toml",
            "hcl",
            "c",
            "cpp"
        }

        require("nvim-treesitter").install(ensure_installed)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = ensure_installed,
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
	}, 
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
				},
			})

			-- main branch no longer reads keymaps from setup(); map them explicitly
			local select = require("nvim-treesitter-textobjects.select")
			vim.keymap.set({ "x", "o" }, "af", function()
				select.select_textobject("@function.outer", "textobjects")
			end, { desc = "Around function" })
			vim.keymap.set({ "x", "o" }, "if", function()
				select.select_textobject("@function.inner", "textobjects")
			end, { desc = "Inside function" })
		end,
	}
}
