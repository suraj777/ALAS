<%@page import="dto.User"%>
<%@page import="dao.UserDao"%>

<jsp:useBean id="u" class="dto.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%

	User usr = (User)session.getAttribute("user");

	UserDao ldao=new UserDao();
	boolean b = ldao.personalDetails(usr.getUserId(),u);
	if(!b){
		response.sendRedirect("financialdetails.jsp");
	}
	else{
		response.sendRedirect("personaldetails.jsp");
	}
%>
