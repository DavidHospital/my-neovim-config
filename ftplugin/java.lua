local jdtls_path = vim.fn.expand("~/.local/share/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository")
-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local home = os.getenv('HOME')
local workspace_dir = home .. '/.local/share/eclipse' .. project_name

local config = {
    cmd = {
		jdtls_path .. "/bin/jdtls",
		'-data', workspace_dir,
	},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
