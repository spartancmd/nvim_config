# Neovim Configuration

A personal Neovim configuration focused on C++, Python and modern web development.

The goal of this configuration is to provide a lightweight, modular and maintainable development environment. New plugins are only added when they solve an actual development problem.

# Philosophy

This configuration follows a few simple principles:

- Prefer Neovim defaults whenever possible.
- Keep plugins minimal.
- Configure only what is needed.
- Organize plugins by responsibility.
- Build workflows instead of collecting plugins.
- Prefer understanding over convenience.

# Directory Structure

```text
lua/
├── core/
│   ├── autocmds.lua
│   ├── highlights.lua
│   ├── init.lua
│   ├── keymaps.lua
│   ├── lazy.lua
│   ├── options.lua
│   ├── runner.lua
│   └── theme.lua
│
└── plugins/
    ├── completion/
    ├── debugging/
    ├── diagnostics/
    ├── editing/
    ├── formatting/
    ├── git/
    ├── lsp/
    ├── navigation/
    ├── themes/
    └── ui/
```

## `core`

| File | Purpose |
|------|---------|
| `options.lua` | General Neovim options |
| `keymaps.lua` | Global keymaps |
| `autocmds.lua` | Custom autocommands |
| `highlights.lua` | Highlight overrides |
| `runner.lua` | Custom build and run utilities |
| `theme.lua` | Persists the selected colorscheme |
| `lazy.lua` | Bootstraps Lazy.nvim |

# Plugin Organization

Plugins are grouped by responsibility instead of alphabetically.

This makes the configuration easier to navigate and extend over time.

# Custom Features

## Runner

The configuration intentionally uses a custom `runner.lua` instead of Overseer.

The runner is language-aware rather than project-aware.

### Supported Languages

- C++ (CMake)
- Python

### Features

- Build C++ projects
- Run executables
- Build & Run
- Execute the current Python file
- Uses the integrated Snacks terminal

Project-specific commands are exposed through **local leader keymaps**, so they are only available when relevant.

## Theme Picker

Themes are selected through Telescope's built-in colorscheme picker.

The selected colorscheme is automatically persisted and restored on the next startup.

> Some colorschemes may require adjusting the terminal color theme for the best appearance.

## Oil

Oil replaces the traditional file explorer.

Instead of opening a tree sidebar, directories are edited as normal buffers.

Open the parent directory with:

```text
-
```

## Telescope

Telescope is used for:

- Find Files
- Live Grep
- Buffers
- Help Tags
- Notifications
- Theme Picker

# Development

## C++

### Requirements

- CMake
- `clangd`
- A C/C++ compiler (`clang`, `gcc` or MSVC)
- `make` or `ninja`

> `clangd` only provides language server functionality. A compiler toolchain must still be installed separately.

### Supported Features

- LSP
- Completion
- Formatting
- Diagnostics
- Build & Run
- Git integration
- Folding

Debugging support is available but still evolving.

## Python

### Requirements

- `pyright`

### Supported Features

- LSP
- Completion
- Formatting
- Diagnostics
- Execute current file

## Web Development

Currently used for:

- HTML
- CSS
- JavaScript
- TypeScript
- React

### Supported Features

- LSP
- Completion
- Formatting
- Diagnostics
- AutoTag
- Git integration

Language servers are managed through Mason.

# System Dependencies

Required:

- `make`
- `ripgrep`
- `npm`

Depending on the languages and frameworks being used, additional external tools may be required.

# Design Decisions

Some intentional design decisions:

- Telescope instead of Snacks Picker.
- Oil instead of a traditional file tree.
- Git operations are intentionally performed through the command line.
- Custom `runner.lua` instead of Overseer.
- Plugin defaults are preferred over unnecessary configuration.
- Plugins are added incrementally as new requirements arise.

# TODO

- [ ] Improve clipboard workflow
- [ ] Think about how to manage testing
- [ ] Revisit DAP configuration
    - [ ] Fix python debuging crashing
