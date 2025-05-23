 local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end


-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
local luasnip = require("luasnip")
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end




local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufnr = event.buf
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    


  end,
})

--Mason configuration

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls','csharp_ls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
	lua_ls = function()
      require('lspconfig').lua_ls.setup({})
    end,
    csharp_ls = function()
	
      require('lspconfig').csharp_ls.setup({
	  
        cmd = {
          "csharp-ls"
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities()
    })
	

    end
  }
})


local lspkind = require('lspkind')

lspkind.init({
   
    mode = 'symbol_text',

   
    preset = 'codicons',

   
    symbol_map = {
      -- Class = '🅒',
  Class = '∴',
  -- Color = '☀',
  -- Color = '⛭',
  Color = '🖌',
  -- Constant = 'π',
  Constant = '𝜋',
  Constructor = '⬡',
  -- Constructor = '⌬',
  -- Constructor = '⎔',
  -- Constructor = '⚙',
  -- Constructor = 'ᲃ',
  Enum = '🔗',
  EnumMember = '⯐',
  Event = '!',
  -- Field = '→',
  -- Field = '∴',
  Field = '🠶',
  File = '📃',
  Folder = '📁',
  Function = 'ƒ',
  -- Function = 'λ',
  --Interface = '',
  Interface = '✎',
  Keyword = '🗝',
  --Method = '𝘮',
   Method = 'λ',
  Module = '📦',
  Operator = '≠',
  -- Operator = '±',
  -- Property = '::',
  Property = '∷',
  -- Reference = '⌦',
  Reference = '⊷',
  -- Reference = '⊶',
  -- Reference = '⊸',
  -- Snippet = '',
  -- Snippet = '↲',
  -- Snippet = '♢',
  -- Snippet = '<>',
  Snippet = '{}',
  Struct = '',
  --Text = '#',
  -- Text = '♯',
  -- Text = 'ⅵ',
   Text = "¶",
  -- Text = "𝒯",
  -- Text = "𝓣",
  -- Text = "𐄗",
  TypeParameter = '×',
  Unit = '()',
  -- Value           =
  -- Variable = '𝛼',
  -- Variable = 'χ',
  Variable = '𝓧',
  -- Variable = '𝛸',
  -- Variable = 'α',
  -- Variable = '≔',    },
}}
)

--Autocomplition
local cmp = require('cmp')
cmp.setup({
    experimental = {
        ghost_text = true,
        

    },
  sources = {
    {name = 'nvim_lsp'},
  },  
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
      border = "single"
      
    },
   documentation = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      border = "single"

   },    
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      
      local source = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[LaTeX]",
      })[entry.source.name]

      kind.menu = "    (" .. (strings[2] or "") .. ") " .. source
     
      

      return kind
    end,
  },

snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  
  mapping = cmp.mapping.preset.insert({
    --Autocomplition keybinds
 -- confirm completion
 
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      --elseif vim.fn["vsnip#available"](1) == 1 then
      --feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),



    ["<CR>"] = cmp.mapping({
        i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
                fallback()
            end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),

    -- scroll up and down the documentation window
    ['<C-j>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),  

  }),


})
