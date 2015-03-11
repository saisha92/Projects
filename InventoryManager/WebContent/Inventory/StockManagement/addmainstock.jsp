<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
window.history.forward();    
function noBack() { window.history.forward(); } 
function validate() {
	var id = checkid();
	var quantity = checkquant();
	if(id==0||quantity==0)
	{
		return false;
	}
	else return true;
}
function checkid()
{
var strng = document.forms["myForm"]["Productmodel_id"].value;
   if (strng == null||strng=="") {
     
            document.getElementById("iderror").innerHTML = "The id is not entered";
            return false;
         }
   
   else
   {
		document.getElementById("iderror").innerHTML = "";
		return true;}	
}
function checkquant()
{
var strng = document.forms["myForm"]["Quantity"].value;
   if (strng == null||strng=="") {
     
            document.getElementById("quanterror").innerHTML = "The quantity is not entered";
            return false;
         }
   
   else
   {
		document.getElementById("quanterror").innerHTML = "";
		return true;}	
}

</script>
<style type="text/css">@import url("<%=request.getContextPath() %>/Inventory/style.css");</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADDING THE STOCK</title>
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
					<div id="search">
						
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
							<h2 align="center">ADDING THE STOCK</h2>
							

<form name="myForm" onsubmit="return validate()" method="post" action="<%=request.getContextPath() %>/InventoryController" >
<table align="center"><tr><td>Product Model Id:<font color="red"><sup>*</sup></font> </td><td><input onblur="return checkid()" type="text"  name="Productmodel_id" id="Productmodel_id" ><SPAN STYLE=color:red ID="iderror"></SPAN></input></td> </tr>
<tr><td>Quantity :<font color="red"><sup>*</sup></font> </td><td> <input type="text" onblur="return checkquant()" name="Quantity" id="Quantity"  ><SPAN STYLE=color:red ID="quanterror"></SPAN></input></td> </tr>

<input type='hidden' name='name' value="addmainstock">
<tr><td> </td>

<td><input type="submit" value="submit"  align="justify"></input></td></tr></table>
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
				&copy; Globe telecom Services | All Rights Reserved
			</div>
		</div>


</body>
</html>