" Vim-lightline
let g:lightline = {
  \   'colorscheme': 'nord',
  \   'active': {
  \     'left': [['mode', 'paste'],
  \              ['gitbranch', 'gitstatus', 'filename']],
  \     'right': [
  \       [ 'linter_errors',
  \         'linter_warnings',
  \         'linter_ok',
  \         'linter_infos',
  \         'linter_hints' ],
  \       [ 'filetype',
  \         'fileformat',
  \         'lineinfo']
  \     ],
  \   },
  \   'inactive': {
  \     'left': [['filename']],
  \     'right': [['lineinfo']],
  \   },
  \   'tabline': {
  \     'left': [['buffers']],
  \     'right': [[]],
  \   },
  \   'component': {
  \     'close': ' ' . "\uf00d" . ' ',
  \   },
  \   'component_expand': {
  \     'linter_hints': 'LightLineLspHints',
  \     'linter_infos': 'LightLineLspInfos',
  \     'linter_warnings': 'LightLineLspWarnings',
  \     'linter_errors': 'LightLineLspError',
  \     'linter_ok': 'LightLineLspOk',
  \     'buffers': 'lightline#bufferline#buffers',
  \   },
  \   'component_function': {
  \     'gitbranch': 'DisplayGitBranchName',
  \     'fileformat': 'LightlineFileFormat',
  \     'filetype': 'LightlineFileType',
  \     'filename': 'LightlineFilename',
  \     'lineinfo': 'LightlineLineInfo',
  \     'gitstatus': 'LightlineGitStatus',
  \   },
  \   'component_type': {
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_hints': 'left',
  \     'linter_infos': 'left',
  \     'buffers': 'tabsel',
  \   },
  \   'component_visible_condition': {
  \     'gitstatus': 'LightlineGitStatus() !=# ""',
  \   },
  \   'separator': {'left': "\uE0CC ", 'right': "\uE0C2 "},
  \   'subseparator': { 'left': '', 'right': ''},
  \ }
  "\   'subseparator': { 'left': '', 'right': '' },

let g:lightline#lsp#indicator_ok = ''
let g:lightline#lsp#indicator_errors = "\uf05e "
let g:lightline#lsp#indicator_warnings = "\uf071 "
let g:lightline#lsp#indicator_hints = "\uf129 "
let g:lightline#lsp#indicator_infos = "\uf129 "
let g:lightline_gitdiff#indicator_added = "\uf067 "
let g:lightline_gitdiff#indicator_deleted = "\uf068 "
let g:lightline_gitdiff#indicator_modified = "\uf12a "
"let g:lightline_gitdiff#indicator_added = "\uff0b"
"let g:lightline_gitdiff#indicator_deleted = "\uff0d"
"let g:lightline_gitdiff#indicator_modified = "\uff5e"
let g:lightline_gitdiff#indicator_pad = v:false
let g:lightline_gitdiff#indicator_hide_zero = v:true
"let g:lightline#bufferline#modified = " \uf040" 
let g:lightline#bufferline#modified = " \u25cf" 
" let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#read_only = " \uf023"
let g:lightline#bufferline#more_buffers = "\u2026"
let g:lightline#bufferline#show_number = v:true
let g:lightline#bufferline#unnamed = '[NO NAME]'
let g:lightline#bufferline#min_buffer_count = 2

function! LightlineFileFormat()
  return winwidth(0) < 85 || &filetype ==# 'help' ? '' : &fileformat
endfunction

function! LightlineFileType()
  let l:fname = expand('%:t')
  if l:fname ==# ''
    return ''
  endif
  let l:icon = v:lua.require("nvim-web-devicons").get_icon(l:fname)
  if &filetype =~# '^Mundo\|MundoDiff'
    let l:ft = ''
  elseif &filetype ==# 'help' || &filetype ==# 'man'
    let l:ft = &filetype
  else
    let l:ft = l:icon . ' ' . &filetype
  endif
  if winwidth(0) > 70
    return l:ft
  else
    return l:icon
  endif
endfunction

