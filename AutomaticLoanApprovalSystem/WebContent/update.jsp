<%@page import="java.util.ArrayList"%>
<%@page import="dto.Admin"%>
<%@page import="dao.AdminDao"%>
<%@page import="dto.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("admin") == null)
		response.sendRedirect("logout.jsp");
%>
<jsp:useBean id="u" class="dto.User"></jsp:useBean>
<jsp:setProperty property="userId" name="u" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Detail</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/Register.css" rel="stylesheet">
<style>
.iconhead {
	font-family: Verdana, Geneva, sans-serif;
	font-size: larger;
	font-weight: bold;
	text-align: left;
	color: #000;
	width: 30%;
	border: 2px solid #000;
	align: left;
}

th {
	text-align: center;
	color: #3e4444;
}
</style>

<title>Update</title>
</head>
<body style="background: url(images/Money1.jpg)">
	<form action="updateController.jsp" method="post">
		<div class="header">
			<h1>Update Loan Status</h1>
		</div>

		<div class="mid">
			<div class="mid1">.</div>
			<div class="mid2">

				<%
					UserDao afd = new UserDao();
					User usr = afd.getLoanDetailsbyId(u.getUserId());
				%>
				<table class="table table-bordered">
					<tr>
						<th colspan="2"><h1 style="color: grey">LOAN DETAILS</h1></th>

					</tr>
					<tr>
						<th colspan="2"><h3 style="color: blue">Loan Details</h3></th>
					</tr>
					<tr>
						<td class="iconhead">User Id:</td>
						<td><input type="text" name="userId" readonly="readonly"
							 class="form-control"
							value="<%=usr.getUserId()%>" /></td>
					</tr>
					<tr>
						<td class="iconhead">Loan Type:</td>
						<td><input type="text" name="loanType" readonly="readonly"
							class="form-control"
							value="<%=usr.getLoanType()%>" /></td>
					</tr>
					<tr>
						<td class="iconhead">Loan Amount:</td>
						<td><input type="text" name="loanAmount" readonly="readonly"
							class="form-control"
							value="<%=usr.getLoanAmount()%>" /></td>
					</tr>
					<tr>
						<td class="iconhead">Loan Duration:</td>
						<td><input type="text" name="loanDuration"
							readonly="readonly" class="form-control"
							value="<%=usr.getLoanDuration()%>" /></td>
					</tr>
					<tr>
						<td class="iconhead">Loan ROI:</td>
						<td><input type="text" name="loanRate" readonly="readonly"
							class="form-control"
							value="<%=usr.getLoanRate()%>" /></td>
					</tr>
					<tr>
						<td class="iconhead">Loan Status:</td>
						<td><input type="text" name="loanStatus" class="form-control"
							value="<%=usr.getLoanStatus()%>" /></td>
					</tr>
					<tr>
						<%-- <td><a href="loanstatus.jsp?userId=<%=usr.getUserId() %>" >Back</a></td>
						<td><a href="updateController.jsp?userId=<%=usr.getUserId() %>" >Update</a></td> --%>
						<td><a href="loanstatus.jsp" class="btn btn-primary">BACK</a></td>
						<td><input type="submit" class="btn btn-info" value="Update"/></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>