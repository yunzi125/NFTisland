<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = "C:\\upload"; // 웹 어플리케이션상의 절대 경로
	int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기 5MB
	String encType = "utf-8"; // 인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String workId = multi.getParameter("workId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String worker = multi.getParameter("worker");
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement wstmt = null;
	ResultSet rs = null;
	
	String sql="select * from work where w_id=?";
	wstmt=conn.prepareStatement(sql);
	wstmt.setString(1, workId);
	rs=wstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql="UPDATE work SET w_name=?, w_unitPrice=?, w_description=?, w_category=?, w_unitsInStock=?, w_condition=?, w_fileName=? WHERE w_id=?";
			wstmt=conn.prepareStatement(sql);
			wstmt.setString(1, workId);
			wstmt.setString(2, name);
			wstmt.setInt(3, price);
			wstmt.setString(4, description);
			wstmt.setString(5, category);
			wstmt.setLong(6, stock);
			wstmt.setString(7, condition);
			wstmt.setString(8, fileName);
			wstmt.executeUpdate();
		} else{
			sql="UPDATE work SET w_name=?, w_unitPrice=?, w_description=?, w_category=?, w_unitsInStock=?, w_condition=? WHERE w_id=?";
			wstmt=conn.prepareStatement(sql);
			wstmt.setString(1, workId);
			wstmt.setString(2, name);
			wstmt.setInt(3, price);
			wstmt.setString(4, description);
			wstmt.setString(5, category);
			wstmt.setLong(6, stock);
			wstmt.setString(7, condition);
			wstmt.executeUpdate();
		}
	}
	
	if(rs!=null)
		rs.close();
	if(wstmt!=null)
		wstmt.close();
	if(conn!=null)
		conn.close();

	response.sendRedirect("editWork.jsp?edit=update");
%>