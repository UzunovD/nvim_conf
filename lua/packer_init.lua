-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Автосохранение
  use 'Pocco81/AutoSave.nvim'
  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Indent line
  --use 'lukas-reineke/indent-blankline.nvim'

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Tag viewer
  use 'preservim/tagbar'

  -- Treesitter interface
--  use {
--    'nvim-treesitter/nvim-treesitter',
--    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
--  }

  -- Color schemes
  use 'navarasu/onedark.nvim'
  use 'tanvirtin/monokai.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- Statusline
  use {
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup{}
    end
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

-- плагин для простого комментирования кода с помошью gc
use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}

-----------------------------------------------------------
-- PYTHON
-----------------------------------------------------------
-- Шапка с импортами приводим в порядок
use 'fisadev/vim-isort'
-- Поддержка темплейтом jinja2
use 'mitsuhiko/vim-jinja'


-----------------------------------------------------------
-- HTML и CSS
-----------------------------------------------------------
-- Подсвечивает закрывающий и откры. тэг. Если, где-то что-то не закрыто, то не подсвечивает.
use 'idanarye/breeze.vim'
-- Закрывает автоматом html и xml тэги. Пишешь <h1> и он автоматом закроется </h1>
use 'alvan/vim-closetag'
-- Подсвечивает #ffffff
use 'ap/vim-css-color'

-- Даже если включена русская раскладка vim команды будут работать
use 'powerman/vim-plugin-ruscmd'
-- 'Автоформатирование' кода для всех языков
use 'Chiel92/vim-autoformat'
-- Переводчик рус - англ
use 'skanehira/translate.vim'
-- Обрамляет или снимает обрамление. Выдели слово, нажми S и набери <h1>
use 'tpope/vim-surround'
-- Считает кол-во совпадений при поиске
use 'google/vim-searchindex'
-- Может повторять через . vimsurround
use 'tpope/vim-repeat'
-- Стартовая страница, если просто набрать vim в консоле

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
