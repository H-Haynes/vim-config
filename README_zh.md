# Rafael Bodill 的 Neovim 配置

一个精简且强大的 Neovim 配置，启动时间仅需 **30–45ms**。
推荐使用 **Neovim ≥ 0.10**（基于 [LazyVim]💤）。

⚙️ 想要自定义或扩展？参见 [扩展配置](#扩展配置)。

> 推荐你 fork 本仓库，根据自己的习惯调整。
> 学会修改和管理 Neovim 配置是很有价值的技能。
> 本配置汇集了我多年来的经验，你可以将其作为远程上游参考，也可以仅采纳部分内容。

<details>
  <summary>
    <strong>目录</strong>
    <small><i>(🔎 点击展开/收起)</i></small>
  </summary>

<!-- vim-markdown-toc GFM -->

* [特性](#特性)
* [截图](#截图)
* [前置依赖](#前置依赖)
* [安装](#安装)
* [安装 LSP、DAP、Linters、Formatters](#安装-lspdaplintersformatters)
  * [语言服务器（LSP）](#语言服务器lsp)
  * [推荐 LSP](#推荐-lsp)
  * [推荐 Linter](#推荐-linter)
  * [推荐 Formatter](#推荐-formatter)
  * [推荐字体](#推荐字体)
* [升级](#升级)
* [结构](#结构)
* [扩展配置](#扩展配置)
  * [扩展：配置](#扩展配置-1)
  * [推荐 LSP](#推荐-lsp-1)
  * [推荐 Linter](#推荐-linter-1)
  * [推荐 Formatter](#推荐-formatter-1)
* [推荐字体](#推荐字体-1)
* [升级](#升级-1)
* [结构](#结构-1)
* [扩展](#扩展)
  * [扩展：配置](#扩展配置-2)
* [扩展插件（Extra Plugins）](#扩展插件extra-plugins)
  * [扩展插件：编码（Coding）](#扩展插件编码coding)
  * [扩展插件：配色方案（Colorscheme）](#扩展插件配色方案colorscheme)
  * [扩展插件：编辑器（Editor）](#扩展插件编辑器editor)
  * [扩展插件：Git](#扩展插件git)
  * [扩展插件：语言支持（Lang）](#扩展插件语言支持lang)
  * [扩展插件：LSP](#扩展插件lsp)
  * [扩展插件：Org](#扩展插件org)
  * [扩展插件：Treesitter](#扩展插件treesitter)
  * [扩展插件：UI](#扩展插件ui)
  * [LazyVim 扩展插件](#lazyvim-扩展插件)
* [自定义快捷键（Custom Key-mappings）](#自定义快捷键custom-key-mappings)
  * [选择器（Picker）](#选择器picker)
  * [功能切换（Toggle Features）](#功能切换toggle-features)
  * [导航（Navigation）](#导航navigation)
  * [选择（Selection）](#选择selection)
  * [跳转（Jump To）](#跳转jump-to)
  * [缓冲区（Buffers）](#缓冲区buffers)
  * [剪贴板（Clipboard）](#剪贴板clipboard)
  * [自动补全（Auto-Completion）](#自动补全auto-completion)
  * [LSP（语言服务器协议）](#lsp语言服务器协议)
  * [诊断（Diagnostics）](#诊断diagnostics)
  * [Coding](#coding)
  * [搜索、替换与差异（Search, Substitute, Diff）](#搜索替换与差异search-substitute-diff)
  * [命令与历史（Command & History）](#命令与历史command--history)
  * [文件操作](#文件操作)
  * [窗口管理](#窗口管理)
  * [插件与工具](#插件与工具)
    * [插件：Mini.Surround](#插件minisurround)
    * [插件：Gitsigns](#插件gitsigns)
    * [插件：Diffview](#插件diffview)
    * [插件：Neo-Tree](#插件neo-tree)
    * [插件：Marks](#插件marks)
    * [插件：Zk](#插件zk)
* [参考链接](#参考链接)

<!-- vim-markdown-toc -->
</details>

## 特性

* 启动极快——插件几乎全部 **按需延迟加载**
* 功能强大，保持轻量级
* 插件管理采用 [folke/lazy.nvim]（`:Lazy` 或 <kbd>Space</kbd>+<kbd>l</kbd>）
* 使用 `:Mason` 或 <kbd>Space</kbd>+<kbd>cm</kbd> 管理 LSP、DAP、Linter、Formatter
* LSP 配置基于 [nvim-lspconfig]
* [telescope.nvim] 驱动的工作流（试试 <kbd>;</kbd>+<kbd>f</kbd>）
* 自定义右键上下文菜单（<kbd>;</kbd>+<kbd>c</kbd>）
* 支持 [blink.cmp] 或 [nvim-cmp] 自动补全
* [hedyhli/outline.nvim] 结构视图
* 内置 Git 支持（[gitsigns.nvim]、[diffview.nvim] 等）
* [persistence.nvim] 会话管理
* 状态栏和标签栏简洁但信息丰富
* 多种高级配色方案，自动记忆上次主题

## 截图

![Vim screenshot](http://rafi.io/img/project/vim-config/features.png)

## 前置依赖

必需：

* [git](https://git-scm.com/) ≥ 2.19.0
* [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) ≥ v0.10.0

推荐安装：

* [bat]
* [fd]
* [fzf]
* [ripgrep]
* [zoxide]

## 安装

1. 克隆仓库到 `~/.config/nvim`：

   ```bash
   mkdir -p ~/.config
   git clone git@github.com:H-Haynes/vim-config.git ~/.config/nvim
   cd ~/.config/nvim
   ```

2. 直接运行 `nvim`（首次启动会自动安装所有插件）

   推荐在 Neovim 内执行 `:checkhealth` 检查环境。

3. 在 Neovim 里运行 `:LazyExtras`，按 <kbd>x</kbd> 安装扩展插件。

## 安装 LSP、DAP、Linters、Formatters

使用：
`:Mason` 或 <kbd>Space</kbd>+<kbd>cm</kbd>

可用于安装和管理：

- LSP 服务器
- DAP 调试器
- Linter
- Formatter

更多文档：
`:h mason.nvim` 或访问 [mason-org/mason.nvim]

### 语言服务器（LSP）

你可以通过以下方式安装语言服务器：

- 使用 Mason UI：`:Mason`
- 命令行：`:MasonInstall <name>`
- 语言服务器快捷命令：`:LspInstall <name>`（Tab 可补全）

官方资源：

- Mason 包列表: https://mason-registry.dev/registry/list
- LSP 映射表：`mason-lspconfig.nvim` 文档
- `:h mason-lspconfig-server-map`

部分语言服务器需要 `npm`、`curl` 等外部工具。

自定义 LSP 配置示例见：
`lua/rafi/plugins/lsp/init.lua`

---

### 推荐 LSP

以下是我日常使用、稳定且高效的语言服务器推荐：

| 语言                    | 推荐 LSP               | 说明                     |
| ----------------------- | ---------------------- | ------------------------ |
| Bash                    | `bash-language-server` | 轻量、可靠               |
| C / C++                 | `clangd`               | 功能强大、广泛使用       |
| CSS / Less / SCSS       | `cssls`                | 前端开发常用             |
| Docker                  | `dockerls`             | 官方 Docker LSP          |
| Go                      | `gopls`                | Google 官方语言服务器    |
| HTML                    | `html`                 | 前端通用                 |
| Java                    | `jdtls`                | Java 官方语言服务器      |
| JavaScript / TypeScript | `tsserver` 或 `vtsls`  | 推荐 `vtsls`，更快更稳定 |
| JSON                    | `jsonls`               | 支持 JSON Schema         |
| Lua                     | `lua_ls`               | Neovim 生态最优          |
| Markdown                | `marksman`             | 功能完善                 |
| Python                  | `pyright`              | 快速、准确               |
| Rust                    | `rust_analyzer`        | Rust 官方推荐            |
| YAML                    | `yamlls`               | 支持 schema、格式化      |

可批量安装示例：

```vim
:MasonInstall ansible-language-server bash-language-server css-lsp
:MasonInstall dockerfile-language-server gopls html-lsp json-lsp
:MasonInstall lua-language-server marksman pyright sqlls
:MasonInstall svelte-language-server typescript-language-server
:MasonInstall tailwindcss-language-server
:MasonInstall vim-language-server yaml-language-server
```

查看更多: https://github.com/mason-org/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

---

### 推荐 Linter

推荐以下 Linter，稳定高效，支持主流语言：

- **ESLint** → JavaScript / TypeScript
- **ShellCheck** → Shell 脚本
- **flake8 / ruff** → Python
- **markdownlint** → Markdown
- **yamllint** → YAML
- **hadolint** → Dockerfile

安装示例：

```vim
:MasonInstall vint shellcheck editorconfig-checker flake8 gitlint hadolint
:MasonInstall markdownlint mypy selene shellharden write-good yamllint
```
---

### 推荐 Formatter

以下格式化器简单易用，与 Neovim 集成良好：

| 语言     | Formatter                |
| -------- | ------------------------ |
| JS/TS    | `prettier`               |
| HTML/CSS | `prettier`               |
| Markdown | `prettier`               |
| Python   | `black` 或 `ruff format` |
| Lua      | `stylua`                 |
| JSON     | `prettier`               |
| YAML     | `prettier`               |

安装示例：

```vim
:MasonInstall black fixjson gofumpt golines isort
:MasonInstall shfmt sql-formatter stylua
```
---

### 推荐字体

macOS 安装示例：

```sh
brew tap homebrew/cask-fonts
brew search nerd-font
brew install --cask font-victor-mono-nerd-font
brew install --cask font-iosevka-nerd-font-mono
brew install --cask font-hack-nerd-font
brew install --cask font-fira-code
```

---

## 升级

升级插件和包：

* Neovim 插件：`:Lazy update`
* Mason 包：`:Mason` 后按 <kbd>U</kbd>

更新 Neovim 配置：

```bash
git pull --ff --ff-only
```

## 结构

```
nvim/
├── after/                  # 针对特定语言的自定义设置和插件
├── init.lua
├── lua/                    # Lua 配置
│   └── rafi/
│       ├── config/         # Neovim 配置
│           ├── autocmd.lua # 自动命令
│           ├── init.lua    # 初始化
│           ├── keymaps.lua # 快捷键映射
│           ├── lazy.lua    # 插件管理入口
│           └── options.lua # 编辑器参数
│       ├── plugins/        # 插件及其配置
│       ├── settings/       # UI、选项、快捷键
│       └── utils/          # 工具函数
├── snippets/               # 个人代码片段
└── lazy-lock.json          # 插件锁定版本
```

---

## 扩展配置

### 扩展：配置

Fork 本仓库后，在 `lua/config` 目录下可添加如下文件（可选）：

- `lua/config/autocmds.lua` — 自定义自动命令
- `lua/config/options.lua` — 自定义参数
- `lua/config/keymaps.lua` — 自定义快捷键
- `lua/config/setup.lua` — 覆盖配置，详见 [扩展默认值](#扩展默认值)

添加插件或覆盖现有配置：
- `lua/plugins/*.lua` 或 `lua/plugins.lua` — 插件（语法见 [lazy.nvim] 说明）

### 推荐 LSP

```vim
:MasonInstall ansible-language-server bash-language-server css-lsp
:MasonInstall dockerfile-language-server gopls html-lsp json-lsp
:MasonInstall lua-language-server marksman pyright sqlls
:MasonInstall svelte-language-server typescript-language-server
:MasonInstall tailwindcss-language-server
:MasonInstall vim-language-server yaml-language-server
```

以及更多：https://github.com/mason-org/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

### 推荐 Linter

```vim
:MasonInstall vint shellcheck editorconfig-checker flake8 gitlint hadolint
:MasonInstall markdownlint mypy selene shellharden write-good yamllint
```

### 推荐 Formatter

```vim
:MasonInstall black fixjson gofumpt golines isort
:MasonInstall shfmt sql-formatter stylua
```

## 推荐字体

* [Pragmata Pro] (€19 — €1,990)：我最喜欢的字体
* 任何 [Nerd Fonts]

macOS 上用 Homebrew 安装 [Nerd Fonts] 示例：

```sh
brew tap homebrew/cask-fonts
brew search nerd-font
brew install --cask font-victor-mono-nerd-font
brew install --cask font-iosevka-nerd-font-mono
brew install --cask font-hack-nerd-font
brew install --cask font-fira-code
```

[Pragmata Pro]: https://www.fsd.it/shop/fonts/pragmatapro/
[Nerd Fonts]: https://www.nerdfonts.com

## 升级

升级插件和包：

* Neovim 插件：`:Lazy update`
* Mason 包：`:Mason` 后按 <kbd>U</kbd>

从本仓库拉取最新配置：

```bash
git pull --ff --ff-only
```

## 结构

* [after/](./after) — 针对语言的自定义设置和插件
* [lua/](./lua) — Lua 配置
  * **`config/`** — 用户自定义配置
  * **`plugins/`** — 用户自定义插件（或 `lua/plugins.lua`）
  * [rafi/](./lua/rafi)
    * [config/](./lua/config) — Neovim 配置
      * [autocmd.lua](./lua/rafi/config/autocmd.lua) — 自动命令
      * [init.lua](./lua/rafi/config/init.lua) — 初始化
      * [keymaps.lua](./lua/rafi/config/keymaps.lua) — 快捷键映射
      * [lazy.lua](./lua/rafi/config/lazy.lua) — 插件管理入口
      * [options.lua](./lua/rafi/config/options.lua) — 编辑器参数
    * [plugins/](./lua/plugins) — 插件及其配置
    * [util/](./lua/rafi/util) — 工具库
* [snippets/](./snippets) — 个人代码片段

## 扩展

### 扩展：配置

Fork 此仓库并在 `lua/config` 目录下添加如下文件（可选）：

- `lua/config/autocmds.lua` — 自定义自动命令
- `lua/config/options.lua` — 自定义参数
- `lua/config/keymaps.lua` — 自定义快捷键
- `lua/config/setup.lua` — 覆盖配置，详见 [扩展默认值](#扩展默认值)

添加插件或覆盖现有配置：

- `lua/plugins/*.lua` 或 `lua/plugins.lua` — 插件（语法见 [lazy.nvim] 说明）

## 扩展插件（Extra Plugins）

<details open>
  <summary><strong>扩展插件列表</strong> <small><i>(🔎 点击展开/收起)</i></small></summary>

你可以在 [lazyvim.org/extras] 查看所有 LazyVim 的扩展插件。

这些插件默认未启用。需要通过 `:LazyExtras` 并按 <kbd>x</kbd> 安装（或通过 specs 导入）。
如何添加插件与示例见 [扩展：插件](#扩展)。

以下为 Rafi Neovim 配置在 LazyVim 之上额外集成的扩展插件：

### 扩展插件：编码（Coding）

Spec: `rafi.plugins.extras.coding.<name>`

| 名称             | 插件仓库                        | 说明                                      |
| ---------------- | ------------------------------- | ----------------------------------------- |
| `align`          | [nvim-mini/mini.align]          | 交互式文本对齐                            |
| `chainsaw`       | [chrisgrieser/nvim-chainsaw]    | 快速插入日志语句                          |
| `debugprint.lua` | [andrewferrier/debugprint.nvim] | 轻松插入调试打印语句                      |
| `editorconfig`   | [sgur/vim-editorconfig]         | 完全用 Vimscript 实现的 EditorConfig 插件 |
| `emmet`          | [mattn/emmet-vim]               | Emmet 缩写快速扩展支持                    |
| `nvim-cmp`       | [hrsh7th/nvim-cmp]              | 自动补全插件                              |
| `sandwich`       | [machakann/vim-sandwich]        | 搜索、选择并编辑配对文本对象              |

[nvim-mini/mini.align]: https://github.com/nvim-mini/mini.align
[chrisgrieser/nvim-chainsaw]: https://github.com/chrisgrieser/nvim-chainsaw
[andrewferrier/debugprint.nvim]: https://github.com/andrewferrier/debugprint.nvim
[sgur/vim-editorconfig]: https://github.com/sgur/vim-editorconfig
[mattn/emmet-vim]: https://github.com/mattn/emmet-vim
[hrsh7th/nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
[machakann/vim-sandwich]: https://github.com/machakann/vim-sandwich

### 扩展插件：配色方案（Colorscheme）

Spec: `rafi.plugins.extras.colorscheme.<name>`

| 名称          | 插件仓库                        | 说明                         |
| ------------- | ------------------------------- | ---------------------------- |
| `bamboo`      | [ribru17/bamboo.nvim]           | 温暖的绿色主题               |
| `cyberdream`  | [scottmckendry/cyberdream.nvim] | 高对比、未来感与鲜艳色彩主题 |
| `github`      | [projekt0n/github-nvim-theme]   | GitHub 官方主题              |
| `kanagawa`    | [rebelot/kanagawa.nvim]         | 葛饰北斋名画色彩灵感主题     |
| `monokai-pro` | [loctvl842/monokai-pro.nvim]    | Monokai Pro 多滤镜主题       |

[ribru17/bamboo.nvim]: https://github.com/ribru17/bamboo.nvim
[scottmckendry/cyberdream.nvim]: https://github.com/scottmckendry/cyberdream.nvim
[projekt0n/github-nvim-theme]: https://github.com/projekt0n/github-nvim-theme
[rebelot/kanagawa.nvim]: https://github.com/rebelot/kanagawa.nvim
[loctvl842/monokai-pro.nvim]: https://github.com/loctvl842/monokai-pro.nvim

### 扩展插件：编辑器（Editor）

Spec: `rafi.plugins.extras.editor.<name>`

| 名称          | 插件仓库                    | 说明                                 |
| ------------- | --------------------------- | ------------------------------------ |
| `anyjump`     | [pechorin/any-jump.vim]     | 快速跳转到任意定义和引用，无额外开销 |
| `flybuf`      | [glepnir/flybuf.nvim]       | 浮窗方式列出缓冲区                   |
| `harpoon2`    | [ThePrimeagen/harpoon]      | 项目内导航标记                       |
| `mini-visits` | [nvim-mini/mini.visits]     | 跟踪和复用文件系统访问记录           |
| `rest`        | [rest-nvim/rest.nvim]       | 快速的 Neovim HTTP 客户端            |
| `sidebar`     | [sidebar-nvim/sidebar.nvim] | 通用且模块化的 Lua 侧边栏            |
| `spectre`     | [nvim-pack/nvim-spectre]    | 查找与替换                           |
| `ufo`         | [kevinhwang91/nvim-ufo]     | 现代高性能代码折叠                   |

[pechorin/any-jump.vim]: https://github.com/pechorin/any-jump.vim
[glepnir/flybuf.nvim]: https://github.com/glepnir/flybuf.nvim
[ThePrimeagen/harpoon]: https://github.com/ThePrimeagen/harpoon
[nvim-mini/mini.visits]: https://github.com/nvim-mini/mini.visits
[rest-nvim/rest.nvim]: https://github.com/rest-nvim/rest.nvim
[sidebar-nvim/sidebar.nvim]: https://github.com/sidebar-nvim/sidebar.nvim
[nvim-pack/nvim-spectre]: https://github.com/nvim-pack/nvim-spectre
[kevinhwang91/nvim-ufo]: https://github.com/kevinhwang91/nvim-ufo

### 扩展插件：Git

Spec: `rafi.plugins.extras.git.<name>`

| 名称       | 插件仓库             | 说明                               |
| ---------- | -------------------- | ---------------------------------- |
| `cmp-git`  | [petertriho/cmp-git] | nvim-cmp 的 Git 源                 |
| `fugitive` | [tpope/vim-fugitive] | Git 客户端，集成 [junegunn/gv.vim] |

[petertriho/cmp-git]: https://github.com/petertriho/cmp-git
[tpope/vim-fugitive]: https://github.com/tpope/vim-fugitive
[junegunn/gv.vim]: https://github.com/junegunn/gv.vim

### 扩展插件：语言支持（Lang）

Spec: `rafi.plugins.extras.lang.<name>`

| 名称         | 说明                                                                                         |
| ------------ | -------------------------------------------------------------------------------------------- |
| `ansible`    | 引入 `lazyvim.plugins.extras.lang.ansible`，并集成语法和 [pearofducks/ansible-vim]           |
| `go`         | 引入 `lazyvim.plugins.extras.lang.go`，集成工具、文件模式等                                  |
| `helm`       | 引入 `lazyvim.plugins.extras.lang.helm`，添加文件类型识别                                    |
| `kubernetes` | 引入 `lazyvim.plugins.extras.lang.yaml`，文件类型识别与 [ramilito/kubectl.nvim]              |
| `markdown`   | 引入 `lazyvim.plugins.extras.lang.markdown`，禁用 headlines，集成 [mzlogin/vim-markdown-toc] |
| `python`     | 引入 `lazyvim.plugins.extras.lang.python`，集成语法和文件类型                                |
| `tmux`       | 语法、补全 [andersevenrud/cmp-tmux]，导航键 [christoomey/tmux-navigator]                     |

[pearofducks/ansible-vim]: https://github.com/pearofducks/ansible-vim
[ramilito/kubectl.nvim]: https://github.com/ramilito/kubectl.nvim
[mzlogin/vim-markdown-toc]: https://github.com/mzlogin/vim-markdown-toc
[andersevenrud/cmp-tmux]: https://github.com/andersevenrud/cmp-tmux
[christoomey/tmux-navigator]: https://github.com/christoomey/vim-tmux-navigator

### 扩展插件：LSP

Spec: `rafi.plugins.extras.lsp.<name>`

| 键               | 插件仓库                  | 说明                       |
| ---------------- | ------------------------- | -------------------------- |
| `gtd`            | [hrsh7th/nvim-gtd]        | LSP 跳转到定义插件         |
| `lightbulb`      | [kosayoda/nvim-lightbulb] | VSCode 风格 💡 LSP 操作提示 |
| `yaml-companion` | [yaml-companion.nvim]     | YAML Schema 智能检测与设置 |

[hrsh7th/nvim-gtd]: https://github.com/hrsh7th/nvim-gtd
[kosayoda/nvim-lightbulb]: https://github.com/kosayoda/nvim-lightbulb
[yaml-companion.nvim]: https://github.com/someone-stole-my-name/yaml-companion.nvim

### 扩展插件：Org

Spec: `rafi.plugins.extras.org.<name>`

| 键           | 插件仓库                      | 说明                                       |
| ------------ | ----------------------------- | ------------------------------------------ |
| `calendar`   | [itchyny/calendar.vim]        | 日历应用                                   |
| `kiwi`       | [serenevoid/kiwi.nvim]        | 极简版 VimWiki                             |
| `telekasten` | [renerocksai/telekasten.nvim] | 基于 Telescope 的 Markdown 知识库/维基管理 |
| `vimwiki`    | [vimwiki/vimwiki]             | Vim 的个人 Wiki                            |
| `zk-nvim`    | [zk-org/zk-nvim]              | zk 纯文本笔记扩展                          |

[itchyny/calendar.vim]: https://github.com/itchyny/calendar.vim
[serenevoid/kiwi.nvim]: https://github.com/serenevoid/kiwi.nvim
[renerocksai/telekasten.nvim]: https://github.com/renerocksai/telekasten.nvim
[vimwiki/vimwiki]: https://github.com/vimwiki/vimwiki
[zk-org/zk-nvim]: https://github.com/zk-org/zk-nvim

### 扩展插件：Treesitter

Spec: `rafi.plugins.extras.treesitter.<name>`

| 键        | 插件仓库                         | 说明                            |
| --------- | -------------------------------- | ------------------------------- |
| `endwise` | [RRethy/nvim-treesitter-endwise] | 智能补全 `end` 关键字（多语言） |
| `treesj`  | [Wansmer/treesj]                 | 代码块智能拆分与合并            |

[RRethy/nvim-treesitter-endwise]: https://github.com/RRethy/nvim-treesitter-endwise
[Wansmer/treesj]: https://github.com/Wansmer/treesj

### 扩展插件：UI

Spec: `rafi.plugins.extras.ui.<name>`

| 键                | 插件仓库                        | 说明                             |
| ----------------- | ------------------------------- | -------------------------------- |
| `alpha`           | [goolord/alpha-nvim]            | 快速且可编程的欢迎界面           |
| `barbecue`        | [utilyre/barbecue.nvim]         | VSCode 风格 winbar               |
| `bookmarks`       | [tomasky/bookmarks.nvim]        | 支持全局文件存储的书签插件       |
| `bqf`             | [kevinhwang91/nvim-bqf]         | 更好的 quickfix 窗口             |
| `ccc`             | [uga-rosa/ccc.nvim]             | 超强色彩选择与着色器插件         |
| `cursorword`      | [itchyny/cursorword]            | 下划线当前光标下单词             |
| `cybu`            | [ghillb/cybu.nvim]              | 可自定义通知窗口的缓冲区切换插件 |
| `deadcolumn`      | [Bekaboo/deadcolumn.nvim]       | 动态显示 colorcolumn             |
| `goto-preview`    | [rmagatti/goto-preview]         | 浮窗预览定义                     |
| `headlines`       | [lukas-reineke/headlines.nvim]  | 标题与代码背景高亮               |
| `illuminate`      | [RRethy/vim-illuminate]         | 高亮光标下单词的其他用法         |
| `incline`         | [b0o/incline.nvim]              | 浮动状态栏                       |
| `marks`           | [chentoast/marks.nvim]          | 交互与管理 mark 标记             |
| `mini-clue`       | [nvim-mini/mini.clue]           | 下一个按键提示                   |
| `mini-map`        | [nvim-mini/mini.map]            | 迷你地图、滚动条与高亮           |
| `quicker`         | [stevearc/quicker.nvim]         | 改进的 quickfix UI 与工作流      |
| `symbols-outline` | [simrat39/symbols-outline.nvim] | LSP 符号树型视图                 |

[goolord/alpha-nvim]: https://github.com/goolord/alpha-nvim
[utilyre/barbecue.nvim]: https://github.com/utilyre/barbecue.nvim
[tomasky/bookmarks.nvim]: https://github.com/tomasky/bookmarks.nvim
[kevinhwang91/nvim-bqf]: https://github.com/kevinhwang91/nvim-bqf
[uga-rosa/ccc.nvim]: https://github.com/uga-rosa/ccc.nvim
[itchyny/cursorword]: https://github.com/itchyny/vim-cursorword
[ghillb/cybu.nvim]: https://github.com/ghillb/cybu.nvim
[Bekaboo/deadcolumn.nvim]: https://github.com/Bekaboo/deadcolumn.nvim
[rmagatti/goto-preview]: https://github.com/rmagatti/goto-preview
[lukas-reineke/headlines.nvim]: https://github.com/lukas-reineke/headlines.nvim
[RRethy/vim-illuminate]: https://github.com/RRethy/vim-illuminate
[b0o/incline.nvim]: https://github.com/b0o/incline.nvim
[chentoast/marks.nvim]: https://github.com/chentoast/marks.nvim
[nvim-mini/mini.clue]: https://github.com/nvim-mini/mini.clue
[nvim-mini/mini.map]: https://github.com/nvim-mini/mini.map
[stevearc/quicker.nvim]: https://github.com/stevearc/quicker.nvim
[simrat39/symbols-outline.nvim]: https://github.com/simrat39/symbols-outline.nvim

### LazyVim 扩展插件

LazyVim 已在 specs 中导入（见 [lua/rafi/config/lazy.lua](./lua/rafi/config/lazy.lua)）。
因此，你可以直接导入 [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/plugins/extras) 下定义的任何 "Extras" 插件，
并参考 [lazyvim.org/extras] 文档。

使用 <kbd>Space</kbd><kbd>m</kbd><kbd>x</kbd> 或 `:LazyExtras` 安装。

**以下为部分精选：**

* `ai.copilot`
* `coding.neogen`
* `coding.yanky`
* `dap.core`
* `test.core`
* `util.mini-hipatterns`
* `lang.docker`
* `lang.json`
* `lang.markdown`
* `lang.svelte`
* `lang.terraform`
* 以及 [更多插件](https://www.lazyvim.org/extras)……

</details>

## 自定义快捷键（Custom Key-mappings）

注意事项：

* **主前缀**（Leader）键为 <kbd>Space</kbd>
* **本地前缀**（Local-Leader）键为 <kbd>;</kbd>，用于导航与搜索
  （Telescope/Snacks/FZF 和 Neo-tree）
* 启用 `vim.g.elite_mode` 后，普通模式下禁用 <kbd>←</kbd> <kbd>↑</kbd> <kbd>→</kbd> <kbd>↓</kbd> 方向键

<details open>
  <summary>
    <strong>快捷键总览</strong>
    <small><i>(🔎 点击展开/收起)</i></small>
  </summary>

图例：| Ⓝormal 正常 | Ⓥisual 可视 | Ⓢelect 选择 | Ⓘnsert 插入 | Ⓞperator 操作 | Ⓒommand 命令 |

### 选择器（Picker）

（Telescope/Snacks/FZF）

| 快捷键                                            | 模式  | 功能说明                   |
| ------------------------------------------------- | :---: | -------------------------- |
| <kbd>Space</kbd> <kbd>;</kbd>                     |   Ⓝ   | 选择选择器                 |
| <kbd>;r</kbd>                                     |   Ⓝ   | 恢复上次选择器             |
| <kbd>;p</kbd>                                     |   Ⓝ   | 项目                       |
| <kbd>;f</kbd>                                     |   Ⓝ   | 文件                       |
| <kbd>;F</kbd>                                     |   Ⓝ   | 文件（当前目录）           |
| <kbd>;g</kbd>                                     |   Ⓝ   | 全局搜索                   |
| <kbd>;G</kbd>                                     |   Ⓝ   | 全局搜索（当前目录）       |
| <kbd>;b</kbd>                                     |   Ⓝ   | 切换缓冲区                 |
| <kbd>;h</kbd>                                     |   Ⓝ   | 帮助文档                   |
| <kbd>;H</kbd>                                     |   Ⓝ   | 高亮                       |
| <kbd>;j</kbd>                                     |   Ⓝ   | 跳转列表                   |
| <kbd>;m</kbd>                                     |   Ⓝ   | 跳转到标记                 |
| <kbd>;M</kbd>                                     |   Ⓝ   | Man 手册                   |
| <kbd>;o</kbd>                                     |   Ⓝ   | 选项                       |
| <kbd>;t</kbd>                                     |   Ⓝ   | 跳转到符号                 |
| <kbd>;T</kbd>                                     |   Ⓝ   | 跳转到符号（工作区）       |
| <kbd>;v</kbd>                                     |  Ⓝ Ⓥ  | 寄存器                     |
| <kbd>;s</kbd>                                     |   Ⓝ   | 会话管理                   |
| <kbd>;u</kbd>                                     |   Ⓝ   | 拼写建议                   |
| <kbd>;x</kbd>                                     |   Ⓝ   | 最近文件                   |
| <kbd>;X</kbd>                                     |   Ⓝ   | 最近文件（当前目录）       |
| <kbd>;z</kbd>                                     |   Ⓝ   | Zoxide 目录                |
| <kbd>;;</kbd>                                     |   Ⓝ   | 命令历史                   |
| <kbd>;:</kbd>                                     |   Ⓝ   | 命令                       |
| <kbd>;/</kbd>                                     |   Ⓝ   | 搜索历史                   |
| <kbd>;dd</kbd>                                    |   Ⓝ   | LSP 定义                   |
| <kbd>;di</kbd>                                    |   Ⓝ   | LSP 实现                   |
| <kbd>;dr</kbd>                                    |   Ⓝ   | LSP 引用                   |
| <kbd>;da</kbd>                                    |  Ⓝ Ⓥ  | LSP 代码操作               |
| <kbd>Space</kbd> <kbd>/</kbd>                     |   Ⓝ   | 当前缓冲区模糊查找         |
| <kbd>Space</kbd> <kbd>gs</kbd>                    |   Ⓝ   | Git 状态                   |
| <kbd>Space</kbd> <kbd>gr</kbd>                    |   Ⓝ   | Git 分支                   |
| <kbd>Space</kbd> <kbd>gh</kbd>                    |   Ⓝ   | Git 存档                   |
| <kbd>Space</kbd> <kbd>gF</kbd>                    |   Ⓝ   | 查找光标下单词相关文件     |
| <kbd>Space</kbd> <kbd>gg</kbd>                    |  Ⓝ Ⓥ  | 全文/选区搜索              |
| <kbd>Space</kbd> <kbd>gG</kbd>                    |  Ⓝ Ⓥ  | 全文/选区搜索（当前目录）  |
| <kbd>Space</kbd> <kbd>sc</kbd>                    |   Ⓝ   | 主题切换                   |
| <kbd>Space</kbd> <kbd>sd</kbd>                    |   Ⓝ   | 文档诊断                   |
| <kbd>Space</kbd> <kbd>sD</kbd>                    |   Ⓝ   | 工作区诊断                 |
| <kbd>Space</kbd> <kbd>sh</kbd>                    |   Ⓝ   | 帮助标签                   |
| <kbd>Space</kbd> <kbd>sk</kbd>                    |   Ⓝ   | 快捷键映射                 |
| <kbd>Space</kbd> <kbd>sm</kbd>                    |   Ⓝ   | Man 手册                   |
| <kbd>Space</kbd> <kbd>ss</kbd>                    |   Ⓝ   | LSP 文档符号               |
| <kbd>Space</kbd> <kbd>sS</kbd>                    |   Ⓝ   | LSP 工作区符号             |
| <kbd>Space</kbd> <kbd>st</kbd>                    |   Ⓝ   | 待办列表                   |
| <kbd>Space</kbd> <kbd>sT</kbd>                    |   Ⓝ   | 待办/Fix/Fixme 列表        |
| <kbd>Space</kbd> <kbd>sw</kbd>                    |   Ⓝ   | 字符串查找                 |
|                                                   |       | &nbsp;                     |
| <kbd>;i</kbd>                                     |   Ⓝ   | （Snacks 专用）图标        |
| <kbd>;w</kbd>                                     |   Ⓝ   | （Telescope 专用）笔记     |
| <kbd>;n</kbd>                                     |   Ⓝ   | （Telescope 专用）插件目录 |
| <kbd>;k</kbd>                                     |   Ⓝ   | （Telescope 专用）同义词   |
|                                                   |       | &nbsp;                     |
| **选择器窗口内**                                  |       | &nbsp;                     |
| <kbd>?</kbd>                                      |   Ⓝ   | 快捷键帮助屏幕             |
| <kbd>Ctrl</kbd>+<kbd>Space</kbd>                  |   Ⓝ   | 切换模糊搜索               |
| <kbd>jj</kbd> 或 <kbd>Escape</kbd>                |   Ⓘ   | 离开插入模式               |
| <kbd>i</kbd>                                      |   Ⓝ   | 进入插入模式（筛选输入）   |
| <kbd>q</kbd> 或 <kbd>Escape</kbd>                 |   Ⓝ   | 退出                       |
| <kbd>Tab</kbd> 或 <kbd>Shift</kbd>+<kbd>Tab</kbd> |  Ⓝ Ⓘ  | 下/上一个候选项            |
| <kbd>Ctrl</kbd>+<kbd>d</kbd>/<kbd>u</kbd>         |  Ⓝ Ⓘ  | 向下/向上滚动              |
| <kbd>Ctrl</kbd>+<kbd>f</kbd>/<kbd>b</kbd>         |  Ⓝ Ⓘ  | 预览区向下/向上滚动        |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>k</kbd>         |  Ⓝ Ⓘ  | 预览区垂直滚动             |
| <kbd>Ctrl</kbd>+<kbd>h</kbd>/<kbd>l</kbd>         |  Ⓝ Ⓘ  | 预览区水平滚动             |
| <kbd>J</kbd> 或 <kbd>K</kbd>                      |   Ⓝ   | 候选项上下选择             |
| <kbd>st</kbd>                                     |   Ⓝ   | 新 tab 打开                |
| <kbd>sg</kbd>                                     |   Ⓝ   | 垂直分屏打开               |
| <kbd>sv</kbd>                                     |   Ⓝ   | 水平分屏打开               |
| <kbd>*</kbd>                                      |   Ⓝ   | 切换选择                   |
| <kbd>u</kbd>                                      |   Ⓝ   | 清空所有                   |
| <kbd>w</kbd>                                      |   Ⓝ   | 智能发送至 quickfix        |
| <kbd>e</kbd>                                      |   Ⓝ   | 发送至 quickfix            |
| <kbd>Ctrl</kbd>+<kbd>q</kbd>                      |   Ⓘ   | 发送至 quickfix            |
| <kbd>dd</kbd>                                     |   Ⓝ   | 删除条目（缓冲区列表）     |
| <kbd>!</kbd>                                      |   Ⓝ   | 命令行编辑                 |

### 功能切换（Toggle Features）

| 快捷键                          | 模式  | 功能说明                  |
| ------------------------------- | :---: | ------------------------- |
| <kbd>Space</kbd> <kbd>dph</kbd> |   Ⓝ   | 开关性能分析高亮          |
| <kbd>Space</kbd> <kbd>dpp</kbd> |   Ⓝ   | 开关性能分析              |
| <kbd>Space</kbd> <kbd>ua</kbd>  |   Ⓝ   | 开关动画                  |
| <kbd>Space</kbd> <kbd>uA</kbd>  |   Ⓝ   | 开关标签栏                |
| <kbd>Space</kbd> <kbd>ub</kbd>  |   Ⓝ   | 切换深色/浅色背景         |
| <kbd>Space</kbd> <kbd>uc</kbd>  |   Ⓝ   | 切换折叠级别              |
| <kbd>Space</kbd> <kbd>uC</kbd>  |   Ⓝ   | 切换配色方案              |
| <kbd>Space</kbd> <kbd>ud</kbd>  |   Ⓝ   | 切换当前缓冲区诊断        |
| <kbd>Space</kbd> <kbd>uD</kbd>  |   Ⓝ   | 切换文本变暗              |
| <kbd>Space</kbd> <kbd>uf</kbd>  |   Ⓝ   | 切换保存时自动格式化      |
| <kbd>Space</kbd> <kbd>uF</kbd>  |   Ⓝ   | 全局切换保存时自动格式化  |
| <kbd>Space</kbd> <kbd>ug</kbd>  |   Ⓝ   | 切换缩进线                |
| <kbd>Space</kbd> <kbd>uG</kbd>  |   Ⓝ   | 切换 Git 标记             |
| <kbd>Space</kbd> <kbd>uh</kbd>  |   Ⓝ   | 切换 inlay-hints          |
| <kbd>Space</kbd> <kbd>ui</kbd>  |   Ⓝ   | 检查光标位置              |
| <kbd>Space</kbd> <kbd>uI</kbd>  |   Ⓝ   | 检查树结构                |
| <kbd>Space</kbd> <kbd>ul</kbd>  |   Ⓝ   | 切换行号                  |
| <kbd>Space</kbd> <kbd>uL</kbd>  |   Ⓝ   | 切换相对行号              |
| <kbd>Space</kbd> <kbd>um</kbd>  |   Ⓝ   | 切换 Markdown 渲染        |
| <kbd>Space</kbd> <kbd>un</kbd>  |   Ⓝ   | 清除所有通知              |
| <kbd>Space</kbd> <kbd>up</kbd>  |   Ⓝ   | 禁用自动配对              |
| <kbd>Space</kbd> <kbd>ur</kbd>  |   Ⓝ   | 重绘、清除高亮并更新 diff |
| <kbd>Space</kbd> <kbd>us</kbd>  |   Ⓝ   | 切换拼写检查              |
| <kbd>Space</kbd> <kbd>uS</kbd>  |   Ⓝ   | 切换平滑滚动              |
| <kbd>Space</kbd> <kbd>uT</kbd>  |   Ⓝ   | 切换 Treesitter           |
| <kbd>Space</kbd> <kbd>uw</kbd>  |   Ⓝ   | 切换自动换行              |
| <kbd>Space</kbd> <kbd>uz</kbd>  |   Ⓝ   | 切换专注写作（Zen 模式）  |
| <kbd>Space</kbd> <kbd>uZ</kbd>  |   Ⓝ   | 切换窗口缩放              |

### 导航（Navigation）

| 快捷键                                         | 模式  | 功能说明                 | 插件或映射                                              |
| ---------------------------------------------- | :---: | ------------------------ | ------------------------------------------------------- |
| <kbd>j</kbd> / <kbd>k</kbd>                    |  Ⓝ Ⓥ  | 按显示行上下移动光标     | <small>`g` `j/k`</small>                                |
| <kbd>]i</kbd> / <kbd>[i</kbd>                  |  Ⓝ Ⓥ  | 跳转到缩进块边缘         | <small>[folke/snacks.nvim]</small>                      |
| <kbd>gh</kbd> / <kbd>gl</kbd>                  |  Ⓝ Ⓥ  | 快速行首/行尾移动        | <small>`g^` `g$`</small>                                |
| <kbd>zl</kbd> / <kbd>zh</kbd>                  |   Ⓝ   | 水平滚动                 | <small>`z4l/h`</small>                                  |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>                   |   Ⓝ   | 跳转到下方分屏           | <small>`<C-w>j` 或 [christoomey/tmux-navigator]</small> |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>                   |   Ⓝ   | 跳转到上方分屏           | <small>`<C-w>k` 或 [christoomey/tmux-navigator]</small> |
| <kbd>Ctrl</kbd>+<kbd>h</kbd>                   |   Ⓝ   | 跳转到左侧分屏           | <small>`<C-w>h` 或 [christoomey/tmux-navigator]</small> |
| <kbd>Ctrl</kbd>+<kbd>l</kbd>                   |   Ⓝ   | 跳转到右侧分屏           | <small>`<C-w>l` 或 [christoomey/tmux-navigator]</small> |
| <kbd>Return</kbd>                              |   Ⓝ   | 切换当前折叠             | <small>`za`</small>                                     |
| <kbd>Shift</kbd>+<kbd>Return</kbd>             |   Ⓝ   | 只展开当前折叠，关闭其它 | <small>`zMzv`</small>                                   |
| <kbd>Ctrl</kbd>+<kbd>f</kbd>                   |   Ⓒ   | 命令行中向前移动光标     | <kbd>→</kbd>                                            |
| <kbd>Ctrl</kbd>+<kbd>b</kbd>                   |   Ⓒ   | 命令行中向后移动光标     | <kbd>←</kbd>                                            |
| <kbd>Ctrl</kbd>+<kbd>h</kbd>                   |   Ⓒ   | 命令行移动到行首         | <kbd>Home</kbd>                                         |
| <kbd>Ctrl</kbd>+<kbd>l</kbd>                   |   Ⓒ   | 命令行移动到行尾         | <kbd>End</kbd>                                          |
| <kbd>Ctrl</kbd>+<kbd>Tab</kbd>                 |   Ⓝ   | 下一个标签页             | <small>`:tabnext`</small>                               |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd><kbd>Tab</kbd> |   Ⓝ   | 上一个标签页             | <small>`:tabprevious`</small>                           |
| <kbd>Alt</kbd>+<kbd>j</kbd> 或 <kbd>]</kbd>    |   Ⓝ   | 下一个标签页             | <small>`:tabnext`</small>                               |
| <kbd>Alt</kbd>+<kbd>k</kbd> 或 <kbd>[</kbd>    |   Ⓝ   | 上一个标签页             | <small>`:tabprevious`</small>                           |
| <kbd>Alt</kbd>+<kbd>{</kbd>                    |   Ⓝ   | 标签页左移               | <small>`:-tabmove`</small>                              |
| <kbd>Alt</kbd>+<kbd>}</kbd>                    |   Ⓝ   | 标签页右移               | <small>`:+tabmove`</small>                              |

### 选择（Selection）

| 快捷键                                           | 模式  | 功能说明                    | 插件或映射                             |
| ------------------------------------------------ | :---: | --------------------------- | -------------------------------------- |
| <kbd>Space</kbd>+<kbd>Space</kbd>                |  Ⓝ Ⓥ  | 切换可视行模式              | <small>`V` / <kbd>Escape</kbd></small> |
| <kbd>Ctrl</kbd>+<kbd>Space</kbd> / <kbd>V</kbd>  |   Ⓥ   | 增加/缩小选择范围（语法树） | <small>[nvim-treesitter]</small>       |
| <kbd>vsp</kbd>                                   |   Ⓝ   | 选择上次粘贴区域            | <small>[config/keymaps.lua]</small>    |
| <kbd>sg</kbd>                                    |   Ⓥ   | 在选区内替换                | <small>[config/keymaps.lua]</small>    |
| <kbd>Ctrl</kbd>+<kbd>r</kbd>                     |   Ⓥ   | 选区内逐步确认替换          | <small>[config/keymaps.lua]</small>    |
| <kbd>></kbd> / <kbd><</kbd>                      |   Ⓥ   | 缩进并保持选区              | <small>[config/keymaps.lua]</small>    |
| <kbd>Tab</kbd> / <kbd>Shift</kbd>+<kbd>Tab</kbd> |   Ⓥ   | 缩进并保持选区              | <small>[config/keymaps.lua]</small>    |
| <kbd>I</kbd> / <kbd>gI</kbd> / <kbd>A</kbd>      |   Ⓥ   | 强制块操作                  | <small>[config/keymaps.lua]</small>    |

### 跳转（Jump To）

| 快捷键                         | 模式  | 功能说明           | 插件或映射                                    |
| ------------------------------ | :---: | ------------------ | --------------------------------------------- |
| <kbd>],</kbd> 或 <kbd>[,</kbd> |   Ⓝ   | 下/上一个参数      | <small>[akinsho/bufferline.nvim]</small>      |
| <kbd>]q</kbd> 或 <kbd>[q</kbd> |   Ⓝ   | quickfix 下/上一项 | <small>`:cnext` / `:cprev`</small>            |
| <kbd>]a</kbd> 或 <kbd>[a</kbd> |   Ⓝ   | 位置列表下/上一项  | <small>`:lnext` / `:lprev`</small>            |
| <kbd>]d</kbd> 或 <kbd>[d</kbd> |   Ⓝ   | 下/上一个诊断      | <small>[config/keymaps.lua]</small>           |
| <kbd>]e</kbd> 或 <kbd>[e</kbd> |   Ⓝ   | 下/上一个错误      | <small>[config/keymaps.lua]</small>           |
| <kbd>]w</kbd> 或 <kbd>[w</kbd> |   Ⓝ   | 下/上一个警告      | <small>[config/keymaps.lua]</small>           |
| <kbd>]b</kbd> 或 <kbd>[b</kbd> |   Ⓝ   | 下/上一个缓冲区    | <small>[akinsho/bufferline.nvim]</small>      |
| <kbd>]f</kbd> 或 <kbd>[f</kbd> |   Ⓝ   | 下/上一个函数开头  | <small>[echasnovski/mini.ai]</small>          |
| <kbd>]F</kbd> 或 <kbd>[F</kbd> |   Ⓝ   | 下/上一个函数结尾  | <small>[echasnovski/mini.ai]</small>          |
| <kbd>]c</kbd> 或 <kbd>[c</kbd> |   Ⓝ   | 下/上一个类开头    | <small>[echasnovski/mini.ai]</small>          |
| <kbd>]C</kbd> 或 <kbd>[C</kbd> |   Ⓝ   | 下/上一个类结尾    | <small>[echasnovski/mini.ai]</small>          |
| <kbd>]m</kbd> 或 <kbd>[m</kbd> |   Ⓝ   | 下/上一个方法开头  | <small>[echasnovski/mini.ai]</small>          |
| <kbd>]M</kbd> 或 <kbd>[M</kbd> |   Ⓝ   | 下/上一个方法结尾  | <small>[echasnovski/mini.ai]</small>          |
| <kbd>]g</kbd> 或 <kbd>[g</kbd> |   Ⓝ   | 下/上一个 Git hunk | <small>[lewis6991/gitsigns.nvim]</small>      |
| <kbd>]i</kbd> 或 <kbd>[i</kbd> |   Ⓝ   | 下/上一个缩进块    | <small>[echasnovski/mini.indentscope]</small> |
| <kbd>]t</kbd> 或 <kbd>[t</kbd> |   Ⓝ   | 下/上一个 TODO     | <small>[folke/todo-comments.nvim]</small>     |
| <kbd>]z</kbd> 或 <kbd>[z</kbd> |   Ⓝ   | 下/上一个空白错误  | <small>[config/keymaps.lua]</small>           |

### 缓冲区（Buffers）

| 快捷键                         | 模式  | 功能说明   | 插件或映射                         |
| ------------------------------ | :---: | ---------- | ---------------------------------- |
| <kbd>Space</kbd>+<kbd>bd</kbd> |   Ⓝ   | 删除缓冲区 | <small>[folke/snacks.nvim]</small> |

### 剪贴板（Clipboard）

| 快捷键                        | 模式  | 功能说明                 | 插件或映射                          |
| ----------------------------- | :---: | ------------------------ | ----------------------------------- |
| <kbd>p</kbd> 或 <kbd>P</kbd>  |   Ⓥ   | 粘贴但不覆盖寄存器       | <small>`:let @+=@0`</small>         |
| <kbd>Space</kbd>+<kbd>y</kbd> |   Ⓝ   | 复制相对文件路径到剪贴板 | <small>[config/keymaps.lua]</small> |
| <kbd>Space</kbd>+<kbd>Y</kbd> |   Ⓝ   | 复制绝对文件路径到剪贴板 | <small>[config/keymaps.lua]</small> |

### 自动补全（Auto-Completion）

| 快捷键                                    | 模式  | 功能说明             | 插件或映射                        |
| ----------------------------------------- | :---: | -------------------- | --------------------------------- |
| <kbd>Tab</kbd> / <kbd>Shift-Tab</kbd>     |  Ⓘ Ⓢ  | 补全菜单内切换/打开  | <small>[nvim-cmp]</small>         |
| <kbd>Tab</kbd> / <kbd>Shift-Tab</kbd>     |  Ⓘ Ⓢ  | 片段占位符切换       | <small>[L3MON4D3/LuaSnip]</small> |
| <kbd>Ctrl</kbd>+<kbd>Space</kbd>          |   Ⓘ   | 打开补全菜单         | <small>[nvim-cmp]</small>         |
| <kbd>Enter</kbd>                          |   Ⓘ   | 选择补全项或展开片段 | <small>[nvim-cmp]</small>         |
| <kbd>Shift</kbd>+<kbd>Enter</kbd>         |   Ⓘ   | 选择并替换补全项     | <small>[nvim-cmp]</small>         |
| <kbd>Ctrl</kbd>+<kbd>n</kbd>/<kbd>p</kbd> |   Ⓘ   | 补全弹窗内上下移动   | <small>[nvim-cmp]</small>         |
| <kbd>Ctrl</kbd>+<kbd>f</kbd>/<kbd>b</kbd> |   Ⓘ   | 滚动文档             | <small>[nvim-cmp]</small>         |
| <kbd>Ctrl</kbd>+<kbd>d</kbd>/<kbd>u</kbd> |   Ⓘ   | 候选项滚动           | <small>[nvim-cmp]</small>         |
| <kbd>Ctrl</kbd>+<kbd>e</kbd>              |   Ⓘ   | 取消选择并关闭弹窗   | <small>[nvim-cmp]</small>         |
| <kbd>Ctrl</kbd>+<kbd>l</kbd>              |   Ⓘ   | 在光标处展开片段     | <small>[L3MON4D3/LuaSnip]</small> |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>              |   Ⓘ   | 关闭补全菜单         | <small>[nvim-cmp]</small>         |

### LSP（语言服务器协议）

| 快捷键                          | 模式  | 操作说明               | 插件或映射                               |
| ------------------------------- | :---: | ---------------------- | ---------------------------------------- |
| <kbd>gr</kbd>                   |   Ⓝ   | 跳转到引用             | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>gR</kbd>                   |   Ⓝ   | 使用 Trouble 列出引用  | <small>[folke/trouble.nvim]</small>      |
| <kbd>gd</kbd>                   |   Ⓝ   | 跳转到定义             | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>gD</kbd>                   |   Ⓝ   | 跳转到声明             | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>gI</kbd>                   |   Ⓝ   | 跳转到实现             | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>gy</kbd>                   |   Ⓝ   | 跳转到类型定义         | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>K</kbd>                    |   Ⓝ   | 显示悬浮帮助或折叠提示 | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>gK</kbd>                   |   Ⓝ   | 显示签名帮助           | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>cr</kbd>  |   Ⓝ   | 重命名                 | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>ce</kbd>  |   Ⓝ   | 打开诊断窗口           | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>cs</kbd>  |   Ⓝ   | 格式化菜单选择         | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>ca</kbd>  |  Ⓝ Ⓥ  | 代码操作               | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>cA</kbd>  |   Ⓝ   | 源码操作               | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>cli</kbd> |   Ⓝ   | LSP 传入调用           | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>clo</kbd> |   Ⓝ   | LSP 传出调用           | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>fwa</kbd> |   Ⓝ   | 添加工作区文件夹       | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>fwr</kbd> |   Ⓝ   | 移除工作区文件夹       | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>fwl</kbd> |   Ⓝ   | 列出工作区文件夹       | <small>[plugins/lsp/keymaps.lua]</small> |
| <kbd>Space</kbd> <kbd>cgd</kbd> |   Ⓝ   | Glance 查看定义        | <small>[dnlhc/glance.nvim]</small>       |
| <kbd>Space</kbd> <kbd>cgr</kbd> |   Ⓝ   | Glance 查看引用        | <small>[dnlhc/glance.nvim]</small>       |
| <kbd>Space</kbd> <kbd>cgy</kbd> |   Ⓝ   | Glance 查看类型定义    | <small>[dnlhc/glance.nvim]</small>       |
| <kbd>Space</kbd> <kbd>cgi</kbd> |   Ⓝ   | Glance 查看实现        | <small>[dnlhc/glance.nvim]</small>       |
| <kbd>Space</kbd> <kbd>cgu</kbd> |   Ⓝ   | Glance 恢复上次查看    | <small>[dnlhc/glance.nvim]</small>       |

### 诊断（Diagnostics）

| 快捷键                         | 模式  | 操作说明                       | 插件或映射                                |
| ------------------------------ | :---: | ------------------------------ | ----------------------------------------- |
| <kbd>Space</kbd> <kbd>ud</kbd> |   Ⓝ   | 切换缓冲区诊断                 | <small>[plugins/lsp/keymaps.lua]</small>  |
| <kbd>Space</kbd> <kbd>xt</kbd> |   Ⓝ   | 使用 Trouble 列出 TODO         | <small>[folke/todo-comments.nvim]</small> |
| <kbd>Space</kbd> <kbd>xT</kbd> |   Ⓝ   | 使用 Trouble 列出 TODO/FIXME   | <small>[folke/todo-comments.nvim]</small> |
| <kbd>Space</kbd> <kbd>st</kbd> |   Ⓝ   | 使用 Telescope 选择 TODO       | <small>[folke/todo-comments.nvim]</small> |
| <kbd>Space</kbd> <kbd>sT</kbd> |   Ⓝ   | 使用 Telescope 选择 TODO/FIXME | <small>[folke/todo-comments.nvim]</small> |
| <kbd>Space</kbd> <kbd>xx</kbd> |   Ⓝ   | 切换 Trouble 诊断面板          | <small>[folke/trouble.nvim]</small>       |
| <kbd>Space</kbd> <kbd>xd</kbd> |   Ⓝ   | 切换 Trouble 文档诊断          | <small>[folke/trouble.nvim]</small>       |
| <kbd>Space</kbd> <kbd>xw</kbd> |   Ⓝ   | 切换 Trouble 工作区诊断        | <small>[folke/trouble.nvim]</small>       |
| <kbd>Space</kbd> <kbd>xq</kbd> |   Ⓝ   | 使用 Trouble 切换 Quickfix     | <small>[folke/trouble.nvim]</small>       |
| <kbd>Space</kbd> <kbd>xl</kbd> |   Ⓝ   | 使用 Trouble 切换 Locationlist | <small>[folke/trouble.nvim]</small>       |

### Coding

| Key                                           | Mode  | Action                                  | Plugin or Mapping                          |
| --------------------------------------------- | :---: | --------------------------------------- | ------------------------------------------ |
| <kbd>Ctrl</kbd>+<kbd>q</kbd>                  |   Ⓝ   | Start recording macro                   | <small>`q`</small>                         |
| <kbd>Space</kbd> <kbd>cf</kbd>                |  Ⓝ Ⓥ  | Format                                  | <small>[plugins/formatting.lua]</small>    |
| <kbd>Space</kbd> <kbd>cF</kbd>                |  Ⓝ Ⓥ  | Format injected langs                   | <small>[plugins/formatting.lua]</small>    |
| <kbd>Space</kbd> <kbd>cc</kbd>                |   Ⓝ   | Generate doc annotations                | <small>[danymat/neogen]</small>            |
| <kbd>Shift</kbd>+<kbd>Return</kbd>            |   Ⓘ   | Start new line from any cursor position | <small>`<C-o>o`</small>                    |
| <kbd>]</kbd> <kbd>Space</kbd>                 |   Ⓝ   | Add new line below                      | <small>`o<Esc>`</small>                    |
| <kbd>[</kbd> <kbd>Space</kbd>                 |   Ⓝ   | Add new line above                      | <small>`O<Esc>`</small>                    |
| <kbd>gc</kbd>                                 |  Ⓝ Ⓥ  | Comment prefix                          | <small>[numToStr/Comment.nvim]</small>     |
| <kbd>gcc</kbd>                                |  Ⓝ Ⓥ  | Toggle comments                         | <small>[numToStr/Comment.nvim]</small>     |
| <kbd>Space</kbd>+<kbd>j</kbd> or <kbd>k</kbd> |  Ⓝ Ⓥ  | Move lines down/up                      | <small>`:m` …                              |
| <kbd>Space</kbd>+<kbd>v</kbd>                 |  Ⓝ Ⓥ  | Toggle line-wise comments               | <small>[numToStr/Comment.nvim]</small>     |
| <kbd>Space</kbd>+<kbd>V</kbd>                 |  Ⓝ Ⓥ  | Toggle block-wise comments              | <small>[numToStr/Comment.nvim]</small>     |
| <kbd>Space</kbd>+<kbd>dd</kbd>                |  Ⓝ Ⓥ  | Duplicate line or selection             | <small>[config/keymaps.lua]</small>        |
| <kbd>Space</kbd>+<kbd>cw</kbd>                |   Ⓝ   | Remove all spaces at EOL                | <small>[nvim-mini/mini.trailspace]</small> |
| <kbd>Space</kbd>+<kbd>cid</kbd>               |   Ⓝ   | LazyDev                                 | <small>[folke/lazydev.nvim]</small>        |
| <kbd>Space</kbd>+<kbd>cif</kbd>               |   Ⓝ   | LazyFormatterInfo                       | <small>[LazyVim/LazyVim]</small>           |
| <kbd>Space</kbd>+<kbd>cir</kbd>               |   Ⓝ   | LazyRoot                                | <small>[LazyVim/LazyVim]</small>           |
| <kbd>sj</kbd> / <kbd>sk</kbd>                 |   Ⓝ   | Join/split arguments                    | <small>[nvim-mini/mini.splitjoin]</small>  |

### 搜索、替换与差异（Search, Substitute, Diff）

| 快捷键                         | 模式  | 操作说明                   | 插件或映射                          |
| ------------------------------ | :---: | -------------------------- | ----------------------------------- |
| <kbd>\*</kbd> / <kbd>#</kbd>   |  Ⓝ Ⓥ  | 搜索部分单词               | <small>`g*` / `g#`</small>          |
| <kbd>g\*</kbd> / <kbd>g#</kbd> |  Ⓝ Ⓥ  | 搜索完整单词（前/后）      | <small>`*` / `#`</small>            |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>   |   Ⓝ   | 修改当前单词               | <small>`ciw`</small>                |
| <kbd>Escape</kbd>              |   Ⓝ   | 清除搜索高亮               | <small>`:nohlsearch`</small>        |
| <kbd>Backspace</kbd>           |   Ⓝ   | 匹配括号                   | <small>`%`</small>                  |
| <kbd>Space</kbd>+<kbd>bf</kbd> |   Ⓝ   | 在当前标签页窗口间比对差异 | <small>`windo diffthis`</small>     |
| <kbd>Space</kbd>+<kbd>bF</kbd> |   Ⓝ   | 外部 diff 比较             | <small>`!vim.g.diffprg % #`</small> |
| <kbd>ss</kbd>                  | Ⓝ Ⓥ Ⓞ | Flash 跳转                 | <small>[folke/flash.nvim]</small>   |
| <kbd>S</kbd>                   | Ⓝ Ⓥ Ⓞ | Flash Treesitter 跳转      | <small>[folke/flash.nvim]</small>   |
| <kbd>r</kbd>                   |   Ⓞ   | Flash 远程跳转             | <small>[folke/flash.nvim]</small>   |
| <kbd>R</kbd>                   |  Ⓥ Ⓞ  | Flash Treesitter 搜索      | <small>[folke/flash.nvim]</small>   |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>   |   Ⓒ   | 在搜索输入时切换 Flash     | <small>[folke/flash.nvim]</small>   |

### 命令与历史（Command & History）

| 快捷键                                      | 模式  | 操作说明              | 插件或映射                         |
| ------------------------------------------- | :---: | --------------------- | ---------------------------------- |
| <kbd>g!</kbd>                               |   Ⓝ   | 读取 Vim 命令到缓冲区 | <small>`:put=execute('⌴')`</small> |
| <kbd>Ctrl</kbd>+<kbd>n</kbd> / <kbd>p</kbd> |   Ⓒ   | 切换历史搜索条目      | <kbd>↓</kbd> / <kbd>↑</kbd>        |
| <kbd>↓</kbd> / <kbd>↑</kbd>                 |   Ⓒ   | 切换历史搜索条目      | <small>`Ctrl` `n`/`p`</small>      |

### 文件操作

| 按键                                                       | 模式  | 动作说明                             | 插件或映射                  |
| ---------------------------------------------------------- | :---: | ------------------------------------ | --------------------------- |
| <kbd>Space</kbd>+<kbd>cd</kbd>                             |   Ⓝ   | 将当前标签页切换到当前缓冲区所在目录 | <small>`:tcd %:p:h`</small> |
| <kbd>Space</kbd>+<kbd>w</kbd> 或 <kbd>M</kbd>+<kbd>s</kbd> |   Ⓝ   | 保存缓冲区到文件                     | <small>`:write`</small>     |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>                               | Ⓝ Ⓥ Ⓒ | 保存缓冲区到文件                     | <small>`:write`</small>     |

### 窗口管理

| 按键                           | 模式  | 动作说明                                  | 插件或映射                                 |
| ------------------------------ | :---: | ----------------------------------------- | ------------------------------------------ |
| <kbd>Space</kbd> <kbd>qq</kbd> |   Ⓝ   | 退出全部窗口并关闭 Neovim                 | <small>`:quitall`</small>                  |
| <kbd>s]</kbd>                  |   Ⓝ   | 旋转窗口位置                              | <small>`C-w` `x`</small>                   |
| <kbd>sp</kbd>                  |   Ⓝ   | 选择一个窗口进行编辑                      | <small>[s1n7ax/nvim-window-picker]</small> |
| <kbd>sw</kbd>                  |   Ⓝ   | 与所选窗口互换内容                        | <small>[s1n7ax/nvim-window-picker]</small> |
| <kbd>sv</kbd>                  |   Ⓝ   | 水平分割窗口                              | <small>`:split`</small>                    |
| <kbd>sg</kbd>                  |   Ⓝ   | 垂直分割窗口                              | <small>`:vsplit`</small>                   |
| <kbd>st</kbd>                  |   Ⓝ   | 新建标签页                                | <small>`:tabnew`</small>                   |
| <kbd>so</kbd>                  |   Ⓝ   | 关闭其他窗口                              | <small>`:only`</small>                     |
| <kbd>sb</kbd>                  |   Ⓝ   | 切换到上一个缓冲区                        | <small>`:b#`</small>                       |
| <kbd>sc</kbd>                  |   Ⓝ   | 关闭当前窗口                              | <small>`:close`</small>                    |
| <kbd>sd</kbd>                  |   Ⓝ   | 删除当前缓冲区                            | <small>`:bdelete`</small>                  |
| <kbd>sq</kbd>                  |   Ⓝ   | 关闭窗口（若为最后一个窗口则退出 Neovim） | <small>`:quit`</small>                     |
| <kbd>sx</kbd>                  |   Ⓝ   | 删除缓冲区并保留空窗口                    | <small>`:enew │ bdelete`</small>           |
| <kbd>sz</kbd>                  |   Ⓝ   | 切换窗口放大/还原                         | <small>`:vertical resize │ resize`</small> |
| <kbd>sh</kbd>                  |   Ⓝ   | 切换配色方案背景（深色/浅色）             | <small>`:set background` …                 |

### 插件与工具

| 按键                                     | 模式  | 动作说明                                 | 插件或映射                                     |
| ---------------------------------------- | :---: | ---------------------------------------- | ---------------------------------------------- |
| <kbd>;</kbd>+<kbd>c</kbd>                |   Ⓝ   | 打开上下文菜单                           | <small>[lua/rafi/util/contextmenu.lua]</small> |
| <kbd>g</kbd><kbd>Ctrl</kbd>+<kbd>o</kbd> |   Ⓝ   | 在跳转列表中回到较旧的文件               | <small>[util/edit.lua]</small>                 |
| <kbd>g</kbd><kbd>Ctrl</kbd>+<kbd>i</kbd> |   Ⓝ   | 在跳转列表中前进到较新的文件             | <small>[util/edit.lua]</small>                 |
| <kbd>Ctrl</kbd>+<kbd>/</kbd>             |   Ⓝ   | 切换浮动终端                             | <small>[folke/snacks.nvim]</small>             |
| <kbd>Space</kbd> <kbd>l</kbd>            |   Ⓝ   | 打开 Lazy 插件管理器                     | <small>[folke/lazy.nvim]</small>               |
| <kbd>Space</kbd> <kbd>o</kbd>            |   Ⓝ   | 打开 Outline 侧边栏                      | <small>[hedyhli/outline.nvim]</small>          |
| <kbd>Space</kbd> <kbd>?</kbd>            |   Ⓝ   | 查询当前单词的 macOS 词典                | <small>`:!open dict://`</small>                |
| <kbd>Space</kbd> <kbd>cp</kbd>           |   Ⓝ   | 切换 Markdown 预览                       | <small>iamcco/markdown-preview.nvim</small>    |
| <kbd>Space</kbd> <kbd>mc</kbd>           |   Ⓝ   | 打开取色器                               | <small>[uga-rosa/ccc.nvim]</small>             |
| <kbd>Space</kbd> <kbd>tt</kbd>           |   Ⓝ   | 在项目根目录打开终端                     | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>tT</kbd>           |   Ⓝ   | 在当前工作目录打开终端                   | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>gt</kbd>           |   Ⓝ   | 在项目根目录启动 Lazygit                 | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>gT</kbd>           |   Ⓝ   | 在当前工作目录启动 Lazygit               | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>gF</kbd>           |   Ⓝ   | 在 Lazygit 中查看当前文件的提交历史      | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>gl</kbd>           |   Ⓝ   | 打开 Lazygit 提交日志                    | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>gL</kbd>           |   Ⓝ   | 打开 Lazygit 当前目录的提交日志          | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>gb</kbd>           |   Ⓝ   | 查看 Git blame                           | <small>[FabijanZulj/blame.nvim]</small>        |
| <kbd>Space</kbd> <kbd>gB</kbd>           |   Ⓝ   | 在新窗口中查看 Git blame                 | <small>[FabijanZulj/blame.nvim]</small>        |
| <kbd>Space</kbd> <kbd>gm</kbd>           |   Ⓝ   | 查看光标下提交的详细信息                 | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>go</kbd>           |  Ⓝ Ⓥ  | 打开光标选区的源码链接                   | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>gY</kbd>           |  Ⓝ Ⓥ  | 复制光标选区的源码链接                   | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>gu</kbd>           |   Ⓝ   | 打开撤销树                               | <small>[mbbill/undotree]</small>               |
| <kbd>Space</kbd> <kbd>mg</kbd>           |   Ⓝ   | 打开 Neogit                              | <small>[NeogitOrg/neogit]</small>              |
| <kbd>Space</kbd> <kbd>ml</kbd>           |   Ⓝ   | 在文件末尾追加 modeline 设置行           | <small>[config/keymaps.lua]</small>            |
| <kbd>Space</kbd> <kbd>mda</kbd>          |   Ⓥ   | 依次标记多段区域用于 diff                | <small>[AndrewRadev/linediff.vim]</small>      |
| <kbd>Space</kbd> <kbd>mdf</kbd>          |   Ⓥ   | 标记区域并在超过一个标记时进行 diff 对比 | <small>[AndrewRadev/linediff.vim]</small>      |
| <kbd>Space</kbd> <kbd>mds</kbd>          |   Ⓝ   | 展示所有标记区域的比较结果               | <small>[AndrewRadev/linediff.vim]</small>      |
| <kbd>Space</kbd> <kbd>mdr</kbd>          |   Ⓝ   | 清除 diff 标记                           | <small>[AndrewRadev/linediff.vim]</small>      |
| <kbd>Space</kbd> <kbd>mh</kbd>           |   Ⓝ   | 打开 HTTP Rest UI                        | <small>[rest-nvim/rest.nvim]</small>           |
| <kbd>Space</kbd> <kbd>mt</kbd>           |  Ⓝ Ⓥ  | 切换高亮当前单词                         | <small>[t9md/vim-quickhl]</small>              |
| <kbd>Space</kbd> <kbd>mo</kbd>           |   Ⓝ   | 更新 Markdown 目录                       | <small>[mzlogin/vim-markdown-toc]</small>      |

#### 插件：Mini.Surround

参见 [echasnovski/mini.surround] 获取更多快捷键和用法说明。

| 快捷键                | 模式  | 功能说明         |
| --------------------- | :---: | ---------------- |
| <kbd>sa</kbd> & 移动  |  Ⓝ Ⓥ  | 添加包裹符号     |
| <kbd>cs</kbd> & 移动  |   Ⓝ   | 替换包裹符号     |
| <kbd>ds</kbd> & 移动  |   Ⓝ   | 删除包裹符号     |
| <kbd>gzf</kbd> & 移动 |   Ⓝ   | 查找右侧包裹符号 |
| <kbd>gzF</kbd> & 移动 |   Ⓝ   | 查找左侧包裹符号 |
| <kbd>gzh</kbd> & 移动 |   Ⓝ   | 高亮包裹对象     |
| <kbd>gzn</kbd> & 移动 |   Ⓝ   | 更新邻近行的包裹 |

#### 插件：Gitsigns

参见 [lewis6991/gitsigns.nvim] 获取更多快捷键和用法说明。

| 快捷键                          | 模式  | 功能说明                   |
| ------------------------------- | :---: | -------------------------- |
| <kbd>]g</kbd> 或 <kbd>[g</kbd>  |   Ⓝ   | 下/上一个 Git hunk         |
| <kbd>gs</kbd>                   |   Ⓝ   | 预览 hunk                  |
| <kbd>Space</kbd> <kbd>hp</kbd>  |   Ⓝ   | 行内预览 hunk              |
| <kbd>Space</kbd> <kbd>hb</kbd>  |   Ⓝ   | 查看该行 blame             |
| <kbd>Space</kbd> <kbd>hs</kbd>  |  Ⓝ Ⓥ  | 暂存 hunk                  |
| <kbd>Space</kbd> <kbd>hr</kbd>  |  Ⓝ Ⓥ  | 恢复 hunk                  |
| <kbd>Space</kbd> <kbd>hu</kbd>  |   Ⓝ   | 撤销暂存 hunk              |
| <kbd>Space</kbd> <kbd>hS</kbd>  |   Ⓝ   | 暂存整个缓冲区             |
| <kbd>Space</kbd> <kbd>hR</kbd>  |   Ⓝ   | 恢复整个缓冲区             |
| <kbd>Space</kbd> <kbd>hd</kbd>  |   Ⓝ   | 与索引比较差异             |
| <kbd>Space</kbd> <kbd>hD</kbd>  |   Ⓝ   | 与上一次提交比较差异       |
| <kbd>Space</kbd> <kbd>hw</kbd>  |   Ⓝ   | 切换单词级 diff            |
| <kbd>Space</kbd> <kbd>hl</kbd>  |   Ⓝ   | 发布 hunk 到 location-list |
| <kbd>Space</kbd> <kbd>htb</kbd> |   Ⓝ   | 切换当前行 blame           |
| <kbd>Space</kbd> <kbd>htd</kbd> |   Ⓝ   | 切换已删除行显示           |
| <kbd>Space</kbd> <kbd>htw</kbd> |   Ⓝ   | 切换单词高亮 diff          |
| <kbd>Space</kbd> <kbd>htl</kbd> |   Ⓝ   | 切换行高亮                 |
| <kbd>Space</kbd> <kbd>htn</kbd> |   Ⓝ   | 切换行号高亮               |
| <kbd>Space</kbd> <kbd>hts</kbd> |   Ⓝ   | 切换 Git 标记              |
| <kbd>ih</kbd>                   |   Ⓞ   | 选择 hunk 操作对象         |

#### 插件：Diffview

参见 [sindrets/diffview.nvim] 获取更多快捷键和用法说明。

| 快捷键                                           | 模式  | 功能说明              |
| ------------------------------------------------ | :---: | --------------------- |
| <kbd>Space</kbd> <kbd>gd</kbd>                   |   Ⓝ   | 查看文件历史差异      |
| <kbd>Space</kbd> <kbd>gv</kbd>                   |   Ⓝ   | 打开差异视图          |
|                                                  |       | &nbsp;                |
| **在 _diffview_ “视图”窗口内**                   |       | &nbsp;                |
|                                                  |       | &nbsp;                |
| <kbd>Tab</kbd> / <kbd>Shift</kbd>+<kbd>Tab</kbd> |   Ⓝ   | 选择下一个/上一个条目 |
| <kbd>;</kbd> <kbd>a</kbd>                        |   Ⓝ   | 聚焦文件              |
| <kbd>;</kbd> <kbd>e</kbd>                        |   Ⓝ   | 切换文件面板          |
|                                                  |       | &nbsp;                |
| **在 _diffview_ “文件”面板内**                   |       | &nbsp;                |
|                                                  |       | &nbsp;                |
| <kbd>q</kbd>                                     |   Ⓝ   | 关闭                  |
| <kbd>h</kbd>                                     |   Ⓝ   | 上一个条目            |
| <kbd>o</kbd>                                     |   Ⓝ   | 聚焦条目              |
| <kbd>gf</kbd>                                    |   Ⓝ   | 打开文件              |
| <kbd>sg</kbd>                                    |   Ⓝ   | 分屏打开文件          |
| <kbd>st</kbd>                                    |   Ⓝ   | 新标签页打开文件      |
| <kbd>Ctrl</kbd>+<kbd>r</kbd>                     |   Ⓝ   | 刷新文件              |
| <kbd>;</kbd> <kbd>e</kbd>                        |   Ⓝ   | 切换面板              |
|                                                  |       | &nbsp;                |
| **在 _diffview_ “历史”面板内**                   |       | &nbsp;                |
|                                                  |       | &nbsp;                |
| <kbd>q</kbd>                                     |   Ⓝ   | 关闭 diffview         |
| <kbd>o</kbd>                                     |   Ⓝ   | 聚焦条目              |
| <kbd>O</kbd>                                     |   Ⓝ   | 显示选项              |

#### 插件：Neo-Tree

参见 [nvim-neo-tree/neo-tree.nvim] 获取更多快捷键和用法说明。

| 快捷键                                            | 模式  | 功能说明                       |
| ------------------------------------------------- | :---: | ------------------------------ |
| <kbd>Space</kbd> <kbd>e</kbd>/<kbd>fe</kbd>       |   Ⓝ   | 切换文件浏览器（根目录）       |
| <kbd>Space</kbd> <kbd>E</kbd>/<kbd>fE</kbd>       |   Ⓝ   | 切换文件浏览器（当前目录）     |
| <kbd>ge</kbd>                                     |   Ⓝ   | 打开 Git 浏览器                |
| <kbd>be</kbd>                                     |   Ⓝ   | 打开缓冲区浏览器               |
| <kbd>;a</kbd>                                     |   Ⓝ   | 在文件浏览器中定位             |
| <kbd>;A</kbd>                                     |   Ⓝ   | 在文件浏览器中定位（当前目录） |
|                                                   |       | &nbsp;                         |
| **在 _Neo-Tree_ 窗口内**                          |       | &nbsp;                         |
|                                                   |       | &nbsp;                         |
| <kbd>g?</kbd>                                     |   Ⓝ   | 显示帮助                       |
| <kbd>q</kbd>                                      |   Ⓝ   | 关闭窗口                       |
| <kbd>j</kbd> 或 <kbd>k</kbd>                      |   Ⓝ   | 上下移动树节点                 |
| <kbd>Tab</kbd> 或 <kbd>Shift</kbd>+<kbd>Tab</kbd> |   Ⓝ   | 下一个/上一个源                |
| <kbd>]g</kbd> 或 <kbd>[g</kbd>                    |   Ⓝ   | 跳转到下/上一个 Git 修改节点   |
| <kbd>l</kbd>                                      |   Ⓝ   | 展开/收起目录或打开文件        |
| <kbd>h</kbd>                                      |   Ⓝ   | 收起目录树                     |
| <kbd>Return</kbd>                                 |   Ⓝ   | 选择窗口打开文件               |
| <kbd>gr</kbd>                                     |   Ⓝ   | 在当前位置 grep 搜索           |
| <kbd>gf</kbd>                                     |   Ⓝ   | 在当前位置查找文件             |
| <kbd>.</kbd>                                      |   Ⓝ   | 设为根目录                     |
| <kbd>Backspace</kbd>                              |   Ⓝ   | 切换到上级目录                 |
| <kbd>sv</kbd> 或 <kbd>S</kbd>                     |   Ⓝ   | 水平分屏打开文件               |
| <kbd>sg</kbd> 或 <kbd>s</kbd>                     |   Ⓝ   | 垂直分屏打开文件               |
| <kbd>st</kbd> 或 <kbd>t</kbd>                     |   Ⓝ   | 新标签页打开文件               |
| <kbd>p</kbd>                                      |   Ⓝ   | 切换预览                       |
| <kbd>a</kbd>                                      |   Ⓝ   | 新建目录和/或文件              |
| <kbd>N</kbd>                                      |   Ⓝ   | 新建目录                       |
| <kbd>r</kbd>                                      |   Ⓝ   | 重命名文件或目录               |
| <kbd>dd</kbd>                                     |   Ⓝ   | 删除                           |
| <kbd>c</kbd> / <kbd>m</kbd>                       |   Ⓝ   | 复制/移动                      |
| <kbd>y</kbd> / <kbd>x</kbd> / <kbd>P</kbd>        |   Ⓝ   | 剪贴板复制/剪切/粘贴           |
| <kbd>!</kbd>                                      |   Ⓝ   | 过滤                           |
| <kbd>D</kbd>                                      |   Ⓝ   | 过滤目录                       |
| <kbd>#</kbd>                                      |   Ⓝ   | 模糊排序                       |
| <kbd>F</kbd>                                      |   Ⓝ   | 提交时过滤                     |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>                      |   Ⓝ   | 清除过滤                       |
| <kbd>Ctrl</kbd>+<kbd>r</kbd> 或 <kbd>R</kbd>      |   Ⓝ   | 刷新                           |
| <kbd>fi</kbd> / <kbd>fe</kbd>                     |   Ⓝ   | 包含/排除                      |
| <kbd>H</kbd>                                      |   Ⓝ   | 显示/隐藏隐藏文件              |
| <kbd>e</kbd>                                      |   Ⓝ   | 自动展开窗口宽度               |
| <kbd>w</kbd>                                      |   Ⓝ   | 切换窗口宽度                   |
| <kbd>z</kbd>                                      |   Ⓝ   | 收起所有节点                   |

#### 插件：Marks

参见 [chentau/marks.nvim] 获取更多快捷键和用法说明。

| 快捷键                       | 模式  | 功能说明                       |
| ---------------------------- | :---: | ------------------------------ |
| <kbd>m,</kbd>                |   Ⓝ   | 设置下一个可用字母（小写）标记 |
| <kbd>m;</kbd>                |   Ⓝ   | 切换当前行下一个可用标记       |
| <kbd>m</kbd> <kbd>a-z</kbd>  |   Ⓝ   | 设置标记                       |
| <kbd>dm</kbd> <kbd>a-z</kbd> |   Ⓝ   | 删除指定标记                   |
| <kbd>dm-</kbd>               |   Ⓝ   | 删除当前行所有标记             |
| <kbd>dm\<Space></kbd>        |   Ⓝ   | 删除当前缓冲区所有标记         |
| <kbd>m]</kbd>                |   Ⓝ   | 跳转到下一个标记               |
| <kbd>m[</kbd>                |   Ⓝ   | 跳转到上一个标记               |
| <kbd>m:</kbd> <kbd>a-z</kbd> |   Ⓝ   | 预览指定标记                   |
| <kbd>m/</kbd>                |   Ⓝ   | 列出所有已打开缓冲区的标记     |

#### 插件：Zk

参见 [zk-org/zk-nvim] 和 [zk](https://github.com/zk-org/zk) 获取更多快捷键和用法说明。

| 快捷键                         | 模式  | 功能说明                  |
| ------------------------------ | :---: | ------------------------- |
| <kbd>Space</kbd>+<kbd>zn</kbd> |   Ⓝ   | 输入标题并创建新笔记      |
| <kbd>Space</kbd>+<kbd>zo</kbd> |   Ⓝ   | 按修改时间浏览笔记        |
| <kbd>Space</kbd>+<kbd>zt</kbd> |   Ⓝ   | 浏览标签                  |
| <kbd>Space</kbd>+<kbd>zf</kbd> |   Ⓝ   | 搜索笔记                  |
| <kbd>Space</kbd>+<kbd>zf</kbd> |   Ⓥ   | 选区内搜索笔记            |
| <kbd>Space</kbd>+<kbd>zb</kbd> |   Ⓝ   | 显示反向链接（backlinks） |
| <kbd>Space</kbd>+<kbd>zl</kbd> |   Ⓝ   | 显示当前笔记的所有链接    |

</details>


---

## 参考链接

[Neovim]: https://github.com/neovim/neovim
[LazyVim]: https://www.lazyvim.org/
[lazy.nvim]: https://github.com/folke/lazy.nvim
[lua/rafi/plugins/lsp/init.lua]: ./lua/rafi/plugins/lsp/init.lua
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[blink.cmp]: https://github.com/saghen/blink.cmp
[nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[config/keymaps.lua]: ./lua/rafi/config/keymaps.lua
[util/edit.lua]: ./lua/rafi/util/edit.lua
[plugins/lsp/keymaps.lua]: ./lua/rafi/plugins/lsp/keymaps.lua
[lua/rafi/util/contextmenu.lua]: ./lua/rafi/util/contextmenu.lua
[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[lazyvim.org/extras]: https://www.lazyvim.org/extras

---

