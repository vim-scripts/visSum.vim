" vim:ft=vim foldmethod=marker tw=78
" =============================================================================
" File:         visSum.vim (global plugin)
" Last Changed: 2007-06-20
" Maintainer:   Erik Falor <ewfalor@gmail.com>
" Version:      0.1c
" License:      Vim License
" =============================================================================

" Exit quickly when the script has already been loaded or when 'compatible'
" is set.
if exists("g:loaded_sum")
    finish
endif
"
let g:loaded_sum = "0.1c"

"Mappings
"{{{
" Key mappings
if hasmapto('<Plug>SumNum')
	nunmap \su
	vunmap \su
	nunmap <Plug>SumNum
	vunmap <Plug>SumNum
endif
nmap <silent> <unique> <Leader>su <Plug>SumNum
vmap <silent> <unique> <Leader>su <Plug>SumNum

" Plug mappings for the key mappings
nmap <silent> <unique> <script> <Plug>SumNum	:call <SID>SumNumbers() <CR>
vmap <silent> <unique> <script> <Plug>SumNum	:call <SID>SumNumbers() <CR>
"}}}

function! <SID>SumNumbers() range 
"	call Dfunc("VisBlockIncr")  "{{{
	let l:sum = 0
	let l:cur = 0

	if visualmode() =~ '\cv'  
		let y1      = line("'<")
		let y2      = line("'>")
"		Decho("y1 = " . y1 . " y2 = " . y2)
		while y1 <= y2
			let l:cur = matchstr( getline(y1), '-\{-}\d\+' )
"			Decho("l:cur is " . l:cur)
			let l:sum += l:cur
			let y1 += 1
		endwhile
	elseif visualmode() == "\<c-v>"
		echoerr "I don't yet support Block-Visual mode!"
"		call Dret("VisBlockIncr")
		return
	else
		echoerr "You must select some text in visual mode first"
"		call Dret("VisBlockIncr")
		return
	endif

	echomsg "sum = " . l:sum | redraw
"	Decho("l:sum is " . l:sum)
"	call Dret("VisBlockIncr")
endfunction "}}}

"Test Data
"{{{
" <column width=\"24\"> The winter of '49</column>
" <column width=\"18\"> The Summer of '48</column>
" <column width=\"44\"/>
" <column width=\"14\"/>
"
"
"1
"2
"-3
"-4
"5
"6
"7
"8
"8 
"9 
"10
"11
"12
"13
"14
"15
"16
"17
"}}}
