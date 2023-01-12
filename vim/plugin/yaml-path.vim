if !exists('g:yamlpath_sep')
  let g:yamlpath_sep = '/'
endif

if !exists('g:yamlpath_auto')
  let g:yamlpath_auto = 0
endif

function! Yamlpath(...)
  let sep = a:0 ? a:1 : g:yamlpath_sep
  let clean = systemlist('yaml-path --bosh.sep=' . sep . ' --line ' . line('.') . ' --col ' . string(col('.')-1), join(getline(1,'$') , "\n"))[0]
  return clean
endfunction

command! -nargs=? Yamlpath echom Yamlpath(<args>)

if has("autocmd") && g:yamlpath_auto
  au FileType yaml :autocmd CursorMoved * echom Yamlpath()
endif
