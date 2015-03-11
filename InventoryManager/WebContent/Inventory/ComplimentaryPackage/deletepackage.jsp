l<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script type="text/javascript">
function validate() {
	var passError = checkPass();
	if(passError==0)
		return false;
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
}


</script>
<head>
<style type="text/css">@import url("<%=request.getContextPath() %>/Inventory/style.css");</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DELETING THE PRODUCT</title>


</head>
<body>

<div id="bg">
			<div id="outer">
				<div id="header">
					<div id="logo">
						<h1>
							<a href="#">Globe Telecom Services</a>
						</h1>
					</div>
					<div id="search">
						
					</div>
					<div id="nav">
						<ul>
							<li class="first active">
								<a href="#">Home</a>
							</li>
							<li>
								<a href="#">About Us</a>
							</li>
							<li>
								<a href="#">Smart Phones</a>
							</li>
							<li>
								<a href="#">SIM Card</a>
							</li>
							<li>
								<a href="#">Accessories</a>
							</li>
							
						<li class="last">
								<a href="#">Contact</a>
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
							
							<h2 >DELETING THE PRODUCT</h2>
<form name="myForm" method="post" action="<%=request.getContextPath() %>/InventoryController" >
Package ID:<font color="red"><sup>*</sup> </font><input type="text" id="id" name="package_id" onblur="return checkPass()"></input><SPAN STYLE=color:red ID="ID_error"></SPAN><br></br>
<input type='hidden' name='name' value="deletepackage">
<input type="submit" value="Delete" onclick="return validate()"></input>
<br></br>
<br></br>
<font color="red"><sup>*</sup>Fields Mandatory </font>
</form>
</div>
						<div id="box2">
							
						</div>
						
						<br class="clear" />
					</div>
					<br class="clear" />
				</div>
			</div>
			<div id="copyright">
				&copy; Globe Telecom Services |  AllRightsReserved</a>
			</div>
		</div>

</body>
</html>