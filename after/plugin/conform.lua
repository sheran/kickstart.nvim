-- Override conform's format_on_save to combine the disable-list (HEAD) and
-- enable-list (upstream) patterns: c/cpp/zig never format, anything in
-- enabled_filetypes formats with a 500ms timeout, everything else is left alone.
local ok, conform = pcall(require, 'conform')
if not ok then return end

conform.setup {
  format_on_save = function(bufnr)
    local disable_filetypes = { c = true, cpp = true, zig = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    end
    local enabled_filetypes = {
      -- lua = true,
      -- python = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    end
    return nil
  end,
}
