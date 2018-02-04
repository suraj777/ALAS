<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:useBean id="u" class="dto.User" scope="session" ></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
if(session.getAttribute("user")==null)
	response.sendRedirect("userlogout.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserLogin</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/Register.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
					style="font-size: 30px; color: #000;"> Personal Details</a>
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
			<form action="financialdetails.jsp" method="post"
				onSubmit="return(validate());" class="formData">
				<table class="table">


					<tr>
						<td class="tdlabel">Name</td>
						<td class="tdlabel"><input type="text" id="textname" pattern="[a-zA-Z]{1,30}" name="fname" size="30"
							class="form-control" placeholder=" FIRST" style="width: 92%;" required="required"></td>
						<td class="tdlabel"><input type="text" id="textname" pattern="[a-zA-Z]{1,30}" name="mname" size="30"
							class="form-control f2" placeholder="MIDDLE" required="required"
							style="width: 92%;"></td>
						<td class="tdlabel"><input type="text" id="textname" pattern="[a-zA-Z]{1,30}" name="lname" size="30"
							class="form-control f2" placeholder="LAST" required="required"
							style="width: 92%;"></td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<td class="tdlabel">Gender</td>
						<td ><input type="radio" name="gender" value="Male"
							class="radio-inline"> Male <input type="radio"
							name="gender" value="Female" class="radio-inline"> Female</td>
					</tr>
					<tr>
						<td class="tdlabel">Date Of Birth</td>
						<td class="tdlabel"><input required="required" type="date" name="dob" id="dob" size="30"
							class="form-control"></td>
					</tr>
					<tr>
						<td class="tdlabel">Permanent Address</td>
						<td class="tdlabel"><textarea class="form-control" name="address" rows="5" required="required"
								id="address" resize="false" placeholder="e.g. CDAC kharghar near bharti vidyapeeth"></textarea></td>
					</tr>
					<tr>
						<td class="tdlabel">City</td>
						<td class="tdlabel"><select name="city" class="form-control" >
								<option value="-1" selected>SELECT</option>
								<option value="Pune">PUNE</option>
								<option value="Navi mumbai">NAVI MUMBAI</option>
								<option value="Nashik">NASHIK</option>
								<option value="Satara">SATARA</option>
								<option value="Pandharpur">PANDHARPUR</option>
						</select></td>
					</tr>
					<tr>
						<td class="tdlabel">PinCode</td>
						<td class="tdlabel"><input type="text" name="pincode" pattern="[0-9]{6}" id="pincode" size="30"
							class="form-control" placeholder="e.g. 400614" required="required"></td>
					</tr>
					<tr>
						<td class="tdlabel">State</td>
						<td class="tdlabel"><select Name="state" class="form-control">
								<option value="-1" selected>SELECT</option>
								<option value="Maharashtra">MAHARASHTRA</option>
								<option value="Goa">GOA</option>
						</select></td>
					</tr>
					<tr>
						<td class="tdlabel">EmailId</td>
						<td class="tdlabel"><input type="text" name="emailid" id="emailid" pattern="[a-z0-9._]+@[a-z]+\.[a-z]{2,3}" size="30"
							class="form-control" placeholder="e.g. cdac@cdac.in" required="required"></td>
					</tr>

					<tr>
						<td class="tdlabel">MobileNo</td>
						<td class="tdlabel"><input type="text" name="mobileno" id="mobileno"
							size="30" class="form-control" pattern="[0-9]{10}" placeholder="e.g. 9876543210" required="required"></td>
					</tr>
					<tr>
						<!-- <td><a href="userhome.jsp" class="btn btn-primary"><span
								class="glyphicon glyphicon-chevron-left"></span>BACK</a></td>
						<td><a href="financialdetails.jsp" class="btn btn-info">NEXT<span
								class="glyphicon glyphicon-chevron-right"></span></a></td> -->
					
						<td ><a  href="userhome.jsp" class="btn btn-primary">BACK</a></td>
						<td><input type="submit" class="btn btn-info" value="NEXT" /></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="mid3">.</div>
		<div class="clr"></div>
	</div>
	
</body>
</html>