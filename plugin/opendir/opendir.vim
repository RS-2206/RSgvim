"作者：任帅
"编写日期：2017-08-28
"功能：
" 在使用NERDTree文档树的基础上扩展以下功能：
" 1. 使NERDTree具备跨级打开子目录的功能
"    在当前路径下，搜索某个目录，若存在，通过NERDTree打开


"变量 {{{

let s:showWindowCmd="below horizontal 36"

"}}}

function! ShowResult() "显示查找结果{{{1
	"判断窗口是否已经打开
	"let viewNr=bufwinnr(s:docListName)
	"if viewNr!=-1
	"	return
	"endif

	let splitLocation="below "
	"let splitMode="horizontal "
	let splitSize=6
	let cmd=splitLocation.splitSize.' new paths'
	silent! execute cmd

	let pathList = s:FindPath("doc")
	call append(0, pathList)

	"setlocal readonly
	"setlocal nomodifiable

	"nmap <buffer> <CR> :call ShowSubDoc()<CR>
endfunction

function! s:FindPath(dir) "查找目录 {{{1
	let path = systemlist('find -name '.a:dir)
	let pathList_len = len(path)
	"if pathList_len <= 0
		"exec "echo 'no such directory : ".a:dir."'"
	"elseif pathList_len == 1
		"exec "NERDTree ".get(path,0)
	"else
	"endif
	return path
endfunction
