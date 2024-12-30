return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- Check if the gitsigns module is available
    local status_ok, gitsigns = pcall(require, 'gitsigns')
    if not status_ok then
      vim.notify('Failed to load gitsigns.nvim', vim.log.levels.ERROR)
      return
    end

    -- Function to map keys
    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Define the configuration options for gitsigns
    local gitsigns_options = {
      on_attach = function(bufnr)
        -- Key mappings for gitsigns
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to Next Change', buffer = bufnr })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to Previous Change', buffer = bufnr })

        -- Actions - visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk {
            vim.fn.line '.',
            vim.fn.line 'v',
          }
        end, { desc = 'Stage Hunk', buffer = bufnr })

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk {
            vim.fn.line '.',
            vim.fn.line 'v',
          }
        end, { desc = 'Reset Hunk', buffer = bufnr })

        -- Actions - normal mode
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage Hunk', buffer = bufnr })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset Hunk', buffer = bufnr })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage Buffer', buffer = bufnr })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Undo Stage Hunk', buffer = bufnr })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset Buffer', buffer = bufnr })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview Hunk', buffer = bufnr })
        map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'Blame Line', buffer = bufnr })
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle Blame', buffer = bufnr })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff This', buffer = bufnr })
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = 'Diff This ~', buffer = bufnr })
        map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'Toggle Deleted', buffer = bufnr })
      end
    }

    -- Setup gitsigns with the provided options
    gitsigns.setup(gitsigns_options)
  end,
}
