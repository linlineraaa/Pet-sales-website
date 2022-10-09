<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript">
	//注销
	function logout(){
		if(confirm('您确定要退出系统吗？')){
			window.location.href="user_logout.action";
		}
	}
	//检查登陆
	function checkLogin(){
		if('${currentUser.userName}'==''){
			alert("请先登录！");
		}else{
			window.location.href="shopping_list.action";
			//当前页面打开URL页面
		}
	}
</script>
</head>
<body>

<div id="logo">
	<img src="images/logo0.png" width="118" height="50" />
</div>
<div class="help">
	<c:choose>
		<c:when test="${not empty currentUser }">
		<!-- 不是空的当前用户 -->
			<a href="shopping_list.action" class="shopping">购物车(${shoppingCart.shoppingCartItems==null?0:shoppingCart.shoppingCartItems.size() }件商品)</a>
			<a href="user_userCenter.action">${currentUser.userName }</a>
			<!-- 跳到action中（其中test是你的action在struts.xml中配置的name ） -->
			<a href="javascript:logout()">注销</a>
			
		</c:when>
		<c:otherwise>
			<a href="javascript:checkLogin()" class="shopping">购物车</a>
			<a href="login.jsp">登录</a>
			<a href="register.jsp">注册</a>
			
		</c:otherwise>
	</c:choose>

	<form action="product.action" method="post">
		<input type="text" id="txtSearch" name="s_product.name"
			onkeyup="" autocomplete="off"
			   value="${s_product.name }" /> 
			    <!-- 需要对客户的资料进行保密，防止浏览器软件或者恶意插件获取到 -->
			    <input
			type="submit" id="cmdSearch"  value="搜索" /><br/>
		<div id="suggest" style="width: 200px"></div>
	</form>
</div>

<div class="navbar">
	<ul class="clearfix">
		<li class="current"><a href="index.jsp">首页</a>
		</li>
		<c:forEach var="bigType" items="${bigTypeList }">
		<!-- 标签封装了Java中的for，while，do-while循环 -->
			<li>
				<a href="product.action?s_product.bigType.id=${bigType.id }">${bigType.name }</a>
			</li>
		</c:forEach>
	</ul>
</div>


<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
		
		</ul> 
	</div>
</div>
</body>
</html>