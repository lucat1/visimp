local L = require('visimp.layer').new_layer('lspformat')
local get_module = require('visimp.bridge').get_module
local layers = require('visimp.loader')

L.default_config = {
  -- Aplies an autocommand to fix the behavious when quitting and wiring.
  -- Because the formatter is async by deafult the code wouldn't be patched
  -- without this fix when wiring and closing the editor at the same time.
  wq_fix = true
}

function L.dependecies()
  return { 'lsp' }
end

function L.packages()
  return { 'lukas-reineke/lsp-format.nvim' }
end

function L.load()
  if L.config.wq_fix then
    -- Taken from https://github.com/lukas-reineke/lsp-format.nvim#wq-will-not-format
    vim.cmd [[cabbrev wq execute 'lua vim.lsp.buf.formatting_seq_sync()' <bar> wq]]
  end

  local lspformat = get_module('lsp-format')
  layers.get('lsp').on_attach(lspformat.on_attach)
  lspformat.setup(L.config or {})
end

return L
