<% 
 session.removeAttribute("admin");
 session.invalidate();
 response.sendRedirect("adminlogin.jsp");
%>