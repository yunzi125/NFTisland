<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dto.Work" %>
<%@ page import="dao.WorkRepository" %>

<%
String id = request.getParameter("likedId");
if(id == null || id.trim().equals("")){
	response.sendRedirect("liked.jsp");
	return;
}

session.invalidate();

response.sendRedirect("liked.jsp");

%>