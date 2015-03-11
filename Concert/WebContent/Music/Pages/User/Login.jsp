<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>User Login</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/Music/images/favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Music/js/loginstyle.css" />
		<script src="<%=request.getContextPath() %>/Music/js/modernizr.custom.63321.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    </head>
 <BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
        <div class="container">
			<header>
				<h1><center> <strong>USER LOGIN</strong></center></h1>
			</header>
			<section class="main">
				<form class="form-1" id="loginform" name="myForm" method="post" action="<%=request.getContextPath() %>/MusicControl">
					<p class="field">
						<input type="text" name="login" placeholder="Username or email">
						<i class="icon-user icon-large"></i>
					</p>
						<p class="field">
							<input type="password" name="password" placeholder="Password">
							<i class="icon-lock icon-large"></i>
					</p>
					<p class="submit">
						<button type="submit" name="submit"><i class="icon-arrow-right icon-large"></i></button>
					</p>
					<p>Not a Member?  <a href = <%=request.getContextPath()%>/Music/Pages/User/usersignup.jsp>Sign Up Now</a></p>
					<input type="hidden" name="action" value="login"></input>
					</form>				
			</section>
        </div>
     
    </body>
</html>