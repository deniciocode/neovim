return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        init_options = {
          addonSettings = {
            -- Don't prompt "You have pending migrations" on attach/reload;
            -- during a git rebase migrations come and go constantly.
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
      },
    },
  },
}
