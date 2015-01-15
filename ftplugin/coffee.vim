" Fold by intend method, off by default (toggle with zi)
setl foldmethod=indent nofoldenable

" Standard coffeescript formatting
setl shiftwidth=2 expandtab

" By default, the indent function matches the indent of the previous line if
" it doesn't find a reason to indent or outdent. This changes the behavior so
" it instead keeps the current indent of the cursor
let coffee_indent_keep_current = 1

" Default to vertical display of the CoffeeWatcher
let coffee_watch_vert = 1
let coffee_compile_vert = 1

" Coffeescript maps
nnoremap <buffer> <leader>cw :CoffeeWatch<CR>
nnoremap <buffer> <leader>cc :CoffeeCompile<CR>
vnoremap <buffer> <leader>cc :CoffeeCompile<CR>

" Make sure gf is looking at coffeescript files
" This is useful for node.js 'require' statements
set suffixesadd+=.coffee
