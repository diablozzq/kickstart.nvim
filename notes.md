# Vim notes

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

## Todo

Refactoring rename variable
theprimagen refactoring - but doesn't support rust

## Tricks

:Telescope keymaps to check keymaps
:Mason to install LSP / formatters / etc...

## Issues

Need to map <leader>a to something else? or leave to m
