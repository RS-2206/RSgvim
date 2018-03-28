"作者：任帅
"编写日期：2017-07-10

"功能：
"1. 将iso8583报文中的位图16进制转换成2进制
"2. 根据位图的2进制形式，列出存在的域

"变量定义{{{1
let s:hexList=["0000","0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101","1110","1111"]

function! Bitmap_parse() "16进制转换成2进制{{{1
	let selectText=s:Get_select()
	"0x20 空格
	let temp_bitmaps=split(selectText, "\0x20")
	let bitmap=join(temp_bitmaps, "")
	let bitmaps=split(bitmap, '\zs') "把字符串分割成每一个字符
	let bitmap_binary=""
	let result=""
	for i in bitmaps
		let temp = s:Hex2bin(i)
		let bitmap_binary.= temp
		let result .= temp." "
	endfor
	"echo result
	execute "normal! o"."Bitmap: ".result
	call s:Bitmap2Field(bitmap_binary)
endfunction

function! s:Get_select() "获取选中的文本{{{1
	let ori_text=@a
	"gv 选中上次选择的文本 "ay 复制到寄存器a中
	silent normal! gv"ay
	let select_text=@a
	let @a=ori_text
	return select_text
endfunction

function! s:Hex2bin(hex) "16进制转2进制{{{1
	if (a:hex ==? "a")
		return s:hexList[9]
	elseif (a:hex ==? "b")
		return s:hexList[10]
	elseif (a:hex ==? "c")
		return s:hexList[12]
	elseif (a:hex ==? "d")
		return s:hexList[13]
	elseif (a:hex ==? "e")
		return s:hexList[14]
	elseif (a:hex ==? "f")
		return s:hexList[15]
	elseif (a:hex >= 0 && a:hex <= 9)
		return s:hexList[a:hex]
	else
		return -1
	endif
endfunction

function! s:Bitmap2Field(bitmap) "根据2进制bitmap,列出存在的域{{{1
	echo a:bitmap
	let bitmaps=split(a:bitmap, '\zs')
	let index = 1
	for i in bitmaps
		if i
			execute "normal! o".index." Field: "
			"echo index . " Field: "
		endif
		let index += 1
	endfor
endfunction



