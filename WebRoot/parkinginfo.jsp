<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		  $(".click").click(function(){
		  $(".tip").fadeIn(200);
		  });
	});
</script>
<script type="text/javascript">
	/* 高级查询 */
	function search(){
		alert("welcome to the search ！");
		var search_owner = document.getElementById("search_owner").value;
		var search_house_number = document.getElementById("search_house_number").value;
		var search_id = document.getElementById("search_id").value;
		alert(search_id);
		var url = "Parking!ParkingSearchByCondition?parking_owner="+search_owner+"&parking_house_number="+search_house_number+"&car_id="+search_id;
		alert("url is :"+url); 
		document.location.href =url;
	}
	/* 高级查询div显示与隐藏 */
	function DisplayAdvancedQuery(){
		var searchDiv = document.getElementById('search');
		var val = searchDiv.style.display;
		if(val == 'none'){
			searchDiv.style.display = 'block'; //显示
	    }else{
	    	searchDiv.style.display = 'none'; //隐藏
	    }
}
</script>
</head>

<body>
<%
        String exportToExcel = request.getParameter("exportToExcel");
        if (exportToExcel != null
                && exportToExcel.toString().equalsIgnoreCase("YES")) {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="
                    + "excel.xls");
 
        }
%>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
	    <li>首页</li>
	    <li>车辆及车位信息</li>
	    <li>车位信息</li>
    </ul>
    </div>
    
<div class="rightinfo">
    
    <div class="tools">
    	<ul class="toolbar">
	        <li><a href="jsp/add_parkinginfo.jsp"><span><img src="<%=path %>/images/t01.png" /></span>添加</a></li>
	        <%
       			 if (exportToExcel == null) {
    		%>
	        <li><a href="parkinginfo.jsp?exportToExcel=YES"><span><img src="<%=path %>/images/t01.png" /></span>导出本页为Excel</a></li>
        	<% 
       			 }
        	%>
        	<li><a href="javascript:void(0)" onclick="DisplayAdvancedQuery()"><span><img src="<%=path %>/images/t01.png" /></span>高级查询</a></li>
        </ul>       
    </div>
    
    <div id="search" style="display:none;">
	    <input type="text" id="search_owner" name="search_owner" placeholder="请输入业主名称" style="border:1px solid #378888">
	    <input type="text" id="search_house_number" name="search_house_number" placeholder="请输入门牌号" style="border:1px solid #378888">
	    <input type="text" id="search_id" name="search_id" placeholder="请输入车牌号" style="border:1px solid #378888">
	    <input type="button" value="多条件查询" style="height:32px;width:100px;background-image:url(<%=path %>/images/toolbg.gif);border-style:solid;border-width:1px;border-color:#d3dbde;" onclick="search();">
    </div>

    <table class="tablelist">
    	<thead>
	    	<tr>
	    		<th>序号</th>
		        <th>编号<i class="sort"><img src="<%=path %>/images/px.gif" /></i></th>
		        <th>所属业主名称</th>
		        <th>所属门牌号</th>
		        <th>车牌号</th>
		        <th>出售时间</th>
		        <th>操作</th>
	        </tr>
        </thead>
        
        <tbody>
         <s:iterator value="#session.parking" var="p" status="i">
				<tr>
					<td>${i.count }</td>
					<td><s:property value="#p.p_id"/></td>
					<td><s:property value="#p.p_name"/></td>
					<td><s:property value="#p.h_house_number"/></td>
					<td><s:property value="#p.oc_licenseplate"/></td>
					<td><s:property value="#p.p_time"/></td>
					<td>
				        <a class="tablelink"
				       		href="Parking!ParkingFindById?id=${p.p_id }"
				         	onclick="javascript:return confirm('您确认修改当前数据么？');">修改</a>
				        <a class="tablelink"
				         	href="Parking!ParkingDelete?id=${p.p_id}"
							onclick="javascript:return confirm('您确认删除当前数据么？');"> 删除</a>
			        </td>
				</tr>
			</s:iterator>
        </tbody>
        <tr align="center">
		        <td colspan="7">
					<a href="Parking!ParkingFindAll.action?page=1">首页</a>
					<s:if test="#session.page>1">
						<a href="Parking!ParkingFindAll.action?page=${page-1}">上一页</a>
					</s:if>
					<s:if test="#session.page<#session.size">
						<a href="Parking!ParkingFindAll.action?page=${page+1}">下一页</a>
					</s:if>
					<a href="Parking!ParkingFindAll.action?page=${size}">尾页</a>
				<s:iterator value="#session.fenye" var="m" status="i">
					<a href="Parking!ParkingFindAll.action?page=${i.count}">第${i.count}页</a>
				</s:iterator>
				</td>
			</tr>
    </table>
    <p align="center" style="color:red;font-size:10px;">注：未出售车位信息默认为0</p>
   
   <!--  <div class="pagin">
    	<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div> -->
    
    <!-- <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      	<div class="tipinfo">
        	<span><img src="images/ticon.png" /></span>
	        <div class="tipright">
	        <p>是否确认对信息的修改 ？</p>
	        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
	        </div>
        </div>
        
        <div class="tipbtn">
	        <input name="" type="button"  class="sure" value="确定" />&nbsp;
	        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    </div> -->
</div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>
</html>
