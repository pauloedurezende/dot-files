return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    whitespace = {
      remove_blankline_trail = false,
    },
    exclude = {
      filetypes = { 'dashboard' },
    },
    scope = {
      show_start = false,
      show_end = false,
    },
  },
}
