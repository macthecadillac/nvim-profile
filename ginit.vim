" makes sure the gui-shim is loaded
if exists('g:GuiLoaded')
  GuiFont! Monospace:h10
  GuiLinespace 0
  GuiPopupmenu 1
  GuiTabline 0
endif

let ayucolor='light'
let lightline.colorscheme = 'ayu'
" set background=light
" let lightline.colorscheme = 'one'
call lightline#init()
colorscheme ayu
" colorscheme one
