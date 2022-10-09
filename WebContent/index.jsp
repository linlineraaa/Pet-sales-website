<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宠物商城 - 首页</title>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="common/top.jsp"/>
</div>

<div id="main" class="wrap">
	<div class="lefter">
		<jsp:include page="common/left.jsp"/>
	</div>
	<div class="main"><!-- css样式为main -->
			<div class="price-off "><!-- #main .main .price-off { float:left; width:520px; } -->
				<h2>特价商品</h2>
				<ul class="product clearfix">
				<c:forEach items="${specialPriceProductList}" var="spProduct">
					<li>
						<dl>
							<dt><!-- li是一个点，dl就是定义一个列表,dt就是这个列表的标题,dd就是内容,能缩进,action声明在struts.xml中 -->
								<a href="product_showProduct.action?productId=${spProduct.id}" target="_blank">
				                  <img
									src="${spProduct.proPic}" /> </a>
							</dt>
							<dd class="title">
								<a href="product_showProduct.action?productId=${spProduct.id}" >${spProduct.name}</a>
							</dd>
							<dd class="price">￥${spProduct.price}</dd>
						</dl>
					</li>
				</c:forEach>
				</ul>
			
				<div class="news-list">
					<h4>最新公告</h4>
					<ul>
						<c:forEach items="${noticeList}" var="notice">
							<li><a href="notice_showNotice.action?noticeId=${notice.id}" >${notice.title}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="spacer clear"></div>
			
			
			
		</div>
		<div class="clear"></div>
</div>
<div id="footer">
	<jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>