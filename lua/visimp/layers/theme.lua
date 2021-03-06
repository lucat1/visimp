local L = require('visimp.layer').new_layer('theme')
local opt = require('visimp.bridge').opt

-- NOTE: in this context L.config is the theme function passed to lush
-- whereas L.theme is the lushified theme potentially used by other extensions

L.theme = nil
L.default_config = nil

function L.configure(theme)
  if theme == nil or theme == {} then
    error('No theme chosen')
  elseif type(theme) == 'table' then
    if #theme < 3 then
      error(
        'Theme array must be of format {package, theme, colorscheme, [lualine]}'
      )
    end
    L.theme = theme
  elseif type(theme) == 'function' then
    L.lush = theme
  else
    error('Invalid theme type: ' .. type(theme))
  end
end

function L.packages()
  local pkgs = { { 'rktjmp/lush.nvim', opt = true } }
  if type(L.theme) == 'table' and #L.theme >= 3 then
    table.insert(pkgs, L.theme[1])
  end
  return pkgs
end

function L.load()
  if L.lush ~= nil then
    vim.cmd('packadd lush.nvim')
    local ok, lush = pcall(require, 'lush')
    if not ok then
      error('Lush not installed:\n' .. lush)
    end

    L.theme = lush(L.lush(lush))
    lush(L.theme)
  elseif L.theme ~= nil then
    vim.cmd('colorscheme ' .. L.theme[2])
    opt('o', 'background', L.theme[3])
  end
end

function L.get_theme()
  return L.theme
end

return L
