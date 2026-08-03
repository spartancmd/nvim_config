
## System Dependencies
Following utilities are required on this system:
- make
- ripgrep (by BurntSushi)
- npm

## LSP
This config uses following LSP setup:
- [mason.nvim](https://github.com/mason-org/mason.nvim)
  - installs, updates, and removes LSP servers, formatters, debuggers (DAP), linters, and other external tools

- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)
  - ensures specified LSP servers are installed
  - automatically enables installed LSP servers

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - configures individual LSP servers

## TODO
- [ ] Write a better README.md
- [ ] Implement overseer (try replacing core/runner.lua)
- [ ] Find alternative dap config
    - [ ] (Finish debugger for python)
- [X] ~Implement a theme picker~
- [X] ~Implement lazydev~
