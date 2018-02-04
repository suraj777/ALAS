<%@page import="dto.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AdminDao"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	if (session.getAttribute("admin") == null)
		response.sendRedirect("logout.jsp");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loan Requests</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/Register.css" rel="stylesheet">
<style>
.iconhead {
	font-family: Verdana, Geneva, sans-serif;
	font-size: larger;
	text-align: left;
	color: #3b3a30;
}
</style>
</head>
<body style="background: url(images/Money1.jpg)">
	<div class="header">
		<h2>Loan Request Details</h2>
	</div>

	<div class="mid">
		<div class="mid1">.</div>
		<div class="mid2">
			<table class="table table-condensed table-hover">
				<thead>
					<tr>
						<th colspan="6"><h2 style="text-align: center; color: blue">
								Loan Requests</h2>
						</th>
					</tr>
					<tr>
						<th>User Id</th>
						<th>Loan Type</th>
						<th>Loan Amount</th>
						<th>Loan Duration</th>
						<th>Rate of interest</th>
					</tr>
				</thead>
				<tbody>
					<%
						AdminDao afd = new AdminDao();
						ArrayList<User> list = afd.getLoanDetails();
						for (User la : list) {
					%>
					<tr>
						<td class="iconhead"><%=la.getUserId()%></td>
						<td class="iconhead"><%=la.getLoanType()%></td>
						<td class="iconhead"><%=la.getLoanAmount()%></td>
						<td class="iconhead"><%=la.getLoanDuration()%></td>
						<td class="iconhead"><%=la.getLoanRate()%></td>
						<%
							}
						%>
					</tr>
					<tr>
						<!-- <td colspan="5" class="iconhead"><a href="adminhome.jsp"
							class="btn btn-primary"> <span
								class="glyphicon glyphicon-chevron-left"></span>BACK
						</a></td> -->
						<td><a href="adminhome.jsp" class="btn btn-primary">BACK</a></td>

					</tr>
				</tbody>
			</table>

		</div>
		<div class="mid3">.</div>
		<div class="clr"></div>
	</div>
</body>
</html>