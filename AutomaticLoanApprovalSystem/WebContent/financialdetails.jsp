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
<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="bootstrap.min.js"></script>
<link href="css/Register.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
	function ShowHideDiv() {
		var chkYes = document.getElementById("chkYes");
		var dvtext = document.getElementById("dvtext");
		dvtext.style.display = chkYes.checked ? "block" : "none";
	}
</script>
</head>
<body style="background: url(images/Money1.jpg)">
	<div class="header" >
<h2>Loan Approval System</h2>
</div>

	<div>
		<nav class="navbar  navbar-fixedtop navbar-static-top"
			style="background-color:grey; color:#00004d">

		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp"
					style="font-size: 30px; color: #000;"> Financial Details</a>
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
			<form action="expendituredetails.jsp" method="post">
				<table class="table tblmargin">
					<tr>
						<td class="tdlabel"><label> Nature of Occupation<span
								class="req">*</span>
						</label></td>
						<td class="tdlabel"><select class="form-control"
							name="nature_of_occupation" required="required">
								<option value="-1" selected>SELECT</option>
								<option value="Employee">EMPLOYEE</option>
								<option value="Business">BUSINESS</option>
						</select></td>
					</tr>

					<tr>
						<td class="tdlabel"><label> Organisation Name<span
								class="req">*</span></label></td>
						<td class="tdlabel"><input type="text"
							pattern="[a-z A-Z]{4,30}" name="employer_Name"
							class="form-control" placeholder="e.g.Amazon pvt ltd" required="required"/></td>
					</tr>

					<td class="tdlabel"><label> Designation<span
							class="req">*</span>
					</label></td>
					<td class="tdlabel"><select class="form-control"
						name="designation" id="exampleFormControlSelect1" required="required">
							<option value="-1" selected>SELECT</option>
							<option>MANAGER</option>
							<option>ENGINEER</option>
							<option>DOCTOR</option>
							<option>PROFESSOR</option>
							<option>OWNER</option>
					</select></td>

					<tr>
						<td class="tdlabel"><label>Total Experience<span
								class="req">*</span>
						</label></td>
						<td class="tdlabel"><input type="text" pattern="[0-9]{1,2}"
							name="total_Experience" class="form-control"
							placeholder="e.g. 4 " required="required"/></td>
					</tr>


					<tr>
					<tr>
						<td class="tdlabel"><label>Yearly Income<span
								class="req">*</span>
						</label></td>
						<td class="tdlabel"><input type="text" name="yearly_Income"
							pattern="[0-9]{4,7}" class="form-control"
							placeholder="e.g. 100000" required="required"/></td>
					</tr>


					<tr>
						<td class="tdlabel"><label>Pan Card No<span
								class="req">*</span>
						</label></td>
						<td class="tdlabel"><input type="text" name="pan_No"
							pattern="[A-Z0-9]{10}" class="form-control"
							placeholder="e.g.ABCDE1234C" required="required"/></td>
					</tr>

					<tr>
						<td class="tdlabel"><label>Own House<span class="req">*</span>
						</label>
						<td><label for="chkYes" class="radio-inline"> <input
								type="radio" id="chkYes" name="chk" onclick="ShowHideDiv()"
								value="Yes" /> Yes
						</label><label for="chkNo" class="radio-inline"> <input
								type="radio" id="chkNo" name="chk" onclick="ShowHideDiv()"
								value="No" />No
						</label></td>
					</tr>

					<tr>
						<td class="tdlabel"><label>House Cost<span
								class="req">*</span>
						</label></td>
						<td class="tdlabel"><input type="text" name="house_cost"
							pattern="[0-9]{3,9}" class="form-control"
							placeholder="e.g. 100000" /></td>
					</tr>

					<tr>
						<td class="tdlabel"><label>Vehicle Type<span
								class="req">*</span>
						</label></td>
						<td><input type="checkbox" name="vehicle_Type"
							value="two_wheeler" /> 2-Wheeler <input type="checkbox"
							name="vehicle_Type" value="four_wheeler" /> 4-Wheeler</td>
					</tr>


					<tr>
						<td class="tdlabel"><label>Vehicle Cost<span
								class="req">*</span>
						</label></td>
						<td class="tdlabel"><input type="text" name="veh_cost"
							pattern="[0-9]{4,8}" class="form-control"
							placeholder="e.g. 50000" required="required"/></td>
					</tr>


					<tr>
						<td class="tdlabel"><label>Vehicle Purchase Date<span
								class="req">*</span></label></td>
						<td class="tdlabel"><input type="date" name="veh_pur_date"
							class="form-control" required="required"/></td>
					</tr>

					<tr>
						<td class="tdlabel"><label> Fixed Deposit<span
								class="req">*</span></label></td>
						<td><label for="chkYes" class="radio-inline"> <input
								type="radio" id="chkYes" name="chk1" onclick="ShowHideDiv()"
								value="Yes" /> Yes
						</label> <label for="chkNo" class="radio-inline"> <input
								type="radio" id="chkNo" name="chk1" onclick="ShowHideDiv()"
								value="No" />No
						</label></td>
					</tr>

					<tr>
						<td class="tdlabel"><label>Fixed Deposit Amount<span
								class="req">*</span></label></td>
						<td class="tdlabel"><input type="text" pattern="[0-9]{4,8}"
							name="fd_cost" class="form-control" placeholder="e.g. 20000" /></td>
					</tr>

					<tr>
						<td><a href="personaldetails.jsp" class="btn btn-primary">BACK</a></td>
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
			aria-valuemax="100" style="width: 25%">25%</div>
	</div>
</body>
</html>