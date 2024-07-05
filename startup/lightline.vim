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
  \     'lineinfo': ' %l/%L:%-2c %p%%',
  \     'gitstatus': '%<%{lightline_gitdiff#get_status()}',
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
  \   },
  \   'component_type': {
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_hints': 'left',
  \     'linter_infos': 'left',
  \     'buffers': 'tabsel',
  \   },
  \   'component_visible_condition': {
  \     'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
  \   },
  \   'separator': {'left': "\uE0B0", 'right': "\uE0B2"},
  \   'subseparator': { 'left': '', 'right': ''},
  \ }
  "\   'subseparator': { 'left': '', 'right': '' },

let g:lightline#lsp#indicator_ok = ''
let g:lightline#lsp#indicator_errors = "\uf05e "
let g:lightline#lsp#indicator_warnings = "\uf071 "
let g:lightline#lsp#indicator_hints = "\uf129 "
let g:lightline#lsp#indicator_infos = "\uf129 "
"let g:lightline_gitdiff#indicator_added = "\uf067"
"let g:lightline_gitdiff#indicator_deleted = "\uf068"
"let g:lightline_gitdiff#indicator_modified = "\uf12a"
let g:lightline_gitdiff#indicator_pad = v:false
let g:lightline_gitdiff#indicator_hide_zero = v:true
"let g:lightline_gitdiff#min_winwidth = 80
let g:lightline#bufferline#modified = " \uf040" 
" let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#read_only = " \uf023"
let g:lightline#bufferline#more_buffers = "\u2026"
let g:lightline#bufferline#show_number = v:true
let g:lightline#bufferline#unnamed = '[NO NAME]'
let g:lightline#bufferline#min_buffer_count = 2

function! LightlineFileFormat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFileType()
  return &filetype
endfunction

function! DisplayGitBranchName()
  let l:gitbranch = gitbranch#name()
  let l:displaytext = winwidth(0) > 70 ? "\ue0a0" . ' ' . l:gitbranch : "\ue0a0"
  return l:gitbranch ==# '' ? '' : l:displaytext
endfunction

function! LightlineFormat()
  return &filetype =~# '^Mundo\|MundoDiff' ? '' : &filetype
endfunction

function! LightLineLspHints()
  if get(g:, 'lightline_lsp_loaded', v:false)
    return lightline#lsp#hints()
  else
    return ''
  endif
endfunction

function! LightLineLspInfos()
  if get(g:, 'lightline_lsp_loaded', v:false)
    return lightline#lsp#infos()
  else
    return ''
  endif
endfunction

function! LightLineLspWarnings()
  if get(g:, 'lightline_lsp_loaded', v:false)
    return lightline#lsp#warnings()
  else
    return ''
  endif
endfunction

function! LightLineLspError()
  if get(g:, 'lightline_lsp_loaded', v:false)
    return lightline#lsp#errors()
  else
    return ''
  endif
endfunction

function! LightLineLspOk()
  if get(g:, 'lightline_lsp_loaded', v:false)
    return lightline#lsp#ok()
  else
    return ''
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
    let l:fname_len = strcharlen(l:fname)
    let l:gitbranch_len = strcharlen(DisplayGitBranchName())
    let l:gitdiff_len = strcharlen(lightline_gitdiff#get_status())
    let l:ft_len = strcharlen(LightlineFileType())
    let l:file_format_len = strcharlen(LightlineFileFormat())
    let l:other_len = 42   " a rough estimate of everything else
    if get(g:, 'lightline_lsp_loaded', v:false)
      let l:lsp_hints = lightline#lsp#hints()
      let l:lsp_hints_len = strcharlen(l:lsp_hints) + (strcharlen(l:lsp_hints) > 0) * 3
      let l:lsp_infos = lightline#lsp#infos()
      let l:lsp_infos_len = strcharlen(l:lsp_infos) + (strcharlen(l:lsp_infos) > 0) * 3
      let l:lsp_warn = lightline#lsp#warnings()
      let l:lsp_warn_len = strcharlen(l:lsp_warn) + (strcharlen(l:lsp_warn) > 0) * 3
      let l:lsp_errs = lightline#lsp#errors()
      let l:lsp_errs_len = strcharlen(l:lsp_errs) + (strcharlen(l:lsp_errs) > 0) * 3
      let l:lsp_len = l:lsp_hints_len + l:lsp_infos_len + l:lsp_warn_len + l:lsp_errs_len
    else
      let l:lsp_len = 0
    endif
    let l:used = l:gitbranch_len + l:gitdiff_len + l:ft_len + l:file_format_len + l:other_len + l:lsp_len
    let l:max_width = winwidth(0) - l:used
    let l:fn = strcharlen(l:fname) < l:max_width ? l:fname : (l:fname[:(l:max_width - 2)] . "\u2026")
    let l:filename = l:fn
  endif

  let l:modified = &modified ? ' ' . "\uf040" : ''
  return l:readonly . l:filename . l:modified
endfunction
