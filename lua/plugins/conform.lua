return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}
