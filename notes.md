# Vim notes

## Why not Neovim

as of 2024 - not going to continue down neovim any longer.

* Still too many LSPs that don't just work
  * i.e. tailwindcss
* too much time customizing
* no good remote solution
* too many bugs
* inadequate debugger
* vscode is still really really fast
* vscode has sooooo many plugins like draw.io
* vscode jupyter notebooks actually work
* pasting images, image support, file support, all in one editor, etc...

### The good of neovim

* it's **almost** ready
  * once everything matures (5 years?) and just works
  * most things auto install
  * kickstart was a great boostrapper
* telescope
  * fuzzy finding things was awesome
  * this was arguably the most beneficial part of the whole thing
  * double space to quickly jump / fuzzy find files was amazing
    * also - with preview
  * could just reimplement this in VSCode ....
* learned vim shortcuts
* extremely efficient / fast
* pure vim shortcuts
* git with pure keyboard shortcuts
* can make literally anything work
  * but VSCode could too - with a bit of work

### Learnings

* Take best parts of neovim and move to vscode

## Why vim

- fast
  - startup
  - latency
  - search
- customizable 100%
- useful with i3, tmux, alacritty
- no tabs - just sf sr etc... fast file changing
- all keyboard
- easy install w/ lazy / kickstart self bootstrapping
- relatively stable now

## Why not vim

