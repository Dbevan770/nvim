local config = require("core.utils").load_config()

local default_plugins = {}

if #config.plugins > 0 then
	table.insert(default_plugins, { import = config.plugins })
end

require("lazy").setup(default_plugins, config.lazy_nvim)
