return {
  "neovim/nvim-lspconfig",
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
	expand = function(args)
	  vim.fn["vsnip#anonymous"](args.body)
	end,
      },
      window = {
	completion = cmp.config.window.bordered(),
	documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.close(),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'vsnip' },
      }, {
	{ name = 'buffer' },
	{ name = 'path' }
      })
    })
    local powershell_lsp_path = 'C:\\Users\\nmailhot\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services\\PowerShellEditorServices\\Start-EditorServices.ps1'
    require'lspconfig'.powershell_es.setup{

      cmd = {
	'pwsh', '-NoLogo', '-NoProfile', '-Command',
	powershell_lsp_path,
	'-HostName', 'Neovim',
	'-HostProfileId', 'nvim-lsp',
	'-HostVersion', '1.0.0',
	'-LogPath', vim.fn.stdpath('cache') .. '/pses.log',
	'-LogLevel', 'Normal',
	'-Stdio'
      },
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = {
	powershell = {
	  codeFormatting = {
	    autoCorrectAliases = true,
	    addWhitespaceAroundOperator = true,
	    addWhitespaceBeforeAndAfterKeyword = true,
	    trimWhitespaceAroundPipe = true
	  },
	},
      },
    }
  end,

}
