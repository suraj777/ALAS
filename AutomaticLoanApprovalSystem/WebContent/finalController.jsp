<%@page import="dto.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="u" class="dto.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
User usr = (User)session.getAttribute("user");

UserDao ldao=new UserDao();
boolean a = ldao.personalDetails(usr.getUserId(), u);
boolean b = ldao.addFinancialDetails(usr.getUserId(), u);
boolean c = ldao.insertAssets(usr.getUserId(), u);
boolean d = ldao.addExpenditureDetails(usr.getUserId(), u);
boolean e = ldao.InsertNewLoan(usr.getUserId(), u);
	if(a && b && c && d && e){
		%>
		<script>alert("Form not submitted successfully");</script><%
	}
	else{
		response.sendRedirect("userhome.jsp");
	}
%>