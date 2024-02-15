local cmp = require('cmp')

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local formatting_style = {
  fields = { 'abbr', 'kind', 'menu' },

  format = function (_, item)
    local icons = require 'custom.icons.lspkind'
    local icon = icons[item.kind] or ''

    icon = ' ' .. icon .. ' '
    item.menu = true and '  (' .. item.kind .. ')' or ''
    item.kind = string.format("%s %s", icon, true and item.kind or "")

    return item
  end
}

local opts = {
  completion = {
    completeopt = "menu,menuone,noinsert,noselect",
  },
  window = {
    completion = {
      side_padding = 1,
      border = border "CmpBorder",
      winhighlight = 'Normal:CmpPmenu,CursorLine:CmpSel,Search:None',
      scrollbar = false,
    },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  formatting = formatting_style,

  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  history = true,
  updateevents = "TextChanged,TextChangedI",

  view = {
    entries = {
      name = 'custom',
      selection_order = 'near_cursor',
    },
  },
  sources = {
    {
      name = 'nvim_lsp'
    },
    {
      name = 'luasnip'
    },
    {
      name = 'crates'
    },
    {
      name = 'nvim_lua'
    },
    {
      name = 'path'
    },
    {
      name = 'buffer'
    },
  },
}

return opts