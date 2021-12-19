<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="dto.Work" %>
<%@ page import="dao.WorkRepository" %>

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
		if(n.equals("Shipping_name"))
			shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if(n.equals("Shipping_shippingDate"))
			shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if(n.equals("Shipping_country"))
			shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>주문 정보</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3">주문 정보</h1>
	</div>
</div>

<div class="container col-8 alert alert-info">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">영수증</h1>
		</div>
	</div>

	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송주소</strong>
			<br> 성명 : <% out.println(shipping_name); %><% out.println(shipping_country); %>
			<br>			
		</div>
		<div class="col-4" align="right">
			<p> <em>작품 주문일 : <% out.println(shipping_shippingDate); %></em>
		</div>
	</div>
	
	<div>
		<table class="table table-hover">
			<tr>
				<th>작품</th>
				<th>#</th>
				<th>가격</th>
				<th>소계</th>			
			</tr>
			<%
			int sum = 0;
			ArrayList<Work> likedList = (ArrayList<Work>)session.getAttribute("likedlist");
			if(likedList == null)
				likedList = new ArrayList<Work>();
			for(int i=0; i<likedList.size(); i++){
				Work work = likedList.get(i);
				int total = work.getUnitPrice() * work.getQuantity();
				sum += total;
			%>
			<tr>
				<td class="text-center"><em><%=work.getName()%></em></td>
				<td class="text-center"><%=work.getQuantity() %></td>
				<td class="text-center"><%=work.getUnitPrice() %></td>
				<td class="text-center"><%=total%> KRW </td>
			</tr>
			<%
			}
			%>
			<tr>
				<td></td>
				<td></td>
				<td class="text-right"><strong>총액 : </strong></th>
				<td class="text-center text-danger"><strong><%=sum %> </strong></th>
			</tr>
		</table>
		
		<a href="./shippingInfo.jsp?likedId=<%=shipping_likedId%>" class="btn btn-secondary" role="button">이전</a>
		<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
		<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
	</div>
</div>
</body>
</html>