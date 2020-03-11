<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APPPATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APPPATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APPPATH }/css/main.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li style="padding-top:8px;">
				<div class="btn-group">
				  <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i> andy<span class="caret"></span>
				  </button>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
						<li class="divider"></li>
						<li><a href="index.html"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
					  </ul>
			    </div>
			</li>
            <li style="margin-left:10px;padding-top:8px;">
				<button type="button" class="btn btn-default btn-danger">
				  <span class="glyphicon glyphicon-question-sign"></span> 帮助
				</button>
			</li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="tree">
				<ul style="padding-left:0px;" class="list-group">
					<li class="list-group-item tree-closed" >
						<a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a> 
					</li>
					<li class="list-group-item">
						<span><i class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span class="badge" style="float:right">3</span></span> 
						<ul style="margin-top:10px;">
							<li style="height:30px;">
								<a href="${APPPATH }/user/index" style="color:red;"><i class="glyphicon glyphicon-user"></i> 用户维护</a> 
							</li>
							<li style="height:30px;">
								<a href="${APPPATH }/role/show"><i class="glyphicon glyphicon-king"></i> 角色维护</a> 
							</li>
							<li style="height:30px;">
								<a href="permission.html"><i class="glyphicon glyphicon-lock"></i> 许可维护</a> 
							</li>
						</ul>
					</li>
					
				</ul>
			</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input class="form-control has-success" type="text" placeholder="请输入查询条件" name="queryVal" id="queryVal">
    </div>
  </div>
  <button type="button" class="btn btn-warning" id="queryValBtn"><i class="glyphicon glyphicon-search"></i> 查询</button>
  <div class="form-group has-feedback">
    <div class="input-group">
      	<div class="input-group-addon">类别查询</div>
      	<div class="form-control has-success">
      	<input type="radio" name="rid"  value="${bid }" checked/>商家
      	<input type="radio" name="rid"  value="${uid }" />普通用户
      	<input type="radio" name="rid"  value="${tid }"/>外卖员
      	</div>
    </div>
  </div>
  <button type="button" class="btn btn-warning" id="TypeBtn"><i class="glyphicon glyphicon-search"></i> 分类查询</button>
</form>
<button type="button" class="btn btn-danger" id="delsUsers" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>

