<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Excel 数据导入</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="resources/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
  	<style type="text/css">
  		.files{ position:absolute; left:202px; top:52px; heigth:26px;cursor:pointer;
		   filter: Alpha(opacity=0);    
		   -moz-opacity:0;    
		   opacity:0;  
		} 
  	</style>
  	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
  	<script type="text/javascript" src="resources/js/jquery.form.min.js"></script>
  	<script type="text/javascript">
  		$(function(){
  			$("#fb").click(function(){
  				$(".files").get(0).click();
  			});
  			$(".files").change(function(){
  				var f = this.value;
  				var ext = f.substring(f.lastIndexOf(".")+1);
  				if(ext=="xls" || ext=="xlsx"){
  					$('#fm').ajaxSubmit({    
                        url:'ajaxUpload.do',  
                        success: getData,
                        error: errorMsg
                    });   
                    function getData(data){  
                        console.log(data); 
                        $("#fu").val("");
                    }  
                    function errorMsg(){
                        alert("导入excel出错！"); 
                    }  
  				}
  			});
  		});
  	</script>
  </head>
  <body>
  	<div class="container" style="margin-top:5px">
	  	<div class="panel panel-default">
		  <div class="panel-heading" style="padding:5px 15px 1px 15px">
			<form method="POST" enctype="multipart/form-data" id="fm" action="upload.do">
		  		<div class="row">
		  			<div class="col-xs-5">
		  				<h5>Excel数据导入</h5>
		  			</div>
		  			<div class="col-xs-4">
		  				<input id="upfile" class="files" type="file" name="upfile">
		  			</div>
		  			<div class="col-xs-3 text-right">
		  				<button type="button" id="fb" class="btn btn-default btn-sm">
		  					<i class="glyphicon glyphicon-floppy-save"></i> 选择Excel文件
		  				</button>
		  			</div>
		  		</div>
			</form>
		  </div>
		  <div class="panel-body">
		    <div class="table-responsive">
				<table class="table table-bordered table-hover">
					<tr class="active">
						<th>序号</th>
						<th>编号</th>
						<th>名称</th>
						<th>日期</th>
						<th>金额</th>
					</tr>
				</table>
			</div>
		  </div>
		  <div class="panel-footer">Panel footer</div>
		</div>
  	</div>
  </body>
</html>
