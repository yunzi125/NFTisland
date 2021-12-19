<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.net.URLDecoder" %>

<%
request.setCharacterEncoding("UTF-8");

String likedId = session.getId();
String shipping_likedId = "";
String shipping_name = "";
String shipping_shippingDate = "";
String shipping_country = "";

Cookie[] cookies = request.getCookies();

if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("Shipping_cartId"))
			shipping_likedId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if(n.equals("Shipping_shippingDate"))
			shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	}
}


%>

<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>주문 완료</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3">주문 완료</h1>
	</div>
</div>

<div class="container">
	<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
	<p> 주문 날짜는 <% out.println(shipping_shippingDate); %> 입니다!
	<p> 주문 번호 : <% out.println(shipping_likedId); %>
</div>

<div class="container">
	<p><a href="./works.jsp" class="btn btn-secondary">&laquo; 작품 목록</a>
</div>

</body>
</html>

<%
session.invalidate();

for(int i=0; i<cookies.length; i++){
	Cookie thisCookie = cookies[i];
	String n = thisCookie.getName();
	if(n.equals("Shipping_likedId"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_name"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_shippingDate"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_country"))
		thisCookie.setMaxAge(0);
}
%>