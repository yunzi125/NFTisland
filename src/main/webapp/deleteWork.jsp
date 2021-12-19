<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
		String workId=request.getParameter("id");
		
		String sql="select * from work";
		PreparedStatement wstmt = null;
		ResultSet rs = null;
		wstmt=conn.prepareStatement(sql);
		rs=wstmt.executeQuery();
		
		if(rs.next()){		
			sql="delete * from work where w_id=?";
			wstmt=conn.prepareStatement(sql);
			wstmt.setString(1, workId);
			wstmt.executeUpdate();
		}else
			out.println("일치하는 작품이 없습니다.");
		
		if(rs!=null)
			rs.close();
		if(wstmt!=null)
			wstmt.close();
		if(conn!=null)
			conn.close();
		
		response.sendRedirect("editWork.jsp?edit=delete");
%>