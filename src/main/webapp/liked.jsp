<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "dto.Work" %>
<%@ page import = "dao.WorkRepository" %>

<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%
String likedId = session.getId();
%>
<meta charset="UTF-8">
<title>좋아요 목록</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3">좋아요</h1>
	</div>
</div>

<div class="container">
	<div class="row">
		<table width="100%">
			<tr>
				<td align="left"><a href="./deleteLiked.jsp?likedId=<%=likedId %>" class="btn btn-danger">삭제하기</a></td>
				<td align="right"><a href="./shippingInfo.jsp?likedId=<%=likedId %>" class="btn btn-success">주문하기</a></td>
			</tr>
		</table>
	</div>
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>작품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>				
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
				<td><%=work.getWorkId()%> - <%=work.getName() %></td>
				<td><%=work.getUnitPrice() %></td>
				<td><%=work.getQuantity() %></td>
				<td><%=total %></td>
				<td><a href="./removeLiked.jsp?id=<%=work.getWorkId()%>" class="badge badge-danger"> 삭제</a></td>
				
			</tr>
			<%
			}
			%>
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th><%=sum %></th>
				<th></th>
			</tr>
		</table>
		<a href="./works.jsp" class="btn btn-secondary">&laquo; 작품 계속보기</a>
	</div>
	<hr>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>