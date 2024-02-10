return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  opts = function ()
    require('luasnip.loaders.from_lua').load()

    vim.api.nvim_create_autocmd("InsertLeave", {
      callback = function()
        if
          require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
        then
            require("luasnip").unlink_current()
        end
      end
    })
  end,
  config = function (_, opts)
    require('luasnip').setup(opts)
  end
}
