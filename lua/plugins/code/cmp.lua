return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false
      }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji"
    },
    keys = {
      {
        "<tab>",
        false,
        mode = { "i", "s" }
      },
      {
        "<s-tab>",
        false,
        mode = { "i", "s" }
      }
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Border
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
      }

      -- Cmp menu with icons
      opts.formatting = vim.tbl_extend("force", opts.formatting, {
        fields = { "kind", "abbr", "menu" },
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          local kind = item.kind

          item.kind = (icons[kind] or "?") .. " "
          item.menu = " (" .. kind .. ")"

          return item
        end
      })

      -- Key mappings
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-n>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior
        }),
        ["<C-p>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior
        }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true
        }, { 'i', 'c' })
      })
    end
  },
  {
    "L3MON4D3/LuaSnip",
    build = (not LazyVim.is_win())
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "nvim-cmp",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
          opts.snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          }
          table.insert(opts.sources, { name = "luasnip" })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    --  stylua: ignore
    keys = {
      -- { "<tab>", false, mode = { "i", "s" } },
      -- { "<s-tab>", false, mode = { "i", "s" } },
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
}