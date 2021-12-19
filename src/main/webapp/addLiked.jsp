<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Work" %>
<%@ page import="dao.WorkRepository" %>

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

	ArrayList<Work> goodsList = dao.getAllWorks();
	Work goods = new Work();
	for(int i=0; i<goodsList.size(); i++){
		goods = goodsList.get(i);
		if(goods.getWorkId().equals(id)){
			break;
		}
	}

	ArrayList<Work> list = (ArrayList<Work>) session.getAttribute("likedlist");
	if(list == null){
		list = new ArrayList<Work>();
		session.setAttribute("likedlist", list);
	}
	
	int cnt = 0;
	Work goodsQnt = new Work();
	for(int i=0; i<list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getWorkId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuantity()+1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if(cnt == 0){
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("work.jsp?id="+id);

%>