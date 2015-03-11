<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
window.history.forward();    
function noBack() { window.history.forward(); }
 function validate() {
    		var passError = checkPass();
    		if(passError==0)
    		{
        		return false;
    		}
    		else return true;
    	}
    	function checkPass()
    	{
    	var strng = document.forms["myForm"]["id"].value;
    	   if (strng == null||strng=="") {
    	     
    	            document.getElementById("ID_error").innerHTML = "The id is not entered";
    	            return false;
    	         }
    	   
    	   else
    	   {
    			document.getElementById("ID_error").innerHTML = "";
    			return true;}	
    	}</script>
<style type="text/css">@import url("<%=request.getContextPath() %>/Inventory/style.css");</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Stock</title>
</head>
<body onload="noBack();"   
  onpageshow="if (event.persisted) noBack();" onunload="">
<div id="bg">
			<div id="outer">
				<div id="header">
					<div id="logo">
						<h1>
							<a href="#">Globe Telecom Services</a>
						</h1>
					</div>
					<div id="search">
						<img src="/InventoryManager/Inventory/images/logo.png" height="100" width="300"></img>
						
					</div>
					<div id="nav">
						<ul>
							<li class="first active">
								<a href="<%=request.getContextPath() %>/Inventory/home.jsp">Home</a>
							</li>
							<li>
								<a href="#">SMART PHONES</a>
							</li>
							<li>
								<a href="#">SIM CARDS</a>
							</li>
							<li>
								<a href="#">ACCESSORIES</a>
							</li>
							<li>
								<a href="#">CONTACT US</a>
							</li>
							<li>
								<a href="#">LOGOUT</a>
							</li>
						
						</ul>
						<br class="clear" />
					</div>
				</div>
				<div id="banner">
					<img src="/InventoryManager/Inventory/images/pic1.jpg" width="932" height="172" alt="" />
				</div>
				<div id="main">
					<div id="sidebar">
						<h3>
							Operations
						</h3>
					<ul class="linkedList">
							<li class="first">
								<a href="<%=request.getContextPath() %>/Inventory/ProductManagement/producthome.jsp">Product Management</a>
							</li>
							<li>
								<a href="<%=request.getContextPath() %>/Inventory/StockManagement/stockhome.jsp">Stock Management</a>
							</li>
							<li>
								<a href="<%=request.getContextPath() %>/Inventory/ComplimentaryPackage/complimenthome.jsp"">ComplimentaryPackages</a>
							</li>
						</ul>
						
					</div>
					<div id="content">
						<div id="box1">
							<h2>
								<center>Welcome to Globe Telecom Services</center>
							</h2>
						<form name="myForm" method="post" action="<%=request.getContextPath() %>/InventoryController">
Enter Model ID:<font color="red"><sup>*</sup></font> <input type="text" name="id" onblur="return checkPass()"><SPAN STYLE=color:red ID="ID_error"></SPAN></input><br></br>
<input type='hidden' name='name' value="searchstock">
<input type="submit" value="Search"></input>
</form>
<br></br>
<br></br>
<font color="red"><sup>*</sup>Fields Mandatory </font>
						</div>
						<div id="box2">
						</div>
						
						<br class="clear" />
					</div>
					<br class="clear" />
				</div>
			</div>
			<div id="copyright">
				&copy; GLOBE TELECOM SERVICES | All Rights Reserved
			</div>
		</div>


</body>
</html>