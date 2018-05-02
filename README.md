# svnsh
shell命令批量添加提交svn文件

```
#!/usr/bin/env bash

cd html;
svn st| grep '^\?' | tr '^\?' ' ' | sed 's/[ ]*//' | sed 's/[ ]/\\ /g' | xargs svn add;
svn commit -m 'html commit' *;
cd ../static;
svn st| grep '^\?' | tr '^\?' ' ' | sed 's/[ ]*//' | sed 's/[ ]/\\ /g' | xargs svn add;
svn commit -m 'static commit' *;
```

<table>
	<tr>
		<th>命令</th>
		<th>效果</th>
	</tr>
	<tr>
		<td>svn st</td>
		<td>获取当前目录及子目录中所有文件的Subversion状态，每个文件一行。尚未加入版本控制的新文件会以一个问号（"?"）开头，随后是一个tab,最后是文件名。</td>
	</tr>
	<tr>
		<td>grep '^\?'</td>
		<td>找出所有以"?"开头的行。</td>
	</tr>
	<tr>
		<td>tr '^\?'''</td>
		<td>把"?"替换成空格（tr命令会把一个字符替换为另一个字符）</td>
	</tr>
	<tr>
		<td>sed 's/[ ]*//'</td>
		<td>用sed(基于流的编辑器)把每行开头的空格去掉。</td>
	</tr>
	<tr>
		<td>sed 's/[ ]/\\ /g'</td>
		<td>文件名内部也可能包含空格，所以再动用一次sed，把文件名中的空格替换成转义字符（也就是在空格前面加上"\"字符）。</td>
	</tr>
	<tr>
		<td>xargs svn add</td>
		<td>针对前面处理的结果逐一调用svn add</td>
	</tr>
</table>



参考：https://blog.csdn.net/spare_h/article/details/6677435
