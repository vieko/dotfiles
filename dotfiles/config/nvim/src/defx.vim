let g:defx_git#indicators = {
      \ 'Modified'  : '',
      \ 'Staged'    : '',
      \ 'Untracked' : '',
      \ 'Renamed'   : '',
      \ 'Unmerged'  : '',
      \ 'Ignored'   : '',
      \ 'Deleted'   : '',
      \ 'Unknown'   : ''
      \ }

nnoremap <buffer><silent> [c <Plug>(defx-git-prev)
nnoremap <buffer><silent> ]c <Plug>(defx-git-next)

function! DefxOpen(...) abort
  let l:find_current_file = a:0 > 0
  if !l:find_current_file
    return execute(printf('Defx -toggle -columns=git:mark:filename:type -split=vertical -winwidth=50 -direction=topleft %s', getcwd()))
  endif
  return execute(printf('Defx -toggle -columns=git:mark:filename:type -split=vertical -winwidth=50 -direction=topleft %s -search=%s', expand('%:p:h'), expand('%:p')))
endfunction

nnoremap <silent><Leader>\ :call DefxOpen()<CR>

function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open', 'wincmd w \| drop')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open', 'wincmd w \| drop')
  nnoremap <silent><buffer><expr> E
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> i
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
endfunction

autocmd FileType defx call s:defx_my_settings() 
