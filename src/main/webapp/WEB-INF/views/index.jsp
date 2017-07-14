<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Excel 数据导入</title>
  </head>
  <body>
	<form method="POST" enctype="multipart/form-data" id="form1" action="upload.do">
        上传文件:
    <input id="upfile" type="file" name="upfile">
    <input type="submit" value="提交">  
    </form>
  </body>
</html>
