return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "tailwindcss@0.14.6",
    },
    servers = {
      eslint = {
        settings = {
          workingDirectory = { mode = "auto" },
          useESLintClass = false,
          experimental = {
            useFlatConfig = false,
          },
        },
      },
    },
  },
}
