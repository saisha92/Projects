<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
window.history.forward();    
function noBack() { window.history.forward(); } 
function validate() {
	
	var idError = checkId();
	var nameError = checkName();
	var contactError = checkContact();
	var passError = checkPass();
	var ridError = checkRid();
	
}
function checkId() {
	var id = document.forms["myForm"]["code"].value;
	if (id==null||id=="")
	  {
	  document.getElementById("code_error").innerHTML = "Enter the Productcode";
	 
	return false;
	}
	else{
	document.getElementById("code_error").innerHTML = "";
	return true;}	
}
function checkName() {
	var name = document.forms["myForm"]["id"].value;
	if (name==""||name==null)
	  {
	  document.getElementById("id_error").innerHTML = "Enter your Productmodelid";
	 
	return false;
	}
	else{
	document.getElementById("id_error").innerHTML = "";
	return true;}	
}

function checkContact() {
	var name = document.forms["myForm"]["status"].value;
	if (name==""||name==null)
	  {
	  document.getElementById("status_error").innerHTML = "Enter your Productstatus";
	 
	return false;
	}
	else{
	document.getElementById("status_error").innerHTML = "";
	return true;}	
}



function checkPass()
{
var strng = document.forms["myForm"]["Order"].value;
   if (strng == null||strng=="") {
     
            document.getElementById("Order_error").innerHTML = "The order_id is not entered";
            return false;
         }
   
   else
   {
		document.getElementById("Order_error").innerHTML = "";
		return true;}	
}


function checkRid() {
	var rid = document.forms["myForm"]["name"].value;
	if (rid==null||rid=="")
	  {
	  document.getElementById("name_error").innerHTML = "Enter the ProductName";
	 
	return false;
	}
	else{
	document.getElementById("name_error").innerHTML = "";
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
							

<form name="myForm"  method="post" action="<%=request.getContextPath() %>/InventoryController" onsubmit='return formValidator()'>
<table align="center"><tr><td>Product Code</td><td><input type="text" id="code" name="Product_code" onblur="return checkId()" ></input><SPAN STYLE=color:red ID="code_error"></SPAN></td> </tr><br></br>
<tr><td>Productmodel Id:</td><td> <input type="text" id="id" name="Productmodel_id" onblur="return checkName()" ></input><SPAN STYLE=color:red ID="id_error"></SPAN><br></br></td> </tr>
<tr><td>Productmodel Status(Available/Allocated/Dispatched): </td><td><input type="text" id="status" name="Productmodel_status" onblur="return checkContact()"></input><SPAN STYLE=color:red ID="status_error"></SPAN><br></br></td> </tr>
<tr><td>Order Id:</td><td> <input type="text" id="Order" name="Order_id" onblur="return checkPass()"></input><SPAN STYLE=color:red ID="Order_error"></SPAN><br></br></td> </tr>
<tr><td>Productmodel Name: </td><td><input type="text" id="name" name="Productmodel_name" onblur ="return  checkRid()"></input><SPAN STYLE=color:red ID="name_error"></SPAN><br></br></td> </tr>

<input type='hidden' name='name' value="addstock">
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