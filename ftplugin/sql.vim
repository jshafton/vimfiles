set modeline

" Re-execute the previous query
map <buffer> <F6> <leader>sep

" Toggle comments on 'explain' lines
nmap <buffer> te :g/explain/TComment<CR>
