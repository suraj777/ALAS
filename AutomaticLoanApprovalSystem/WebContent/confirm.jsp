<%@page import="java.util.ArrayList"%>
<%@page import="dto.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="u" class="dto.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
<%
if (session.getAttribute("user") == null)
	response.sendRedirect("userlogout.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Current Loan Status</title>
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


</style>
<script>
	function Confirmation() {
		return confirm('Do you really want to submit the form?');
	}
</script>
</head>
<body style="background: url(images/Money1.jpg)">
	<form action="finalController.jsp" method="post"
		onsubmit="return Confirmation(this)">
				<div class="header" >
<h2 >Loan Approval System</h2>
</div>

	<div>
		<nav class="navbar  navbar-fixedtop navbar-static-top"
			style="background-color:grey; color:#00004d">

		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp"
					style="font-size: 30px; color: #000;"> Confirm Your Details</a>
			</div>
			<ul class="nav navbar-nav">

			</ul>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="userhome.jsp" class="navfontsize menu" style="color:#000; font-size:large;
paddding-right:10px;">Home</a></li>
				<li><a href="personaldetails.jsp" class="navfontsize menu" style="color:#000; font-size:large;
paddding-right:10px;">New
						Loan</a></li>
				<li><a href="currentloanstatus.jsp" class="navfontsize menu" style="color:#000; font-size:large;
paddding-right:10px;">Current
						Status</a></li>

				<li><a href="userlogout.jsp" class="navfontsize" style="color:#000; font-size:large;
paddding-right:10px;">Logout</a></li>

			</ul>
		</div>
		</nav>
	</div>

		<div class="mid">
			<div class="mid1">.</div>
			<div class="mid2">

				<%
					//	User user = new User();
					UserDao ud = new UserDao();
					//	user=ud.getAllDetails(u);
					{
				%>
				<table class="table table-bordered">
					<tr>
						<th colspan="2"><h1 style="color: grey">Loan Status</h1></th>
					</tr>
					<tr>
						<th colspan="2"><h3 style="color: blue">Personal Details</h3></th>
					</tr>
					<tr>
						<td class="iconhead">First Name:</td>
						<td><%=u.getFname()%></td>
					</tr>
					<tr>
						<td class="iconhead">Second Name:</td>
						<td><%=u.getMname()%></td>
					</tr>
					<tr>
						<td class="iconhead">Last Name:</td>
						<td><%=u.getLname()%></td>
					</tr>
					<tr>
						<td class="iconhead">Gender:</td>
						<td><%=u.getGender()%></td>
					</tr>
					<tr>
						<td class="iconhead">Date of birth:</td>
						<td><%=u.getDob()%></td>
					</tr>
					<tr>
						<td class="iconhead">Address:</td>
						<td><%=u.getAddress()%></td>
					</tr>
					<tr>
						<td class="iconhead">City:</td>
						<td><%=u.getCity()%></td>
					</tr>
					<tr>
						<td class="iconhead">Pincode:</td>
						<td><%=u.getPincode()%></td>
					</tr>
					<tr>
						<td class="iconhead">State:</td>
						<td><%=u.getState()%></td>
					</tr>
					<tr>
						<td class="iconhead">Email Id:</td>
						<td><%=u.getEmailid()%></td>
					</tr>
					<tr>
						<td class="iconhead">Mobile:</td>
						<td><%=u.getMobileno()%></td>
					</tr>
					<tr>
						<th colspan="2"><h3 style="color: blue">Financial
								Details</h3></th>
					</tr>
					<tr>
						<td class="iconhead">Nature of Occupation:</td>
						<td><%=u.getNature_of_occupation()%></td>
					</tr>
					<tr>
						<td class="iconhead">Organization Name:</td>
						<td><%=u.getEmployer_Name()%></td>
					</tr>
					<tr>
						<td class="iconhead">Total Experience:</td>
						<td><%=u.getTotal_Experience()%></td>
					</tr>
					<tr>
						<td class="iconhead">Designation:</td>
						<td><%=u.getDesignation()%></td>
					</tr>
					<tr>
						<td class="iconhead">Yearly Income:</td>
						<td><%=u.getYearly_Income()%></td>
					</tr>
					<tr>
						<td class="iconhead">Pan No:</td>
						<td><%=u.getPan_No()%></td>
					</tr>
					<tr>
						<td class="iconhead">Own House:</td>
						<td><%=(u.getHouse_cost() != 0.00) ? "Yes" : "No"%></td>
					</tr>
					<tr>
						<td class="iconhead">House Cost:</td>
						<td><%=u.getHouse_cost()%></td>
					</tr>
					<tr>
						<td class="iconhead">Vehicle Type:</td>
						<td><%=(u.getVeh_cost() >= 100000.00) ? "4 Wheeler" : "2 Wheeler"%></td>
					</tr>
					<tr>
						<td class="iconhead">Vehicle Cost:</td>
						<td><%=u.getVeh_cost()%></td>
					</tr>
					<tr>
						<td class="iconhead">Vehicle Purchase Date:</td>
						<td><%=u.getVeh_pur_date()%></td>
					</tr>
					<tr>
						<td class="iconhead">Fixed Deposit:</td>
						<td><%=(u.getFd_cost() != 0.00) ? "Yes" : "No"%></td>
					</tr>
					<tr>
						<td class="iconhead">Fixed Deposit Amount:</td>
						<td><%=u.getFd_cost()%></td>
					</tr>
					<tr>
						<td class="iconhead">Mobile:</td>
						<td><%=u.getMobileno()%></td>
					</tr>
					<tr>
						<th colspan="2"><h3 style="color: blue">Expenditure</h3></th>
					</tr>
					<tr>
						<td class="iconhead">Previous Loan:</td>
						<td><%=u.getPrevious_Loan()%></td>
					</tr>
					<tr>
						<td class="iconhead">Previous Loan Amount:</td>
						<td><%=u.getPrevious_Loan_Amount()%></td>
					</tr>
					<tr>
						<td class="iconhead">Previous Loan Duration:</td>
						<td><%=u.getLoan_Duration()%></td>
					</tr>
					<tr>
						<td class="iconhead">Remaining Time Period:</td>
						<td><%=u.getRemaining_Time_Period()%></td>
					</tr>
					<tr>
						<td class="iconhead">EMI:</td>
						<td><%=u.getEmi()%></td>
					</tr>
					<tr>
						<td class="iconhead">Pending Amount:</td>
						<td><%=u.getPrevious_Loan_Amount()%></td>
					</tr>
					<tr>
						<td class="iconhead">Yearly Expenditure(except loan):</td>
						<td><%=u.getYearly_Expenditure()%></td>
					</tr>
					<tr>
						<th colspan="2"><h3 style="color: blue">Loan Application</h3></th>
					</tr>
					<tr>
						<td class="iconhead">Loan Type:</td>
						<td><%="Personal loan"%></td>
					</tr>
					<tr>
						<td class="iconhead">Loan Amount:</td>
						<td><%=u.getLoanAmount()%></td>
					</tr>
					<tr>
						<td class="iconhead">Loan Duration:</td>
						<td><%=u.getLoanDuration()%></td>
					</tr>
					<tr>
						<td class="iconhead">Loan ROI:</td>
						<td><%="12.5%"%></td>
					</tr>
					<%
						}
					%>
					<tr>
						<td><a href="loandetails.jsp" class="btn btn-primary">Back</a></td>
						<td><input type="submit" class="btn btn-info" value="Submit Application" /></td>
					</tr>

				</table>
			</div>
			<div class="mid3">.</div>
			<div class="clr"></div>
		</div>
	</form>
</body>
</html>