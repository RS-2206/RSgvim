"作者：任帅
"开发时间：2017-07-17
"功能：2,8,10,16进制转成ASCII字符
"16进制: 41->A 31->1



function! HexNumber2char() "16进制数转ASCII字符 {{{1
	let res_list = s:Convert_nr2char(16)
	call s:Print_list(res_list)
endfunction

function! OctNumber2char() "8进制数转ASCII字符 {{{1
	let res_list = s:Convert_nr2char(8)
	call s:Print_list(res_list)
endfunction

function! DecNumber2char() "10进制数转ASCII字符 {{{1
	let res_list = s:Convert_nr2char(10)
	call s:Print_list(res_list)
endfunction

function! BinNumber2char() "2进制数转ASCII字符 {{{1
	let res_list = s:Convert_nr2char(2)
	call s:Print_list(res_list)
endfunction

function! s:Convert_nr2char(base) "根据conversion base 转换选中的字符串 {{{1
	let select = s:Get_select()
	let str_list = split(select, " ")
	let nr_list = []
	for i in str_list
		let nr_list = add(nr_list, nr2char(str2nr(i, a:base)))
	endfor
	return nr_list
endfunction

function! s:Get_select() "获取选中的文本{{{1
	let origin_text = @a
	silent normal gv"ay
	let select_text = @a
	let @a = origin_text
	return select_text
endfunction

function! s:Print_list(list) "打印List中的内容{{{1
	"for i in a:list
		"echon i
	"endfor
	execute "normal! o".s:ToString(a:list)
endfunction

function! s:ToString(list) "List toString {{{1
	let str = ""
	for i in a:list
		let str .= i
	endfor
	return str
endfunction
