" makes sure the gui-shim is loaded
if exists('g:GuiLoaded')
  GuiFont! Monospace:h10
  GuiLinespace 0
  GuiPopupmenu 1
  GuiTabline 0
endif

" use light themes for GUI
set background=light
let lightline.colorscheme = 'edge'

call lightline#init()

colorscheme edge
