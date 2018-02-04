<%@page import="java.io.PrintWriter"%>
<%@page import="dao.UserDao" %>
<jsp:useBean id="user" class="dto.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
	UserDao udao = new UserDao();
	boolean b = udao.UserRegistration(user);
	if(b==false){
		response.sendRedirect("index.jsp");
	}
%>
