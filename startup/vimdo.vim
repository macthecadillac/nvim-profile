" convenience function for dealing with wast files
function! WasmFileName()
  let l:fullname = vimdo#util#filename()
  let l:filename_noext = split(l:fullname, '\.')[0]
  return l:filename_noext . '.wasm'
endfunction

function! ExeWithJulia()
  function! _ExeWithJuliaAux()
    let l:filename = expand('%:p')
    if !exists("g:julia_term")
      let g:julia_term = "julia"
      :FloatermNew --width=&columns --title=Julia --name=g:julia_term julia
    else
      redir => l:error
      :FloatermShow g:julia_term
      redir END
      if l:error[1:] == "[vim-floaterm] No floaterms with the bufnr or name"
        :FloatermNew --width=&columns --title=Julia --name=g:julia_term julia
      endif
      unlet l:error
    endif
    execute "FloatermSend --name=" . g:julia_term . " include(\"" . l:filename . "\")"
  endfunction
  execute "silent call _ExeWithJuliaAux()"
endfunction

let g:vimdo#open_term_in_float = 1
let g:vimdo#filetype_defaults = {
  \ 'ocaml': {'in_term': 1},
  \ 'haskell': {'in_term': 1},
  \ 'wast': {'in_term': 1},
  \ }
let g:vimdo#cmds = {
  \ 'python': {
  \     'run': {'cmd': ['python3', 'vimdo#util#filename'], 'in_term': 1},
  \   },
  \ 'ocaml': {
  \     'build': {'cmd': ['dune', 'build', '@all', '@doc']},
  \     'build-install': {'cmd': ['dune', 'build', '@all', '@install', '@doc']},
  \     'install': {'cmd': ['dune', 'install']},
  \   },
  \ 'haskell': {
  \     'build': {'cmd': ['stack', 'build', '--fast']},
  \     'test': {'cmd': ['stack', 'test', '--fast']},
  \   },
  \ 'sh': {
  \     'run': {'cmd': ['sh', 'vimdo#util#filename'], 'in_term': 1},
  \   },
  \ 'fish': {
  \     'run': {'cmd': ['fish', 'vimdo#util#filename'], 'in_term': 1},
  \   },
  \ 'tex': {
  \     'build': {'cmd': ['latexmk', '-gg', '-silent', 'vimdo#util#filename'], 'in_term': 1},
  \     'continuous-build': {'cmd': ['latexmk', '-pvc', '-interaction=nonstopmode', 'vimdo#util#filename']},
  \   },
  \ 'rust': {
  \     'run': {'cmd': ['RUST_BACKTRACE=1', 'cargo', 'run'], 'in_term': 1},
  \     'quick-build': {'cmd': ['cargo', 'build'], 'in_term': 1},
  \     'release-run': {'cmd': ['RUST_BACKTRACE=1', 'cargo', 'run', '--release'], 'in_term': 1},
  \     'test': {'cmd': ['RUST_BACKTRACE=1', 'cargo', 'test'], 'in_term': 1},
  \     'release-build': {'cmd': ['cargo', 'build', '--release'], 'in_term': 1},
  \     'build-doc': {'cmd': ['cargo', 'makedocs', '--document-private-items', '--root'], 'in_term': 1},
  \     'doc': {'cmd': ['cargo', 'makedocs', '--open', '--document-private-items', '--root']},
  \     'rust-doc': {'cmd': ['rustup', 'doc']},
  \     'book': {'cmd': ['rustup', 'doc', '--book']},
  \     'std-doc': {'cmd': ['rustup', 'doc', '--std']},
  \   },
  \ 'wast': {
  \     'assemble-and-run': {'cmd': ['wat2wasm', 'vimdo#util#filename', ';', 'wasm-interp', 'WasmFileName', '--run-all-exports']},
  \   },
  \ 'julia': {
  \     'run': {'cmd': ['julia', 'ExeWithJulia'], 'show_stderr_on_error': 0},
  \   }
  \ }
