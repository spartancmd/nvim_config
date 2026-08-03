# Neovim Configuration

A modular Neovim configuration focused on maintainability, stability, and productivity.

The configuration is organized around a small set of design principles to keep it easy to understand, extend, and maintain over time. Instead of collecting plugins, the focus is on building a clean and predictable editing environment.

## Philosophy

This configuration is built around a few simple principles:

- **Maintainability** - every module has a clear responsibility.
- **Modularity** - plugin configuration is isolated from the core configuration.
- **Stability** - prefer well-maintained plugins and avoid unnecessary complexity.
- **Productivity** - include plugins only when they provide a clear benefit.
- **Platform Independence** - the configuration should work on Linux, macOS, and Windows whenever possible.
- **No Bloat** - avoid plugins which won't make the workflow more productive (although fun stuff may be included)

## Architecture

The configuration is divided into two major parts:

- **Core** - editor configuration that is independent of plugins.
- **Plugins** - plugin specifications grouped by responsibility.

Keeping these concerns separated makes the configuration easier to understand, maintain, and extend.

### Initialization

Neovim loads the configuration in the following order:

1. `init.lua`
   - Entry point of the configuration.

2. `lua/core/init.lua`
   - Loads the core modules.

3. Core modules
   - `options.lua`
   - `autocmds.lua`
   - `keymaps.lua`
   - `highlights.lua`
   - `theme.lua`
   - `lazy.lua`

4. `lua/plugins/init.lua`
   - Registers all plugin specifications.

5. `lazy.nvim`
   - Resolves dependencies and loads plugins according to their loading conditions.

The startup process intentionally initializes the editor before loading plugins. This provides a predictable environment for every plugin and keeps the core configuration independent from plugin-specific code.

### Directory Layout

```text
lua/
├── core/
└── plugins/
```

#### `core/`

Contains editor configuration that is required before plugins are loaded.

Modules inside this directory should remain independent from plugin-specific functionality.

#### `plugins/`

Contains all plugin specifications.

Plugins are grouped by their responsibility rather than by plugin name, making related functionality easier to discover and maintain.

### Plugin Architecture

```text
plugins/
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

Each category represents a functional area of the editor.

Keeping plugins grouped by responsibility instead of author or plugin name reduces coupling and makes it easier to replace or extend individual features over time.

### Design Decisions

The project follows a small set of architectural rules:

- Every module should have a single responsibility.
- Keep the core configuration independent from plugins.
- Prefer one configuration file per plugin.
- Group plugins by functionality rather than plugin name.
- Prefer extending existing modules over introducing new ones.
- Keep platform-specific behavior isolated whenever possible.

## Custom Components

Besides third-party plugins, this configuration contains a few custom components.

### Runner

`core/runner.lua` provides a lightweight interface for compiling and running projects directly from Neovim.

The goal is to support common development workflows without introducing unnecessary complexity.

### Theme Management

`core/theme.lua` is responsible for loading and persisting the active colorscheme.

This keeps theme selection independent from the individual theme plugins.

### Theme Picker

The Telescope configuration includes a custom theme picker for switching between installed colorschemes interactively.

Theme selection is integrated with the theme management module so that the selected theme persists across restarts.

### Custom Highlights

`core/highlights.lua` contains all custom highlight overrides.

Keeping highlight definitions separate from the colorscheme configuration simplifies maintenance and makes theme-specific adjustments easier.

## Extending the Configuration

### Adding Plugins

Plugins should be placed in the category that best matches their responsibility.

Whenever practical:

- create one configuration file per plugin;
- configure lazy-loading when appropriate;
- avoid overlapping functionality with existing plugins.

### Language Servers

Language servers and external development tools are managed through Mason.

Responsibilities are divided as follows:

| Component | Responsibility |
|-----------|----------------|
| `mason.nvim` | Installs and manages external tools |
| `mason-lspconfig.nvim` | Ensures required language servers are available |
| `nvim-lspconfig` | Configures individual language servers |

Language-specific configuration should remain minimal unless custom behavior is required.

### Themes

Installed themes are located in `lua/plugins/themes`.

The active theme is managed through `core/theme.lua`, while interactive theme selection is provided through Telescope.

## Productivity Features

The configuration focuses on a small number of tools that improve the editing workflow.

### Navigation

- Telescope
- Oil

### Editing

- mini.nvim
- Treesitter
- UFO
- Autotag

### Language Support

- LSP
- Blink
- Conform

### Diagnostics

- Trouble
- Inline Diagnostics

### Debugging

- nvim-dap
- dap-ui

### User Interface

- Lualine
- Noice
- Snacks
- Which-Key
- Notify


## System Dependencies

The following external tools are expected to be available:

| Tool | Purpose |
|------|---------|
| `git` | Plugin management |
| `make` | Building native plugin dependencies |
| `ripgrep` | Telescope live grep |
| `npm` | Node-based language servers and tools |

### Platform Notes

The configuration is intended to work across Linux, macOS, and Windows.

Platform-specific tooling is intentionally kept outside the configuration whenever possible.

On Windows, this configuration is primarily developed and tested using the MSYS2 UCRT64 environment.

## Conventions

When extending this configuration, try to follow these conventions:

- Keep modules small and focused.
- Avoid plugin-specific code inside `core/`.
- Prefer native Neovim functionality when practical.
- Only introduce new plugins when they solve a real problem.
- Favor readability over clever abstractions.


## TODO

- [ ] Improve the debugging workflow.
- [ ] Implement testing
