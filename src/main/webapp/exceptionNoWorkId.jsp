<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="utf-8">
<title>NFT Island</title>
</head>

<body>
<%@ include file="menu.jsp" %>

<%!
String main = "해당 작품이 존재하지 않습니다.";
%>
<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3"><%=main %></h1>
	</div>
</div>

<main role="main">
<div class="contaimer">
	<div class="text-center">
		<p><%=request.getRequestURL() %>?<%=request.getQueryString() %>
		<p> <a href="works.jsp" class="btn btn-secondary"> 작품 목록 &raquo;</a>
	</div>
</div>
<%@ include file="footer.jsp" %>
</main>

</body>
</html>