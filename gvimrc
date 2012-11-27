if has("gui_macvim")
	set guifont=Monaco:h12

	" key binding for Command-T to behave properly
	" uncomment to replace the Mac Command-T key to Command-T plugin
	macmenu &File.Print key=<nop>

	" More Mac-like tab handling
	map <D-1> :tabn 1<CR>
	map <D-2> :tabn 2<CR>
	map <D-3> :tabn 3<CR>
	map <D-4> :tabn 4<CR>
	map <D-5> :tabn 5<CR>
	map <D-6> :tabn 6<CR>
	map <D-7> :tabn 7<CR>
	map <D-8> :tabn 8<CR>
	map <D-9> :tabn 9<CR>
	map! <D-1> <C-O>:tabn 1<CR>
	map! <D-2> <C-O>:tabn 2<CR>
	map! <D-3> <C-O>:tabn 3<CR>
	map! <D-4> <C-O>:tabn 4<CR>
	map! <D-5> <C-O>:tabn 5<CR>
	map! <D-6> <C-O>:tabn 6<CR>
	map! <D-7> <C-O>:tabn 7<CR>
	map! <D-8> <C-O>:tabn 8<CR>
	map! <D-9> <C-O>:tabn 9<CR>
else
	set guifont=Consolas
endif

" When the GUI starts, t_vb is reset to its default value.
" Reassert that no flash or beep is wanted.
set visualbell t_vb=

" Enable bottom scrollbar
set guioptions+=b
