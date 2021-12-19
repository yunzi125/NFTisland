<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>작품 편집</title>
<script type="text/javascript">
function deleteConfirm(id) {
    if(confirm("해당 작품을 삭제합니다!!")==true)
       location.href="./deleteWork.jsp?id="+id;
    else
       return;
 }

</script>
</head>
<body>
<%
         String edit = request.getParameter("edit");
   %>
   <jsp:include page="menu.jsp"/>
   <div class="jumbotron">
      <div class="container">
			<h1 class="display-3">작품 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement wstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from work";
	            wstmt = conn.prepareStatement(sql);
	            rs = wstmt.executeQuery();
	            while (rs.next()) {

			%>
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("w_fileName")%>" style="width:100%">
				<h3><%=rs.getString("w_name") %></h3>
				<p><%=rs.getString("w_description") %>
				<p><%=rs.getString("w_UnitPrice") %> KRW
				 <p><%
               		if (edit.equals("update")) {
               		%>

					<a href="./updateWork.jsp?id=<%=rs.getString("w_id") %>" class="btn btn-success" role="button"> 수정 &raquo;</a>
					<%
						} else if (edit.equals("delete")){
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("w_id") %>')" class="btn btn-danger" role="button"> 삭제 &raquo;></a>
					<%
						}
					%>
			</div>
			<%
				}
				if(rs!=null)
					rs.close();
				if(wstmt!=null)
					wstmt.close();
				if(conn!=null)
					conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>