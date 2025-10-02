return{
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
  }
}
}
