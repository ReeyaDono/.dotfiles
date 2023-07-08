
return {
	-- nvim-tree
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {-- ignore_buffer_on_setup = true,
			view = {
				side = "right",
				width = 40,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},}
	end,
}

