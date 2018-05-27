" initialize global variables
let g:lightline#git#status = [0, 0, 0]
let g:lightline#git#status#indicator_added = '+'
let g:lightline#git#status#indicator_modified = '!'
let g:lightline#git#status#indicator_deleted = '-'

augroup lightline#git
    autocmd!
    autocmd BufWrite * call lightline#git#update_status()
augroup END

function! lightline#git#raw_output()
    let l:cmd = 'git diff --compact-summary --word-diff=porcelain ' .
      \         '--no-color --no-ext-diff -U0 -- ' . expand('%:f')
    return system(l:cmd)
endfunction

function! lightline#git#modified_count(hunks)
    let l:modified = 0
    for l:hunk in a:hunks
        for l:line in split(l:hunk, '\~')
            let l:plus = 0
            let l:minus = 0
            for l:chunk in split(l:line, '\n')
                let l:firstchar  = l:chunk[0]
                if l:firstchar ==# '+'
                    let l:plus = l:plus + 1
                elseif l:firstchar ==# '-'
                    let l:minus = l:minus + 1
                endif
            endfor
            if l:plus !=# 0 && l:minus !=# 0
                let l:modified = l:modified + 1
            endif
        endfor
    endfor
    return l:modified
endfunction

function! lightline#git#update_status()
    let l:git_raw_output = lightline#git#raw_output()
    if l:git_raw_output !=# ''
        let l:split_diff = split(lightline#git#raw_output(), '@@')
        let l:nhunks = (len(l:split_diff) - 1) / 2

        let l:header = l:split_diff[0]
        let l:hunks = []
        for l:idx in range(1, l:nhunks)
            call add(l:hunks, l:split_diff[2 * l:idx])
        endfor

        let l:modified = lightline#git#modified_count(l:hunks)
        let l:change_summary = split(l:header, '\n')[1]
        let l:matched =  matchlist(l:change_summary, '\v[^,]+, (\d+)[^,]+, (\d+).*')
        let [l:insertions, l:deletions] = l:matched[1:2]
        let l:added = l:insertions - l:modified
        let l:deleted = l:deletions - l:modified
        let g:lightline#git#status = [l:added, l:modified, l:deleted]
    endif
endfunction

function! lightline#git#get_status()
    let [l:added, l:modified, l:deleted] = g:lightline#git#status
    return g:lightline#git#status#indicator_added . ' ' . l:added . ' ' .
        \  g:lightline#git#status#indicator_modified . ' ' . l:modified . ' ' .
        \  g:lightline#git#status#indicator_deleted . ' ' . l:deleted
endfunction
