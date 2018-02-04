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
<meta charset="UTF-8">
<title>Sign-Up/Login Form</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/Register.css" rel="stylesheet">
<script type="text/javascript">
	 function computeLoan() {
		var loanAmount = document.getElementById('loanAmount').value;
		var loanRate = document.getElementById('loanRate').value;
		var loanduration = document.getElementById('loanduration').value;
		var interest = ((loanAmount *(1+(loanRate * .01))) / (loanduration/12));
		  // toFixed is used for rounding the amount with two decimal places.
		var emi = ((loanAmount / loanduration) + interest).toFixed(2); 	
		var emi = emi.toString().replace(/\B(?=(\d{7})+(?!\d))/g, ",");
		document.getElementById('emi').innerHTML = +emi;
	}
	function alertFunction() {
		alert("Application Submitted Successfully");
		
	}
	</script>

</head>
<body style="background: url(images/Money1.jpg)">
	<div class="header" >
<h2 >Loan Approval System</h2>
</div>

	<div>
		<nav class="navbar  navbar-fixedtop navbar-static-top"
			style="background-color:grey; color:#00004d">

		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp"
					style="font-size: 30px; color: #000;">Loan Details</a>
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
			<div id="loan_application_form">
				<form action="confirm.jsp" method="post">
					<table class="table">
						<tr>
							<td class="tdlabel"><label> Loan Type:</label></td>
							<td><input type="text" name="loanType" class="form-control"
								value="Personal Loan" readonly="readonly" required="required"
								class="form-control"></td>
						</tr>

						<tr>
							<td class="tdlabel"><label>Loan Amount<span
									class="req">*</span></label></td>
							<td><input id="loanAmount" name="loanAmount" type="text"
								placeholder="e.g.250000" pattern="[0-9]{3,7}" required="required"
								class="form-control" onchange="computeLoan()" required
								autocomplete="off"></td>
						</tr>

						<tr>
							<td class="tdlabel"><label> Loan Duration<span
									class="req">*</span></label></td>
							<td><input id="loanduration" type="number"
								name="loanDuration" placeholder="e.g.24 Months" required="required"
								pattern="[1-9]{1,3}" class="form-control" min="1" max="120"
								value="1" required autocomplete="off" onchange="computeLoan()">
							</td>
						<tr>
							<td class="tdlabel"><label> Loan Rate<span
									class="req">*</span></label></td>
							<td><input id="loanRate" name="loanRate" value="12.5"
								class="form-control" onchange="computeLoan()"
								readonly="readonly"></td>
						</tr>

						<tr>
							<td class="tdlabel"><label> EMI<span class="req">*</span></label></td>
							<td><label>
									<h5 id="emi"></h5>
							</label></td>
						</tr>
						<tr>
							<td ><a href="expendituredetails.jsp" class="btn btn-primary">BACK</a></td>
							<td><input type="submit" class="btn btn-info" value="NEXT" /></td>
						</tr>
					</table>
				</form>
			</div>
			<script
				src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
			<script src="js/index.js"></script>
		</div>
		<div class="mid3">.</div>
		<div class="clr"></div>
	</div>
	<div class="progress">
		<div class="progress-bar progress-bar-striped active"
			role="progressbar" aria-valuenow="40" aria-valuemin="0"
			aria-valuemax="100" style="width: 75%">75%</div>
	</div>

</body>
</html>