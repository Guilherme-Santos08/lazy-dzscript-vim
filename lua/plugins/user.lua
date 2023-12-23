-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- transparent
  {
    "xiyaowong/transparent.nvim",
    cmd = {
      "TransparentEnable",
      "TransparentDisable",
      "TransparentToggle",
    },
  },

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy"
  },
  'f-person/git-blame.nvim',


  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
      ██████╗ ███████╗███████╗ ██████╗██████╗ ██╗██████╗ ████████╗,
      ██╔══██╗╚══███╔╝██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝,
      ██║  ██║  ███╔╝ ███████╗██║     ██████╔╝██║██████╔╝   ██║   ,
      ██║  ██║ ███╔╝  ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ,
      ██████╔╝███████╗███████║╚██████╗██║  ██║██║██║        ██║   ,
      ╚═════╝ ╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ,
                      Sera que vou ficar bom no VIM?.             ,
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
