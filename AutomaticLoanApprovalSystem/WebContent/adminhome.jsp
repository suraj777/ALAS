<%@page import="dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
if(session.getAttribute("admin")==null)
	response.sendRedirect("logout.jsp");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Admin Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/Register.css">
<style>
.navbar {

    overflow: hidden;
    background-color: grey;
    
   
}

.navbar a {
    float: left;
    font-size: 18px;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.dropdown {
    float: left;
    overflow: hidden;
}

.dropdown .dropbtn {
    font-size: 20px;    
    border: none;
    outline: none;
    color: black;
    padding: 14px 16px;
    background-color: inherit;
    font: inherit;
    margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
    background-color:;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style> 

</head>
<body style="background: url(images/Money1.jpg)">



<div class="header" >
<h2>Loan Approval System</h2>
</div>

<div class="navbar">
  <a href="loanrequests.jsp">Request Pending</a>
  
  <div class="dropdown">
    <button class="dropbtn"> Machine
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="trainmachine.jsp">Train Machine</a>
      <a href="loanstatus.jsp">Approve Applications</a>
    </div>
  </div> 
  
    	<a href="logout.jsp">Logout</a>
</div>

</body>
</html>
