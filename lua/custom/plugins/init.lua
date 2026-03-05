-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  --{
  --  'rebelot/kanagawa.nvim',
  --  event = 'VimEnter',
  --  config = function()
  --    require('kanagawa').setup {}
  --    vim.cmd 'colorscheme kanagawa-dragon'
  --  end,
  --},
  --{
  --  'nyoom-engineering/oxocarbon.nvim',
  --  -- Add in any other configuration;
  --  event = 'VimEnter',
  --  --   config = bar
  --  --   end,
  --  config = function()
  --    vim.opt.background = 'dark'
  --    vim.cmd 'colorscheme oxocarbon'
  --  end,
  --},
  {
    'Shatur/neovim-session-manager',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    config = function()
      local config = require 'session_manager.config'
      require('session_manager').setup {
        autoload_mode = config.AutoloadMode.Disabled, -- other options are CurrentDir, LastSession, GitSession
        autosave_last_session = false,
        autosave_only_in_session = false,
      }
    end,
    keys = {
      { '<leader>ml', '<cmd>SessionManager load_session<cr>', desc = '[M]anager [L]oad session' },
      { '<leader>ms', '<cmd>SessionManager save_current_session<cr>', desc = '[M]anager [S]ave session' },
      { '<leader>md', '<cmd>SessionManager delete_session<cr>', desc = '[M]anager [D]elete session' },
      { '<leader>mc', '<cmd>SessionManager load_current_dir_session<cr>', desc = '[M]anager load [C]urrent dir session' },
      { '<leader>mL', '<cmd>SessionManager load_last_session<cr>', desc = '[M]anager [L]oad last session' },
    },
  },
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {},
    ---@diagnostic enable: missing-fields
    lazy = false,
  },
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = true,
    keys = {
      { '<leader>a', nil, desc = 'AI/Claude Code' },
      { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
      { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
      { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
      { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
      { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
      { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
      { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
      {
        '<leader>as',
        '<cmd>ClaudeCodeTreeAdd<cr>',
        desc = 'Add file',
        ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
      },
      -- Diff management
      { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
      { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
    },
  },
  -- Unfortunately, would not work with blink
  --{
  --  'vim-ctrlspace/vim-ctrlspace',
  --  lazy = false,
  --  init = function() vim.g.CtrlSpaceDefaultMappingKey = '<C-space> ' end,
  --},
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle file tree' },
    },
  },
}
