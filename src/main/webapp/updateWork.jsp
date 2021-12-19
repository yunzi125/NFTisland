<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>작품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">작품 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String workId=request.getParameter("id");
	
		PreparedStatement wstmt = null;
		ResultSet rs = null;
				
		String sql="select * from work where w_id=?";
		wstmt=conn.prepareStatement(sql);
		wstmt.setString(1, workId);
		rs=wstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">	
			<div class="col-md-5">
				<img src="c:/upload/<%=rs.getString("w_fileName") %>" style="width: 100%">
			</div>
		<div class="col-md-7">
		<form name="newWork" action="./processUpdateWork.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">작품 번호</label>
				<div class="col-sm-3">
					<input type="text" id="workId" name="workId" class="form-control" value='<%=rs.getString("w_id") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">작품명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" value='<%=rs.getString("w_name") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" value='<%=rs.getString("w_unitPrice") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 설명</label>
				<div class="col-sm-7">
					<textarea name="description" cols="50" rows="2" class="form-control" value='<%=rs.getString("w_description") %>'></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value='<%=rs.getString("w_category") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value='<%=rs.getString("w_unitsInStock") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="NEW" >
					<fmt:message key="condition_New" />
					<input type="radio" name="condition" value="Old" >
					<fmt:message key="condition_Old" />
				</div>
			</div>
				<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="workImage" value="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>
	</div>
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
<jsp:include page="footer.jsp"/>
</body>
</html>