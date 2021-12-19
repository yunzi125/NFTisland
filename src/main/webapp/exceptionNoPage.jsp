<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
 
    <!--    Bootstrap 초기화 부분 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>

<body>
<%@ include file="menu.jsp" %>

<%!
String main = "요청하신 페이지가 존재하지 않습니다.";
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
		<p> <a href="works.jsp" class="btn btn-secondary"> NFT 작품 목록 &raquo;</a>
		<%--<h3><%@ include file="date.jsp" %></h3>--%>
	</div>
</div>
<%@ include file="footer.jsp" %>
</main>

</body>
</html>