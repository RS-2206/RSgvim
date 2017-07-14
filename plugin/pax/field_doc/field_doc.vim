" 域说明文档

" 变量定义 {{{1
let s:docListName="docList.txt"

function! ToggleDocView() "打开文档窗口{{{1
	"判断窗口是否已经打开
	let viewNr=bufwinnr(s:docListName)
	if viewNr!=-1
		return
	endif

	let splitLocation="belowright "
	let splitMode="vertical "
	let splitSize=55
	let cmd=splitLocation.splitMode.splitSize.' new '.s:docListName
	silent! execute cmd

	setlocal readonly
	setlocal nomodifiable

	nmap <buffer> <CR> :call ShowSubDoc()<CR>

endfunction

function! ShowSubDoc() "显示详细文档{{{
	let line=getline(line("."))
	if line==1
		execute "edit ./doc/zhx_stk_doc.txt"
		"echo "union doc"
	elseif line==2
		echo "stk doc"
	else
		echo "not found"
	endif
	"echo line
endfunction

nmap <silent> <C-B> :call ToggleDocView()<CR>
