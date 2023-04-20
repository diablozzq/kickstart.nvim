# Vim notes

## Link to wsl

`ln -s /mnt/c/Users/<username>/Documents/architecture ~/architecture`

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

#### Markdown

- prettier

#### Javascript

- prettier

#### Python

- black
- pyright
- ruff
- debugpy

#### Rust

- rust_format
- rust_analyzer

### Harpoon

edit harpoon file - normal vim keys
mark file - <leader>m
file 1-4 - <leader>1-4
harpoon file - <leader>tab

### Telescope

- git_files
- live_grep

### Treesitter

- format file - <leader>s
- [d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
- ]d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
- <leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
- <leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

### LSP
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

- status <leader>gs
- help - (in fugitive) g?
- commit - (in fugitive) cc
- diff - (in fugitive) dd
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

## Todo

Refactoring rename variable
theprimagen refactoring - but doesn't support rust

## Tricks

:PasteImg = paste image to nvim
:lua print(vim.inspect(vim.fn.readfile("/proc/version"))) - runs a lua from command line
:so - sources config
:diffs <filename> - diffs another file with the current file
:help K - example of using help
:Mason to install LSP / formatters / etc...

## Issues

Need to map <leader>a to something else? or leave to m
- paste image markdown

## Git

<leader>gs = git status
:G <git command> does git stuff
:G diffsplit = great diff editor

### Alacritty

- consistent config
- fast

### ZSH

- awesome shell autocomplete
- Look into ssh teleportation

### Tmux

- save sessions
- run commands from nvim
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

https://github.com/glacambre/firenvim/blob/master/TROUBLESHOOTING.md

* Install the firenvim extension and the lazy config
* Try http://txti.es/

=======
- open karabiner events
- check logs when changing karabiner config
- check frontmost application
- check "unless" style configs in karabiner
>>>>>>> 21080f5ac9692c05e8a2517f6bd13691a26c949f
