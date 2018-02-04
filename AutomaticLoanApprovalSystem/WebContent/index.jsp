<%@page import="dto.User" %>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="css/style.css">
  
</head>

<body style="background-image:url('images/Money1.jpg')">
<div class="header">
<h2>Loan Approval System</h2>
</div>
  <div class="form">
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h2>Registration Form</h2>
          
          <form action="registerController.jsp" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" name="fname" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" name="lname" required autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Email Id<span class="req">*</span>
            </label>
            <input type="email" name="emailid" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Username<span class="req">*</span>
            </label>
            <input type="text" name="userName" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Set a password<span class="req">*</span>
            </label>
            <input type="password" name="userPass" required autocomplete="off"
            	onchange="form.reUserPass.pattern = this.value;" pattern="{6,}"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Re-enter password<span class="req">*</span>
            </label>
            <input type="password" name="reUserPass" required autocomplete="off" pattern="{6,}"/>
          </div>
          
          <button type="submit" class="button button-block">Get Started</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h2>Welcome Back!</h2>
          
          <form action="uservalidateController.jsp" method="post">
          
            <div class="field-wrap">
            <label>
              Username<span class="req">*</span>
            </label>
            <input type="text" name="userName" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="userPass" required autocomplete="off"/>
          </div>
          
          <p class="small-login"><a href="adminlogin.jsp">Admin Login</a></p>
          
          <button class="button button-block">Log In</button>
          
          </form>

        </div>
      </div><!-- tab-content -->
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script  src="js/index.js"></script>
</body>

</html>