function! DisplayGitBranchName()
  let l:gitbranch = gitbranch#name()
  let l:displaytext = winwidth(0) < 85 ? "\ue0a0" : "\ue0a0" . ' ' . l:gitbranch
  return (l:gitbranch ==# '' || &filetype =~# '^Mundo\|MundoDiff\|help') ? '' : l:displaytext
endfunction

function! LightlineLineInfo() abort
  let l:info = " " . line('.') . '/' . line('$') . ':' . printf('%-2d', col('.'))
  return winwidth(0) < 80 ? l:info : l:info . ' ' . (line('.') * 100 / line('$')) . '%'
endfunction

function! LightlineGitStatus() abort
  return winwidth(0) < 90 ? '' : lightline_gitdiff#get_status()
endfunction

function! s:LightLineLspCollapse(text) abort
  return winwidth(0) < 80 ? substitute(a:text, '\s*\d\+$', '', '') : a:text
endfunction

function! LightLineLspHints()
  return get(g:, 'lightline_lsp_loaded', v:false) ? s:LightLineLspCollapse(lightline#lsp#hints()) : ''
endfunction

function! LightLineLspInfos()
  return get(g:, 'lightline_lsp_loaded', v:false) ? s:LightLineLspCollapse(lightline#lsp#infos()) : ''
endfunction

function! LightLineLspWarnings()
  return get(g:, 'lightline_lsp_loaded', v:false) ? s:LightLineLspCollapse(lightline#lsp#warnings()) : ''
endfunction

function! LightLineLspError()
  return get(g:, 'lightline_lsp_loaded', v:false) ? s:LightLineLspCollapse(lightline#lsp#errors()) : ''
endfunction

function! LightLineLspOk()
  return get(g:, 'lightline_lsp_loaded', v:false) ? lightline#lsp#ok() : ''
endfunction

function! StrCharLenPadOpt(string)
  if a:string ==# ''
    return 0
  else
    return strcharlen(a:string) + 3
  endif
endfunction

function! LightlineFilename()
  let l:readonly = &readonly ? "\uf023" . ' ' : ''

  let l:fname = expand('%:t')
  if l:fname ==# ''
    let l:filename = '[NO NAME]'
  elseif &filetype =~# '^Mundo\|MundoDiff'
    let l:filename = &filetype
  else
    let l:mode_len = StrCharLenPadOpt(lightline#mode())
    let l:gitbranch_len = StrCharLenPadOpt(DisplayGitBranchName())
    let l:gitdiff_len = StrCharLenPadOpt(LightlineGitStatus())
    let l:fname_len = StrCharLenPadOpt(l:fname)
    let l:ft_len = StrCharLenPadOpt(LightlineFileType())
    let l:file_format_len = StrCharLenPadOpt(LightlineFileFormat())
    let lineinfo_len = StrCharLenPadOpt(LightlineLineInfo())
    let l:lsp_hints_len = StrCharLenPadOpt(LightLineLspHints())
    let l:lsp_infos_len = StrCharLenPadOpt(LightLineLspInfos())
    let l:lsp_warn_len = StrCharLenPadOpt(LightLineLspWarnings())
    let l:lsp_errs_len = StrCharLenPadOpt(LightLineLspError())
    let l:lsp_len_ = l:lsp_hints_len + l:lsp_infos_len + l:lsp_warn_len + l:lsp_errs_len
    let l:lsp_len = l:lsp_len_ == 0 ? 1 : l:lsp_len_  " empty section leaves a space
    let l:padding = 4
    let l:readonly_len = strcharlen(l:readonly)
    let l:used = l:mode_len + l:gitbranch_len + l:gitdiff_len + l:ft_len + l:file_format_len
          \ + l:padding + l:lsp_len + l:lineinfo_len + l:readonly_len + (&modified ? 2 : 0)
    let l:max_width = winwidth(0) - l:used + 2  " not sure where the 2 comes from but it works
    " -4 because of file name padding
    let l:fn = l:fname_len <= l:max_width ? l:fname : (l:fname[:(l:max_width - 5)] . "\u2026")
    let l:filename = l:fn
  endif

  "let l:modified = &modified ? ' ' . "\uf040" : ''
  let l:modified = &modified ? ' ' . "\u25cf" : ''
  return l:readonly . l:filename . l:modified
endfunction
