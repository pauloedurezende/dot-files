return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to Next Change' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to Previous Change' })

      -- actions - visual mode
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk {
          vim.fn.line '.',
          vim.fn.line 'v',
        }
      end, { desc = 'stage hunk' })

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk {
          vim.fn.line '.',
          vim.fn.line 'v',
        }
      end, { desc = 'reset hunk' })

      -- actions: normal mode
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage Hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset Hunk' })
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage Buffer' })
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset Buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview Hunk' })
      map('n', '<leader>hb', gitsigns.blame_line, { desc = 'Blame Line' })
      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff Against Index' })
      map('n', '<leader>hD', function()
        gitsigns.diffthis '@'
      end, { desc = 'Diff Against Last Commit' })

      -- toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle Show Blame Line' })
      map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = 'Toggle Show Deleted' })
    end,
  },
}
