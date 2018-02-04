<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.UserDao" %>
<jsp:useBean id="u" class="dto.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
UserDao mdao = new UserDao();
System.out.println(u.getUserId()+"First");

int i = mdao.updateStatus(u);
System.out.println(i);
response.sendRedirect("loanstatus.jsp");
%>
