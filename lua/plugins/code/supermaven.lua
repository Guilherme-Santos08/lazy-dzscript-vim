return {
  'supermaven-inc/supermaven-nvim',
  opts = {
    keymaps = {
      accept_suggestion = '<C-a>',
      clear_suggestion = "<c-x>",
      accept_word = "<c-q>",
    },
    ignore_filetypes = { cpp = true },
    color = {
      suggestion_color = "#FFC0CB",
      cterm = 244,
    },
  },
}