<%@page import="dto.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="u" class="dto.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	User user = (User) session.getAttribute("user");
	UserDao ldao = new UserDao();
	boolean b = ldao.addFinancialDetails(user.getUserId(), u);
	boolean c = ldao.insertAssets(user.getUserId(), u);
	if (b && c) {
		response.sendRedirect("financialdetails.jsp");
	} else {
		response.sendRedirect("expendituredetails.jsp");
	}
%>