<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="resources/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
  	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
  	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#dialog').modal({
				keyboard: false
			});
			
			$('#btnc').click(function(){
				$('#dialog').modal('hide');
				location.href="index.do";
			});
			
			setTimeout(function(){
				location.href="index.do";
			},3000);
			
		});
	</script>
	</head>
	<body>
		<div id="dialog" class="modal fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">提示</h4>
		      </div>
		      <div class="modal-body">
		        <p>Excel 数据导入失败,请重试！</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="btnc" class="btn btn-default">关闭</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</body>
</html>