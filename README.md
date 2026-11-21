# Neovim Configuration

A clean, modern, and high-performance Neovim configuration built with Lua, optimized for Neovim 0.10+ (tested on Neovim 0.12+).

---

## Preview

![Preview 1](https://github.com/Mccranky83/nvim-configs/assets/79263757/9c961207-5d4f-47f8-8eca-f309830d68a7)
![Preview 2](https://github.com/Mccranky83/nvim-configs/assets/79263757/0aa943ff-9cca-489c-b097-8fa07a430a15)
![Preview 3](https://github.com/Mccranky83/nvim-configs/assets/79263757/72283b1c-1971-447b-917e-247cef3e8688)

---

## Features

- **Plugin Management**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast, concurrent plugin loading and lockfile management.
- **Language Server Protocol (LSP)**:
  - Managed via [mason.nvim](https://github.com/williamboman/mason.nvim), [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim), and [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim).
  - Native Neovim diagnostic jumping (`vim.diagnostic.jump()`).
  - Integrated spelling and grammar checker powered by [harper-ls](https://github.com/Automattic/harper).
- **Syntax & Parsing**: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) with text objects and autotagging.
- **Completion & AI**:
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with snippets ([LuaSnip](https://github.com/L3MON4D3/LuaSnip)), path, buffer, and LSP sources.
  - [GitHub Copilot](https://github.com/zbirenbaum/copilot.lua) and [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) with cmp integration.
- **Formatting & Linting**: [conform.nvim](https://github.com/stevearc/conform.nvim) for auto-formatting and [nvim-lint](https://github.com/mfussenegger/nvim-lint).
- **Navigation & Fuzzy Finding**: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim), [oil.nvim](https://github.com/stevearc/oil.nvim), and [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua).
- **Markdown & Notes**: [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) with live browser synchronization.
- **Theme & Aesthetics**: Everforest color scheme, custom statusline ([lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)), buffer tabs ([bufferline.nvim](https://github.com/akinsho/bufferline.nvim)), and git decorations ([gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)).

---

## Prerequisites

Ensure the following tools are installed on your system:

| Dependency | Requirement / Purpose | Installation (macOS / Homebrew) |
| :--- | :--- | :--- |
| **Neovim** | `>= 0.10.0` (Recommended `0.12+`) | `brew install neovim` |
| **Git** | Repository & plugin cloning | Pre-installed / `brew install git` |
| **Node.js & npm** | LSP servers & markdown preview | `brew install node` |
| **ripgrep** | Telescope live grep | `brew install ripgrep` |
| **fd** | Telescope fast file search | `brew install fd` |
| **Nerd Font** | Icons across UI, lualine, bufferline | e.g. `brew install --cask font-jetbrains-mono-nerd-font` |

---

## Installation

1. Backup your existing configuration (if applicable):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository into your Neovim configuration directory:
   ```bash
   git clone git@github.com:Mccranky83/nvim-configs.git ~/.config/nvim
   ```

3. Launch Neovim:
   ```bash
   nvim
   ```
   *Lazy.nvim will automatically bootstrap and install all plugins. Mason will install configured LSP servers, linters, and formatters.*

4. Authenticate GitHub Copilot (first-time only):
   ```vim
   :Copilot auth signin
   ```

---

## Keybindings Reference

Leader key: `<Space>`

### General & Windows
| Keybinding | Action |
| :--- | :--- |
| `jk` (Insert mode) | Exit insert mode to normal mode |
| `<leader>nh` | Clear search highlight (`:nohl`) |
| `<leader>sv` | Split window vertically |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Equalize split window sizes |
| `<leader>sx` | Close current split window |
| `<leader>sm` | Toggle split window maximization |

### File Exploration & Navigation
| Keybinding | Action |
| :--- | :--- |
| `<leader>e` | Toggle file tree explorer (`nvim-tree`) |
| `-` | Open parent directory in buffer (`oil.nvim`) |
| `<leader>ff` | Find files (`telescope`) |
| `<leader>fs` | Live grep string across project (`telescope`) |
| `<leader>fc` | Grep string under cursor (`telescope`) |
| `<leader>fb` | List open buffers (`telescope`) |
| `<leader>fh` | Search Neovim help tags (`telescope`) |

### Tabs & Sessions
| Keybinding | Action |
| :--- | :--- |
| `<leader>to` | Open new tab |
| `<leader>tx` | Close current tab |
| `<leader>tn` | Next tab |
| `<leader>tp` | Previous tab |
| `<leader>wr` | Restore session (`auto-session`) |
| `<leader>ws` | Save session (`auto-session`) |

### Markdown & Database Tools
| Keybinding | Action |
| :--- | :--- |
| `<leader>mp` | Toggle live Markdown preview in browser |
| `<leader>md` | Toggle Database UI (`vim-dadbod-ui`) |
| `<leader>rs` | Restart active LSP server |

### Git Navigation
| Keybinding | Action |
| :--- | :--- |
| `<leader>gc` | Browse all git commits (`telescope`) |
| `<leader>gfc` | Browse git commits for current buffer |
| `<leader>gb` | Browse git branches |
| `<leader>gs` | Browse git status with live diff preview |

---

## Structure

```text
~/.config/nvim
├── init.lua                   # Entry point
├── lazy-lock.json             # Pinned plugin lockfile
└── lua/mccranky/
    ├── core/                  # Core Neovim options & global keymaps
    │   ├── keymaps.lua
    │   └── options.lua
    ├── lazy.lua               # Lazy.nvim plugin manager setup
    ├── lsp.lua                # Native diagnostic jump & LSP handlers
    └── plugins/               # Modular plugin configurations
        ├── colorscheme.lua
        ├── nvim-cmp.lua
        ├── telescope.lua
        ├── lsp/
        │   ├── lsp.lua
        │   └── mason.lua
        └── ...
```

---

## License

MIT License. See [LICENSE](LICENSE) for details.
