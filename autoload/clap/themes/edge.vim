" Author: liuchengxu <xuliuchengxlc@gmail.com>
" Description: Clap theme based on the material_design_dark theme.

let s:save_cpo = &cpoptions
set cpoptions&vim

let s:palette = {}

let s:palette.display = { 'ctermbg': '255', 'guibg': '#eef1f4' }

" Let ClapInput, ClapSpinner and ClapSearchText use the same background.
let s:bg0 = { 'ctermbg': '255', 'guibg': '#eef1f4' }
let s:palette.input = s:bg0
let s:palette.indicator = extend({ 'ctermfg': '238', 'guifg':'#676b83' }, s:bg0)
let s:palette.spinner = extend({ 'ctermfg': '238', 'guifg':'#676b83', 'cterm': 'bold', 'gui': 'bold'}, s:bg0)
let s:palette.search_text = extend({ 'ctermfg': 'NONE', 'guifg': '#676b83', 'cterm': 'bold', 'gui': 'bold' }, s:bg0)

let s:palette.preview = extend({ 'ctermgf': '238', 'guifg': '#676b83'}, s:bg0)

let s:palette.selected = { 'ctermfg': '238', 'guifg': '#676b83', 'cterm': 'bold,underline', 'gui': 'bold,underline' }
let s:palette.current_selection = { 'ctermbg': '68', 'guibg': '#6996e0', 'guifg': '#eef1f4', 'ctermfg': 'NONE', 'cterm': 'bold', 'gui': 'bold' }

let s:palette.selected_sign = { 'ctermfg': '68', 'guifg': '#6996e0' }
let s:palette.current_selection_sign = s:palette.selected_sign

let g:clap#themes#material_design_dark#palette = s:palette

let &cpoptions = s:save_cpo
unlet s:save_cpo