<br>
 <hr style="clear:both;">
          <div class="table-responsive">
          <form id="form1" >
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox" id="checkAll"></th>
                  <th>账号</th>
                  <th>密码</th>
                  <th>名称</th>
                  <th>地址</th>
                  <th>状态</th>
                  <th>角色名称</th>
                  <th width="150">操作</th>
                </tr>
              </thead>
              <tbody id="tableContent">
                
                
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="9" align="center">
						<ul class="pagination" id="strByPage">
								
							 </ul>
					 </td>
				 </tr>

			  </tfoot>
            </table>
            </form>
          </div>
			  </div>
			</div>
        </div>
      </div>
    </div>

    <script src="${APPPATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APPPATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APPPATH }/script/docs.min.js"></script>
	<script src="${APPPATH }/layer/layer.js"></script>
        <script type="text/javascript">
        var queryFlag = false;
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
			    queryByPage(1);
			    
            });
            $("#checkAll").click(function(){
            	var flag = $(this).prop("checked");
            	$("#tableContent :checkbox").prop("checked",flag);
            });
            function activation(uid){
            	$.ajax({
            		cache:false,
            		url:"activation",
            		type:"post",
            		data:{"uid":uid},
            		error:function(){
            			alert("error");
            		},
            		success:function(result){
            			if (result.flag) {
		    				layer.msg("激活成功！", {time:5000, icon:6, shift:6}, function(){});
		    				queryByPage(1);
		    			}else{
							layer.msg("激活失败！", {time:1000, icon:2, shift:6}, function(){});
						}
            		}
            	});
            }
            function disable(uid){
            	$.ajax({
            		cache:false,
            		url:"disable",
            		type:"post",
            		data:{"uid":uid},
            		error:function(){
            			alert("error");
            		},
            		success:function(result){
            			if (result.flag) {
		    				layer.msg("停用成功！", {time:5000, icon:6, shift:6}, function(){});
		    				queryByPage(1);
		    			}else{
							layer.msg("停用失败！", {time:1000, icon:2, shift:6}, function(){});
						}
            		}
            	});
            }
            $("#queryValBtn").click(function(){
            	var queryVal = $("#queryVal").val();
            	if (queryVal!="") {
            		queryFlag = true;
				}
            	queryByPage(1);
            });
            $("#delsUsers").click(function(){
            	layer.confirm("是否删除选中的用户？",  {icon: 3, title:'提示'}, function(cindex){
    			    layer.close(cindex);
    			    $.ajax({
                		cache:false,
                		url:"delUsers",
                		type:"post",
                		data:$("#form1").serialize(),
                		error:function(){
			    			alert("error");
			    		},
			    		success:function(result){
			    			if (result.flag) {
			    				layer.msg("删除成功！", {time:5000, icon:6, shift:6}, function(){});
			    				queryByPage(1);
			    			}else{
								layer.msg("删除失败！", {time:1000, icon:2, shift:6}, function(){});
							}
			    		}
                	});
    			}, function(cindex){
    			    layer.close(cindex);
    			});
            });
           	function deleteUser(uid){
           		layer.confirm("是否删除该用户？",  {icon: 3, title:'提示'}, function(cindex){
    			    layer.close(cindex);
    			    $.ajax({
    			    	cache:false,
    			    	url:"deleteUser",
    			    	type:"post",
    			    	data:{"uid":uid},
    			    	error:function(){
			    			alert("error");
			    		},
			    		success:function(result){
			    			if (result.flag) {
			    				layer.msg("删除成功！", {time:5000, icon:6, shift:6}, function(){});
			    				queryByPage(1);
			    			}else{
								layer.msg("删除失败！", {time:1000, icon:2, shift:6}, function(){});
							}
			    		}
    			    });
    			}, function(cindex){
    			    layer.close(cindex);
    			});
           	}
           	function resetPwd(uid){
           		layer.confirm("是否重置该用户密码？",  {icon: 3, title:'提示'}, function(cindex){
    			    layer.close(cindex);
    			    $.ajax({
    			    	cache:false,
    			    	url:"resetPwd",
    			    	type:"post",
    			    	data:{"uid":uid},
    			    	error:function(){
			    			alert("error");
			    		},
			    		success:function(result){
			    			if (result.flag) {
			    				layer.msg("重置密码成功！", {time:5000, icon:6, shift:6}, function(){});
								/* window.location.href="index"; */
			    				queryByPage(1);
			    			}else{
								layer.msg("重置密码失败！", {time:1000, icon:2, shift:6}, function(){});
							}
			    		}
    			    });
    			}, function(cindex){
    			    layer.close(cindex);
    			});
           	}
            function queryByPage(currentPage){
            	var dataJson = {"rid":$("input[type='radio']:checked").val(),"currentPage":currentPage};
            	if (queryFlag) {
            		//为json对象动态添加属性并赋值
            		dataJson.queryVal = $("#queryVal").val();
				}
            	$.ajax({
			  		cache:false,
			  		url:"selectAll",
			  		type:"post",
			  		data:dataJson,
			  		error:function(){
			  			alert("error");
			  		},
			  		success:function(result){
			  			if (result.flag) {
			  				var userStr = "";
							$.each(result.obj.data,function(index,user){
								userStr+="<tr>";
			                    userStr+="<td>"+(index+1)+"</td>";
							    userStr+="<td><input type='checkbox' name='uids' value='"+user.uid+"'></td>";
			                    userStr+="<td>"+user.uaccount+"</td>";
			                    userStr+="<td>"+user.upassword+"</td>";
			                    userStr+="<td>"+user.uname+"</td>";
			                    userStr+="<td>"+user.uaddress+"</td>";
			                    userStr+="<td>"+user.ustatus+"</td>";
			                    userStr+="<td>"+user.role.rname+"</td>";
			                    userStr+="<td>";
			                    if (user.ustatus=="激活") {
			                    	userStr+="<button type='button' class='btn btn-success btn-xs' onclick='disable("+user.uid+")'><i class=' glyphicon glyphicon-off'></i></button>";
									userStr+="<button type='button' class='btn btn-primary btn-xs' onclick='resetPwd("+user.uid+")'><i class=' glyphicon glyphicon-pencil'></i></button>";
									userStr+="<button type='button' class='btn btn-danger btn-xs' onclick='deleteUser("+user.uid+")'><i class=' glyphicon glyphicon-remove'></i></button>";
								}
								if (user.ustatus=="已停用") {
									userStr+="<button type='button' class='btn btn-success btn-xs' onclick='activation("+user.uid+")'><i class=' glyphicon glyphicon-ok-circle'></i></button>";
								}
								userStr+="</td>";
				                userStr+="</tr>";					
				             });
							$("#tableContent").html(userStr);
							var strByPage = "";
							strByPage+="<li class='"+(result.obj.currentPage==1?'disabled':'')+"'><a href='#' onclick='queryByPage("+(result.obj.currentPage-1)+")'>上一页</a></li>";
							for (var i = 1; i <= result.obj.pages; i++) {
								if (result.obj.currentPage==i) {
									strByPage+="<li class='active'><a href='#' onclick='queryByPage("+i+")'>"+i+"<span class='sr-only'>(current)</span></a></li>";
								}else{
									strByPage+="<li ><a href='#' onclick='queryByPage("+i+")'>"+i+"<span class='sr-only'>(current)</span></a></li>";
								}
							}
							strByPage+="<li class='"+(result.obj.currentPage==result.obj.pages?'disabled':'')+"'><a href='#' onclick='queryByPage("+(result.obj.currentPage+1)+")'>下一页</a></li>";
							strByPage+="<li class='disabled'><span>共"+result.obj.pages+"页</span></li>";
							strByPage+="<li class='disabled'><span>共"+result.obj.totalCount+"条</span></li>";
							$("#strByPage").html(strByPage);
			  			}else{
							layer.msg("查询失败！", {time:1000, icon:2, shift:6}, function(){});
						}
			  		}
			  	});
            }
            
            $("#TypeBtn").click(function(){
            	queryByPage(1);
            });
            	
            
            $("tbody .btn-success").click(function(){
                window.location.href = "assignRole.html";
            });
            $("tbody .btn-primary").click(function(){
                window.location.href = "edit.html";
            });
        </script>
  </body>
</html>
    