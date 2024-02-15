local opts = {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
    ["luasnip"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
}

return opts
