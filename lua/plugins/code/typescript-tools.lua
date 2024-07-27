return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = false,
        quotePreference = "auto",
      },
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
    },
  },
}
