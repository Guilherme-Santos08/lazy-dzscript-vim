return {
  {
    "folke/noice.nvim",
    ---@type NoiceConfig
    opts = {
      lsp = {
        signature = {
          auto_open = {
            trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
          },
        },
      },
    },
  },
}
