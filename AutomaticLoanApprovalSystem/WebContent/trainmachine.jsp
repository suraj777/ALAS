<%@page import="util.JavaToR"%>
<%
JavaToR jtr = new JavaToR();
jtr.TrainMachine(null);
%>

alert('Machine Trained Successfully');

<%
response.sendRedirect("adminhome.jsp");
%>