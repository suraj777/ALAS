<%@page import="dto.User" %>
<%@page import="dao.UserDao" %>
<jsp:useBean id="user" class="dto.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
	UserDao udao = new UserDao();
	boolean b = udao.User(user);
	if(b){
		session.setAttribute("user", udao.getUserById(user));
//		User u=udao.getUserById(user);
		session.setMaxInactiveInterval(60*30);
		response.sendRedirect("userhome.jsp");
	}else{
		response.sendRedirect("index.jsp");
	}
%>
