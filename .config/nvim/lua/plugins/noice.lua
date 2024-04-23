local function myMiniView(pattern, kind)
	kind = kind or ""
	return {
		view = "mini",
		filter = {
			event = "msg_show",
			kind = kind,
			find = pattern,
		},
	}
end

return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        messages = {
            view_search = "mini",
        },
        routes = {
            {
                view = "notify",
                filter = { event = "msg_showmode" },
            },
            {
                filter = {
                    event = "notify",
                    warning = true,
                    find = "failed to run generator.*is not executable",
                },
                opts = { skip = true },
            },
            myMiniView("Already at .* change"),
            myMiniView("written"),
            myMiniView("yanked"),
            myMiniView("more lines?"),
            myMiniView("fewer lines?"),
            myMiniView("fewer lines?", "lua_error"),
            myMiniView("change; before"),
            myMiniView("change; after"),
            myMiniView("line less"),
            myMiniView("lines indented"),
            myMiniView("No lines in buffer"),
            myMiniView("search hit .*, continuing at", "wmsg"),
            myMiniView("E486: Pattern not found", "emsg"),
        },
    }
}