- Visual stuff
  - diagrams
  - images in markdown
  - Zotero support =(
    - Can we use firenvim
  - paste image (kinda works...)
    - may not need anymore with Zotero
  - special IDEs
    - Java
    - Anypoint studio
    - Databricks

## Link to wsl

`ln -s /mnt/c/Users/<username>/Documents/architecture ~/architecture`
`ln -s /mnt/c/Users/<username>/Documents/innovation ~/innovation`

## Issues

* ConPTY on Win 10 doesn't support mouse - https://github.com/microsoft/terminal/issues/376
* How should we paste between system and not?
  * how should we paste into tmux?
* clipboard paste image
  * have semi working

## Init

> Goal keep close to stock theprimagen / kickstart w/out too many customizations

Clone kickstart nvim into ~/.config/nvim
Clone theprimeagen nvim into ~/.config/nvim/theprimeagen
Copy After from theprimeagen into lua/custom/plugins/<filename>
Copy lines into

```lua
return {
  'plugin/name',
  function config()
  <lines>
  end,
}
```

Add to `custom/init.lua` the `require(../../kickstart/plugins/<name of plug)` to add TJs other plugins

## Ansible

> Need to make this into a container

```bash
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt install ansible
<copy setup.yml to a file>
ansible-playbook setup.yml -K
```

## Vs intellij

- color is better
- shortcuts MUCH better in nvim
- speed
- cost
- intellij has *sometimes* better lsp
- rust_analyzer is better, but requires functions

## Necessities

### Mason

Use Mason to install LSP, linters, formatters, etc...
:Mason

#### Markdown

- prettier

#### Javascript

- prettier

#### Python

- black
- pyright
- flake8
- debugpy

#### Rust

- rust_format
- rust_analyzer

### Windows

ctrl+w = windows

### Terminal

ctrl \, ctrl n = escape to regular mode
i = insert mode

### Harpoon

edit harpoon file - normal vim keys
mark file - <leader>m
file 1-4 - <leader>1-4
harpoon file - <leader>tab

### Telescope

- git_files
- live_grep
- sf = search files
- sr = search ripgrep
- <space><space> = search buffers

### Treesitter

- format file - <leader>s
- [d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
- ]d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
- <leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
- <leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

### LSP

> putting a file in `after\plugins` with the `'lspconfig'.setup() {crap here}`
> works fine with mason.

> Use :LspInfo to check if your LSP is running
> Use :Mason to install the LSP

K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
<F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
<F3>: Format code in current buffer. See :help vim.lsp.buf.format().
<F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
[d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().

### Git

> Protip: if you used HTTPS, it will prompt for username / password. to fix, use `git remote set-url origin git@github.com:diablozzq/kickstart.nvim.git`

#### Merges

- pull the latest / push the latest causing a conflict
- use enter to open file
- use = / dd to show diff
- files should contain merge conflict in diff
- go to file, delete conflict
- save and stage and commit

#### Keys

- open file <Enter on file>
- status <leader>gs
- help - (in fugitive) g?
- commit - (in fugitive) cc
- undo staged - u
- stage - s
- revert change - X
- diff both in line - (in fugitive) dd
- diff single line - (in fugitive) =
- push - (in fugitive) <leader>gp
- pull - (in fugitive) <leader>gP

### Debug

- debug visual
- breakpoint
- start w/ debug
- run w/out debug

## Other

### Telescope

:Telescope keymaps

## Paste Img

> Note: something about os.execute or io.pipe seems to be screwing with neovim refresh
> Note: tmux seems to fix the screwing with neovim...


Paste image fix
https://github.com/ekickx/clipboard-image.nvim/pull/48/files

```
M lua/clipboard-image/health.lua
@@ -1,6 +1,5 @@
 local M = {}
 local utils = require "clipboard-image.utils"
-local health = require "health"

 local packages = {
   x11 = { name = "xclip", binary = "xclip" },
@@ -48,11 +47,11 @@ end
 M.check = function()
   local is_dep_exist, report_msg = M.check_current_dep()

-  health.report_start "Checking dependencies"
+  vim.health.report_start "Checking dependencies"
   if is_dep_exist then
-    health.report_ok(report_msg)
+    vim.health.report_ok(report_msg)
   else
-    health.report_error(report_msg)
+    vim.health.report_error(report_msg)
   end
 end
```

```
    cmd_check = 'powershell.exe -nologo -noprofile -noninteractive "(Get-Clipboard -Format Image)"'
    cmd_paste = 'powershell.exe -nologo -noprofile -noninteractive "(Get-Clipboard -Format Image).save(' ..
```

```
-  os.execute(string.format(cmd_paste, path))
+  --print('Saving image')
+  --os.execute()
+  local command = string.format(cmd_paste, path)
+  -- print(command)
+  io.stdout:setvbuf 'no'
+  local file = assert(io.popen(command, 'r'))
+  file:flush() -- > important to prevent receiving partial output
+  local output = file:read('*all')
+  --print(output)
+  file:close()
```

## Todo

Refactoring rename variable
theprimagen refactoring - but doesn't support rust

### Tmux + neovim

* add send to tmux
* add quick way to open terminal

## Plugins

Plugins are stored in `~/.local/share/nvim/lazy/<github name>`

### Reinstall

- run the install.sh to refresh all plugins and reinstall

### Updates

- :Lazy
  - Shift+U to update

### Alarcitty

Go to alacritty github, download latest release

### Nvim

```bash
cd ~/Downloads
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz
rm -rf ~/.nvim
mv ~/Downloads/nvim-linux64 ~/.nvim
```

### Kickstart

```bash
rm -rf ~/.local/share/nvim/lazy
move ~/.config/nvim to ~/.config/nvim-old
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
```

### Spell

- zg - marks the word as a good spelling and saves to
  `~/.config/nvim/spell/en.utf-8.add`
- [s and ]s move between misspelled words
- z= - suggestions for the word

## Tricks

* You can put files in `~/.config/nvim/ftplugin/` which are auto loaded on file
  types for filetype specific configs
* You can change .alacritty.yml and it will update live w/out restart
* `!` - shows keybinds
* `!ls -alth` - bang can be used to run commands
* `powershell.exe "(Get-Clipboard -Format Image).save('test.png')"` - pastes and image into WSL / windows
* :PasteImg = paste image to nvim
* :lua print(vim.inspect(vim.fn.readfile("/proc/version"))) - runs a lua from command line
* :so - sources config
* :diffs <filename> - diffs another file with the current file
* :help K - example of using help
* :Mason to install LSP / formatters / etc...

## Changing username

```
ubuntu config --default-user root
wsl
sudo usermod -l newUsername oldUsername
sudo groupmod -n newUsername oldUsername
sudo usermod -d /home/newHomeDir -m newUsername
exit
ubuntu config --default-user newUsername
```

## Issues

Need to map <leader>a to something else? or leave to m
- paste image markdown
  - working - need latest version
  - have patches
- mouse highlight in windows
- mouse mode?
- visual mode copy paste w/out line numbers in windows
- paste keyboard shortcut
  - probably need to separate system from vim paste
- image support in alacritty - test

## Paste

> Should work in neovim (takes over mouse) and tmux (alacritty handles mouse)

- Mouse
  - mouse drag highlights
  - right click pastes from system w/ no visual selection
  - right click copies to system w/ visual selection

- Keyboard
  - Ctrl + shift + v = paste from system from alacritty
  - v + y = visual + yank

## Git

<leader>gs = git status
:G <git command> does git stuff
:G diffsplit = great diff editor

### Alacritty

- hold shift = bypass mouse grab
  - hold shift + url = open url
- consistent config
- fast

### ZSH

- awesome shell autocomplete
- Look into ssh teleportation

### Tmux

- prefix+: = command
- ctrl+b = prefix
- `tmux ls` shows existing sessions
- `tmux new -s dioxus` - creates a new session
- `tmux attach -t dioxus` - attaches to a session
- prefix + 1..0 = switch to window
- prefix + x = kill pane
- prefix + [ = search mode (w/ vim keys w/ config)
  - y = yank + cancel
  - q = quit
  - paste works into vim w/ regular p

#### Prefix shortcuts

- `d` - detaches from a session
- `number` - move to window
- `n` - next window
- `x` - kill window
- `c` - create window
- `<prefix> : show-options -g` - shows current config global
- `<prefix> : show-options -s` - shows current config server?
- `<prefix> : source-file ~/.tmux.conf` - reload current config

### I3

- only need workspaces

### Troubleshooting

- Check terminal, tmux, nvim in that order
- Print events from alacritty to check keyboard received events
`./Alacritty.app/Contents/MacOS/alacritty --print-events`
<<<<<<< HEAD

## Firenvim

> Ended up being a pain

- small text
- hyjacks
- tons of issues

https://github.com/glacambre/firenvim/blob/master/TROUBLESHOOTING.md

* Install the firenvim extension and the lazy config
* Try http://txti.es/

=======
- open karabiner events
- check logs when changing karabiner config
- check frontmost application
- check "unless" style configs in karabiner
>>>>>>> 21080f5ac9692c05e8a2517f6bd13691a26c949f

## Neovim keys

- Ctrl + v = block visual
  - Shift + i = multi insert
- >< in visual = indent
- zz = center line

