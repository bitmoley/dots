vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  -- colourscheme + statusline
  { src = "https://github.com/rose-pine/neovim",                name = "rose-pine" },
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",

  -- editing
  "https://github.com/windwp/nvim-autopairs",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

  -- completion
  { src = "https://github.com/saghen/blink.cmp",                version = vim.version.range("1.*") },
  "https://github.com/rafamadriz/friendly-snippets",

  -- lsp configs
  "https://github.com/neovim/nvim-lspconfig",

  -- picker
  { src = "https://github.com/nvim-mini/mini.nvim", version = vim.version.range("*") },
})

-- plugin setup
require("nvim-autopairs").setup()

require("lualine").setup()

require("mini.pick").setup()

require("rose-pine").setup({
  styles = {
    transparency = true, -- Enables a transparent background
  },
})

---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup({
  keymap = { preset = "default" },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    menu = {
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
    },
    documentation = {
      auto_show = true,
      window = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
