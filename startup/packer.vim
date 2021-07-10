augroup Packer
  autocmd!
  autocmd CmdUndefined Packer* execute 'luafile ' . stdpath('config') . '/lua/packages.lua'
augroup END
