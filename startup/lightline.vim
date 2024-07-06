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
  let l:fname = expand('%:t')
  if l:fname ==# ''
    return ''
  endif
  let l:icon = v:lua.require("nvim-web-devicons").get_icon(l:fname)
  let l:ft = &filetype =~# '^Mundo\|MundoDiff' ? '' : l:icon . ' ' . &filetype
  if winwidth(0) > 50
    return l:ft
  else
    return l:icon
  endif
endfunction

function! DisplayGitBranchName()
  let l:gitbranch = gitbranch#name()
  let l:displaytext = winwidth(0) > 70 ? "\ue0a0" . ' ' . l:gitbranch : "\ue0a0"
  return (l:gitbranch ==# '' || &filetype =~# '^Mundo\|MundoDiff') ? '' : l:displaytext
endfunction

function! LightLineLspHints()
  return get(g:, 'lightline_lsp_loaded', v:false) ? lightline#lsp#hints() : ''
endfunction

function! LightLineLspInfos()
  return get(g:, 'lightline_lsp_loaded', v:false) ? lightline#lsp#infos() : ''
endfunction

function! LightLineLspWarnings()
  return get(g:, 'lightline_lsp_loaded', v:false) ? lightline#lsp#warnings() : ''
endfunction

function! LightLineLspError()
  return get(g:, 'lightline_lsp_loaded', v:false) ? lightline#lsp#errors() : ''
endfunction

function! LightLineLspOk()
  return get(g:, 'lightline_lsp_loaded', v:false) ? lightline#lsp#ok() : ''
endfunction

function! StrCharLenPadOpt(string)
  if a:string ==# ''
    return ''
  else
    return strcharlen(a:string) + 2
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
    let l:fname_len = StrCharLenPadOpt(l:fname)
    let l:gitbranch_len = StrCharLenPadOpt(DisplayGitBranchName())
    let l:gitdiff_len = StrCharLenPadOpt(lightline_gitdiff#get_status())
    let l:ft_len = StrCharLenPadOpt(LightlineFileType())
    let l:file_format_len = StrCharLenPadOpt(LightlineFileFormat())
    let maxline = line('$')
    let curline = line('.')
    let col = col('.')
    let percent = line('.') * 100 / line('$')
    let lineinfo_len = 7 + strcharlen(curline) + strcharlen(maxline) + strcharlen(col) + strcharlen(percent) + 2
    let l:other_len = 20   " a rough estimate of mode + separators
    if get(g:, 'lightline_lsp_loaded', v:false)
      let l:lsp_hints_len = StrCharLenPadOpt(lightline#lsp#hints())
      let l:lsp_infos_len = StrCharLenPadOpt(lightline#lsp#infos())
      let l:lsp_warn_len = StrCharLenPadOpt(lightline#lsp#warnings())
      let l:lsp_errs_len = StrCharLenPadOpt(lightline#lsp#warnings())
      let l:lsp_len = l:lsp_hints_len + l:lsp_infos_len + l:lsp_warn_len + l:lsp_errs_len
    else
      let l:lsp_len = 0
    endif
    let l:used = l:gitbranch_len + l:gitdiff_len + l:ft_len + l:file_format_len + l:other_len + l:lsp_len + l:lineinfo_len
    let l:max_width = winwidth(0) - l:used
    let l:fn = fname_len < l:max_width ? l:fname : (l:fname[:(l:max_width - 2)] . "\u2026")
    let l:filename = l:fn
  endif

  let l:modified = &modified ? ' ' . "\uf040" : ''
  return l:readonly . l:filename . l:modified
endfunction
