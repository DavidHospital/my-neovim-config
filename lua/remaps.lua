vim.g.mapleader = " "

vim.keymap.set("n", "<leader>D", vim.cmd.Ex)

-- center screen after some motions
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "gd", "gdzz")

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- copy paste to * and + registers
vim.keymap.set('n', "<leader>y", "\"*y")
vim.keymap.set('n', "<leader>Y", "\"+y")
vim.keymap.set('n', "<leader>p", "\"*p")
vim.keymap.set('n', "<leader>P", "\"*P")

local function to_vulkan_symbol(word)
	if word:match("^[vV][kK]") then return word end

	if word:match("_(%l)") then
		return "vk" .. word:gsub("_(%l)", function(c) return c:upper() end):gsub("^%l", string.upper)
	else
		return "Vk" .. word
	end
end

-- create_device
vim.keymap.set("n", "<leader>vk", function()
	local symbol = to_vulkan_symbol(vim.fn.expand("<cword>"))

	local url = "https://registry.khronos.org/vulkan/specs/1.3-extensions/man/html/" .. symbol .. ".html"
	local cmd = "curl -sL '" .. url
		.. "' | w3m -dump -T text/html | sed -n '/^vk.*([0-9])\\|^Vk.*([0-9])/,/^Valid Usage$/p'"

	vim.system({ "sh", "-c", cmd }, { text = true }, function(result)
		vim.schedule(function()
			if not result.stdout or result.stdout == "" then
				vim.notify("No Vulkan docs found for: " .. symbol, vim.log.levels.WARN)
				return
			end
			local lines = vim.split(result.stdout, "\n")
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_set_option_value("filetype", "man", { buf = buf})
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
			local width = math.floor(vim.o.columns * 0.7)
			local height = math.floor(vim.o.lines * 0.7)
			local win = vim.api.nvim_open_win(buf, true, {
				relative = "editor",
				width = width,
				height = height,
				row = math.floor((vim.o.lines - height) / 2),
				col = math.floor((vim.o.columns - width) / 2),
				style = "minimal",
				border = "rounded",
				title = " " .. symbol .. " ",
				title_pos = "center",
			})

			vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf })
			vim.keymap.set("n", "<leader>h", function()
                vim.api.nvim_win_close(win, true)
                vim.cmd("topleft vsplit")
                local side_win = vim.api.nvim_get_current_win()
                vim.api.nvim_win_set_buf(side_win, buf)
                vim.api.nvim_win_set_width(side_win, 60)
                vim.keymap.set("n", "q", "<cmd>close<cr>", {buffer = buf})
            end, {buffer = buf})
		end)
	end)
end)
