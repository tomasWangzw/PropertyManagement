<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>信息管理</div>
    
    <dl class="leftmenu">
    
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>欢迎使用
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="welcome.jsp" target="rightFrame">首页</a><i></i></li>
        </ul>    
    </dd>
    
    
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>业主及房屋信息
    </div>
    	<ul class="menuson">
	        <li><cite></cite><a href="Owner!OwnerFindAll.action?page=1" target="rightFrame">业主信息查询</a><i></i></li>
	        <li><cite></cite><a href="Home!HomeFindAll.action?page=1" target="rightFrame">房屋信息</a><i></i></li>
	        <li><cite></cite><a href="Home!FreeHomeFindAll.action" target="rightFrame">出售房屋信息</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>工作人员及部门信息
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="Worker!WorkerFindAll.action?page=1" target="rightFrame">工作人员信息</a><i></i></li>
        <li><cite></cite><a href="Department!DepartmentFindAll.action?page=1" target="rightFrame">部门信息查询</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="images/leftico03.png" /></span>公共设施信息</div>
	    <ul class="menuson">
	        <li><cite></cite><a href="Camera!CameraFindAll.action?page=1" target="rightFrame">摄像头信息</a><i></i></li>
	        <li><cite></cite><a href="Apparatus!ApparatusFindAll.action?page=1" target="rightFrame">健身器材信息</a><i></i></li>
	        <li><cite></cite><a href="Otherapparatus!OthApparatusFindAll.action?page=1" target="rightFrame">其他公共设施</a><i></i></li>
	    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="images/leftico04.png" /></span>业主车辆及车位信息</div>
	    <ul class="menuson">
	        <li><cite></cite><a href="Cars!CarsFindAll.action?page=1" target="rightFrame">业主车辆信息</a><i></i></li>
	        <li><cite></cite><a href="Parking!ParkingFindAll.action?page=1" target="rightFrame">小区停车位信息</a><i></i></li>
	        <li><cite></cite><a href="Parking!ParkingFindFree.action?page=1" target="rightFrame">查询空闲停车位</a><i></i></li>
	    </ul>
    </dd>   
    
    <dd><div class="title"><span><img src="images/leftico04.png" /></span>水电费缴纳信息</div>
	    <ul class="menuson">
	        <li><cite></cite><a href="Money!MoneyFindAll.action?page=1" target="rightFrame">缴纳水电费</a><i></i></li>
	        <li><cite></cite><a href="Money!MoneyAlready.action?page=1" target="rightFrame">已缴纳水电费用户</a><i></i></li>
	    </ul>
    </dd>   
    
    <dd><div class="title"><span><img src="images/leftico03.png" /></span>报修信息管理</div>
	    <ul class="menuson">
	       <!--  <li><cite></cite><a href="Repair!RepairShowFalse.action" target="rightFrame">未处理保修信息查询</a><i></i></li> -->
	        <li><cite></cite><a href="Repair!RepairFindAll.action" target="rightFrame">查询保修信息</a><i></i></li>
	        <li><cite></cite><a href="Repair!RepairFinFind.action" target="rightFrame">打印保修凭证</a><i></i></li>
	    </ul>    
    </dd>  
    </dl>
</body>
</html>
