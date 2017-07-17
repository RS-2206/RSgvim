# vim配置阶段备份

## plugin: 插件开发
### ./pax/field_doc/field_doc.vim
	报文域说明文档插件
	在vim的右侧窗口打开域说明文档

---
### ./pax/iso8583_bitmap_parse/iso8583bitmap.vim
	iso8583Bitmap解析
	用法：选择bitmap，:call Bitmap_parse()
	
	70 38 04 81 0A D0 80 11
	[以下部分插件生成]
	Bitmap: 0111 0000 0011 1000 0000 0100 1000 0001 0000 1001 1101 0000 1000 0000 0001 0001 
	2 Field: 
	3 Field: 
	4 Field: 
	11 Field: 
	12 Field: 
	13 Field: 
	22 Field: 
	25 Field: 
	32 Field: 
	37 Field: 
	40 Field: 
	41 Field: 
	42 Field: 
	44 Field: 
	49 Field: 
	60 Field: 
	64 Field: 

---
### ./toASCII/toASCII.vim
将2进制、8进制、10机制、16机制数字转成ASCII

	特性：
	1. 支持多个数字转换，每个数字间以空格分开
	2. 支持2进制、8进制、10进制、16进制数字转换
