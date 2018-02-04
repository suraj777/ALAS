<%@page import="dao.UserDao"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="u" class="dto.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	User usr = (User)session.getAttribute("user");

	UserDao ldao=new UserDao();
	boolean b = ldao.InsertNewLoan(usr.getUserId(), u);
	if(b){
		response.sendRedirect("loandetails.jsp");
	}
	else{
		response.sendRedirect("userhome.jsp");
	}
%>