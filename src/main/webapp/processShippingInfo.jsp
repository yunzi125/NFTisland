<%@page contentType="text/html; charset=UTF-8"%>
<%@page import ="java.net.URLEncoder" %>

<%
request.setCharacterEncoding("UTF-8");

Cookie likedId = new Cookie("Shipping_likedId", URLEncoder.encode(request.getParameter("likedId"), "utf-8"));
Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "utf-8"));

likedId.setMaxAge(24*60*60);
name.setMaxAge(24*60*60);
country.setMaxAge(24*60*60);

response.addCookie(likedId);
response.addCookie(name);
response.addCookie(shippingDate);
response.addCookie(country);

response.sendRedirect("orderConfirmation.jsp");

%>