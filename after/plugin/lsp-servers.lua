vim.lsp.config('gopls', {})
vim.lsp.config('zls', { filetypes = { 'zig', 'zir' } })

vim.lsp.enable('gopls')
vim.lsp.enable('zls')

-- gopls is auto-installed via mason; zls is expected to be installed on the system.
local ok, mti = pcall(require, 'mason-tool-installer')
if ok then
  mti.setup { ensure_installed = { 'gopls' } }
end
