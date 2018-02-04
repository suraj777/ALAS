<%@page import="dto.Admin"%>
<%@page import="dao.AdminDao" %>
<jsp:useBean id="admin" class="dto.Admin"></jsp:useBean>
<jsp:setProperty property="*" name="admin"/>
<%
	AdminDao ldao=new AdminDao();
	boolean b = ldao.Adminlogin(admin);
	if(b){
		session.setAttribute("admin", admin);
		session.setMaxInactiveInterval(60*20);
		response.sendRedirect("adminhome.jsp");
	}else{
		response.sendRedirect("adminlogin.jsp");
	}
%>