<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
	<div id="shopping">
		<div class="shadow">
			<em class="corner lb"></em>
			<em class="corner rt"></em>
			<div class="box">
				<div class="msg">
					<p><b>请付款</p></b>
						<img src="${pageContext.request.contextPath}/images/erweima.jpg" width=250 height=350/>
						<div class="button">
				<input type="submit" value="" 
				onclick="window.location='result.jsp'"/>
			</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>