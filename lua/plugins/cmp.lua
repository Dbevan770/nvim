return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'saadparwaiz1/cmp_luasnip' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lua'},
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
  },
  opts = function ()
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

    return {
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
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ['<Tab>'] = cmp.mapping(function (fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(
            vim.api.nvim_replace_termcodes(
            "<Plug>luasnip-expand-or-jump",
            true,
            true,
            true
            ),
            ""
            )
          else
            fallback()
          end
        end,
        {
          "i",
          "s"
        }),
        ['<S-Tab>'] = cmp.mapping(function (fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(
            vim.api.nvim_replace_termcodes(
            "<Plug>luasnip-expand-or-jump",
            true,
            true,
            true
            ),
            ""
            )
          else
            fallback()
          end
        end,
        {
          "i",
          "s",
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
  end,
}
