local luasnip = require("luasnip")
local cmp = require('cmp')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_kinds = {
  Text          = ' ',
  Method        = ' ',
  Function      = ' ',
  Constructor   = ' ',
  Field         = '識',
  Variable      = '𝑋 ',
  Class         = ' ',
  Interface     = ' ',
  Module        = ' ',
  Property      = ' ',
  Unit          = ' ',
  Value         = ' ',
  Enum          = ' ',
  Keyword       = ' ',
  Snippet       = '﬌ ',
  Color         = ' ',
  File          = ' ',
  Reference     = ' ',
  Folder        = ' ',
  EnumMember    = ' ',
  Constant      = ' ',
  Struct        = ' ',
  Event         = ' ',
  Operator      = 'ﬦ' ,
  TypeParameter = ' ',
}

local cmp_config = {
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip  = '[Snip]',
        buffer   = '[Buf]',
        nvim_lua = '[Lua]',
        path     = '[Path]',
        calc     = '[Clc]',
        emoji    = '[Emj]',
        rg       = '[Rg]',
        tmux     = '[Tmux]'
      })[entry.source.name]

      return vim_item
    end,
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-p>']   = cmp.mapping.select_prev_item(),
    ['<C-k>']   = cmp.mapping.select_prev_item(),
    ['<C-n>']   = cmp.mapping.select_next_item(),
    ['<C-j>']   = cmp.mapping.select_next_item(),
    ['<C-d>']   = cmp.mapping.scroll_docs(4),
    ['<C-u>']   = cmp.mapping.scroll_docs(-4),
    ['<C-o>']   = cmp.mapping.complete(),
    ['<C-e>']   = cmp.mapping.close(),
    ['<CR>']    = cmp.mapping.confirm {
      behavior  = cmp.ConfirmBehavior.Replace,
      select    = true,
    },
    ["<Tab>"]   = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          cmp.confirm()
        end
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
      -- if cmp.visible() then
      --   cmp.select_next_item()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      -- elseif has_words_before() then
      --   cmp.complete()
      -- else
      --   fallback()
      -- end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'path'     },
    { name = 'buffer',
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
    },
    { name = 'tmux',
      option = {
        all_panes = true,
        label = '[tmux]',
        trigger_characters_ft = { markdown = { } }
      }
    },
    { name = 'luasnip' },
  },
}

cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup(cmp_config)

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
