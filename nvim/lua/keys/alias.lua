
-- vim.keymap.set is non-recursive by default (same as noremap = true)
local function mapper(mode)
	return function(key, command, desc)
		vim.keymap.set(mode, key, command, { desc = desc })
	end
end

nm = mapper('n')
im = mapper('i')
vm = mapper('v')
tm = mapper('t')
xm = mapper('x')
