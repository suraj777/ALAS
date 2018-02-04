<%@page import="dao.UserDao"%>
<%@page import="dto.User"%>
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
</head>

<body style="background: url(images/Money1.jpg)">
	<form action="finalController.jsp" method="post">
		<div class="header">
			<h1>Loan Application Detail</h1>
		</div>

		<div class="mid">
			<div class="mid1">.</div>
			<div class="mid2">

				<%
					User udo = new User();
					UserDao ud = new UserDao();
					udo = ud.getAllDetails(u);
					{
				%>
				<table class="table table-bordered">
					<tr>
						<th colspan="2"><h1 style="color: grey">LOAN DETAILS</h1></th>

					</tr>
					<tr>
						<th colspan="2"><h3 style="color: blue">Personal Details</h3></th>
					</tr>
					<tr>
						<td class="iconhead">First Name:</td>
						<td><%=udo.getFname()%></td>
					</tr>
					<tr>
						<td class="iconhead">Middle Name:</td>
						<td><%=udo.getMname()%></td>
					</tr>
					<tr>
						<td class="iconhead">Last Name:</td>
						<td><%=udo.getLname()%></td>
					</tr>
					<tr>
						<td class="iconhead">Gender:</td>
						<td><%=udo.getGender()%></td>
					</tr>
					<tr>
						<td class="iconhead">Date of birth:</td>
						<td><%=udo.getDob()%></td>
					</tr>
					<tr>
						<td class="iconhead">Address:</td>
						<td><%=udo.getAddress()%></td>
					</tr>
					<tr>
						<td class="iconhead">City:</td>
						<td><%=udo.getCity()%></td>
					</tr>
					<tr>
						<td class="iconhead">Pincode:</td>
						<td><%=udo.getPincode()%></td>
					</tr>
					<tr>
						<td class="iconhead">State:</td>
						<td><%=udo.getState()%></td>
					</tr>
					<tr>
						<td class="iconhead">Email Id:</td>
						<td><%=udo.getEmailid()%></td>
					</tr>
					<tr>
						<td class="iconhead">Mobile:</td>
						<td><%=udo.getMobileno()%></td>
					</tr>
					<tr>
						<th colspan="2">
							<h3 style="color: blue">Financial Details</h3>
						</th>
					</tr>
					<tr>
						<td class="iconhead">Nature of Occupation:</td>
						<td><%=udo.getNature_of_occupation()%></td>
					</tr>
					<tr>
						<td class="iconhead">Name of Organization:</td>
						<td><%=udo.getEmployer_Name()%></td>
					</tr>
					<tr>
						<td class="iconhead">Total Experience:</td>
						<td><%=udo.getTotal_Experience()%></td>
					</tr>
					<tr>
						<td class="iconhead">Designation:</td>
						<td><%=udo.getDesignation()%></td>
					</tr>
					<tr>
						<td class="iconhead">Yearly Income:</td>
						<td><%=udo.getYearly_Income()%></td>
					</tr>
					<tr>
						<td class="iconhead">Pan No:</td>
						<td><%=udo.getPan_No()%></td>
					</tr>
					<tr>
						<td class="iconhead">Own House:</td>
						<td><%=(udo.getHouse_cost() != 0.00) ? "Yes" : "No"%></td>
					</tr>
					<tr>
						<td class="iconhead">House Cost:</td>
						<td><%=udo.getHouse_cost()%></td>
					</tr>
					<tr>
						<td class="iconhead">Vehicle Type:</td>
						<td><%=(udo.getVeh_cost() >= 100000.00) ? "4 Wheeler" : "2 Wheeler"%></td>
					</tr>
					<tr>
						<td class="iconhead">Vehicle Cost:</td>
						<td><%=udo.getVeh_cost()%></td>
					</tr>
					<tr>
						<td class="iconhead">Vehicle Purchase Date:</td>
						<td><%=udo.getVeh_pur_date()%></td>
					</tr>
					<tr>
						<td class="iconhead">Fixed Deposit:</td>
						<td><%=(udo.getFd_cost() != 0.00) ? "Yes" : "No"%></td>
					</tr>
					<tr>
						<td class="iconhead">Fixed Deposit Amount:</td>
						<td><%=udo.getFd_cost()%></td>
					</tr>
					<tr>
						<td class="iconhead">Mobile No:</td>
						<td><%=udo.getMobileno()%></td>
					</tr>
					<tr>
						<th colspan="2"><h3 style="color: blue">Expenditure
								Details</h3></th>
					</tr>
					<tr>
						<td class="iconhead">Previous Loan:</td>
						<td><%=udo.getPrevious_Loan()%></td>
					</tr>
					<tr>
						<td class="iconhead">Previous Loan Amount:</td>
						<td><%=udo.getPrevious_Loan_Amount()%></td>
					</tr>
					<tr>
						<td class="iconhead">Previous Loan Duration (months):</td>
						<td><%=udo.getLoan_Duration()%></td>
					</tr>
					<tr>
						<td class="iconhead">Remaining Time Period:</td>
						<td><%=udo.getRemaining_Time_Period()%></td>
					</tr>
					<tr>
						<td class="iconhead">EMI:</td>
						<td><%=udo.getEmi()%></td>
					</tr>
					<tr>
						<td class="iconhead">Pending Amount:</td>
						<td><%=udo.getPrevious_Loan_Amount()%></td>
					</tr>
					<tr>
						<td class="iconhead">Yearly Expenditure (except loan):</td>
						<td><%=udo.getYearly_Expenditure()%></td>
					</tr>
					<tr>
						<th colspan="2"><h3 style="color: blue">Loan Application
								Details</h3></th>
					</tr>
					<tr>
						<td class="iconhead">Loan Type:</td>
						<td><%="Personal Loan"%></td>
					</tr>
					<tr>
						<td class="iconhead">Loan Amount Required:</td>
						<td><%=udo.getLoanAmount()%></td>
					</tr>
					<tr>
						<td class="iconhead">Loan Duration (months):</td>
						<td><%=udo.getLoanDuration()%></td>
					</tr>
					<tr>
						<td class="iconhead">Loan ROI:</td>
						<td><%="12.5%" %></td>
					</tr>
					<%} %>
					<tr>
						<!-- <td colspan="2" class="iconhead"><a href="loanstatus.jsp"
							class="btn btn-primary"> <span
								class="glyphicon glyphicon-chevron-left"></span>BACK
						</a></td> -->
						<td><a href="loanstatus.jsp" class="btn btn-primary">BACK</a></td>
					</tr>

				</table>

			</div>
			<div class="mid3">.</div>
			<div class="clr"></div>
		</div>
	</form>
</body>
</html>