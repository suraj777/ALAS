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
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/Register.css" rel="stylesheet">
<script type="text/javascript">
	function ShowHideDiv() {
		var chkYes = document.getElementById("chkYes");
		var dvtext = document.getElementById("dvtext");
		dvtext.style.display = chkYes.checked ? "block" : "none";
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background: url(images/Money1.jpg)"">
		<div class="header" >
<h2>Loan Approval System</h2>
</div>

	<div>
		<nav class="navbar  navbar-fixedtop navbar-static-top"
			style="background-color:grey; color:#00004d">

		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp"
					style="font-size: 30px; color: #000;"> Expenditure Details</a>
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
			<form action="loandetails.jsp" method="post">
				<table class="table">
					<tr>
						<td class="tdlabel">Previous Loan<span class="req">*</span></td>
						<td><input type="radio" name="previous_Loan" value="Yes" />
							Yes <input type="radio" name="previous_Loan" value="No" /> No</td>
					</tr>

					<tr>
						<td class="tdlabel">Previous Loan Amount <span class="req">*</span></td>
						<td class="tdlabel"><input type="text"
							name="previous_Loan_Amount" id="address" pattern="[0-9]{3,7}"
							class="form-control" placeholder="e.g. 25000"></td>
					</tr>

					<tr>
						<td class="tdlabel">Previous Loan Duration <span class="req">*</span></td>
						<td class="tdlabel"><input type="number" min="1" max="120"
							pattern="[1-9]{1,2}" name="loan_Duration" class="form-control"
							placeholder="e.g. 24 Months" /></td>
					</tr>

					<tr>
						<td class="tdlabel">Remaining Time Period <span class="req">*</span></td>
						<td class="tdlabel"><input type="text"
							name="remaining_Time_Period" class="form-control"
							pattern="[1-9]{1,3}" placeholder="e.g. 24 Months" /></td>
					</tr>
					<tr>
						<td class="tdlabel">EMI <span class="req">*</span></td>
						<td class="tdlabel"><input type="text" pattern="[0-9]{3,6}"
							name="emi" class="form-control" placeholder="e.g. 2000" /></td>
					</tr>
					<tr>
						<td class="tdlabel">Pending Amount <span class="req">*</span></td>
						<td class="tdlabel"><input type="text" name="pending_Amount"
							pattern="[0-9]{3,6}" class="form-control"
							placeholder="e.g. 25000" /></td>
					</tr>
					<tr>
						<td class="tdlabel">Yearly Expenditure (except loan)<span
							class="req">*</span></td>
						<td class="tdlabel"><input type="text" pattern="[0-9]{3,6}"
							name="yearly_Expenditure" class="form-control"
							placeholder="e.g. 700000" required="required"/></td>
					</tr>

					<tr>
						<td ><a href="financialdetails.jsp" class="btn btn-primary">BACK</a></td>
						<td><input type="submit" class="btn btn-info" value="NEXT" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="mid3">.</div>
		<div class="clr"></div>
	</div>

	<div class="progress">
		<div class="progress-bar progress-bar-striped active"
			role="progressbar" aria-valuenow="40" aria-valuemin="0"
			aria-valuemax="100" style="width: 50%">50%</div>
		</div>
</body>
</html>