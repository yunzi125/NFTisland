<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "dto.Work" %>
<%@ page import = "dao.WorkRepository" %>

<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("works.jsp");
		return;
	}

	WorkRepository dao = WorkRepository.getInstance();

	Work work = dao.getWorkById(id);
	if(work == null){
		response.sendRedirect("exceptionNoWorkId.jsp");	
	}

	ArrayList<Work> likedList = (ArrayList<Work>)session.getAttribute("likedlist");
	Work goodsQnt = new Work();
	for(int i=0; i<likedList.size(); i++){
		goodsQnt = likedList.get(i);
		if(goodsQnt.getWorkId().equals(id)){
			likedList.remove(goodsQnt);
		}
	}

	response.sendRedirect("liked.jsp");
%>