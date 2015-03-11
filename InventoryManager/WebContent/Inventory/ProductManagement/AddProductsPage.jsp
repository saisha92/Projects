<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
window.history.forward();    
function noBack() { window.history.forward(); } 

function validate() {
	
	var idError = checkId();
	var nameError = checkName();
	var contactError = checkContact();
	var passError = checkPass();
	var ridError = checkRid();
	var thresh=threshold();
	if(idError==0||nameError==0||contactError==0||passError==0||ridError==0||thresh==0)
	{
		return false;
	}
	else return true;
}
function checkId() {
	var id = document.forms["myForm"]["feat"].value;
	if (id==null||id=="")
	  {
	  document.getElementById("Productmodel_Features_error").innerHTML = "Enter your ProductmodelFeatures";
	 
	return false;
	}
	else{
	document.getElementById("Productmodel_Features_error").innerHTML = "";
	return true;}	
}
function checkName() {
	var name = document.forms["myForm"]["name"].value;
	if (name==""||name==null)
	  {
	  document.getElementById("Name_error").innerHTML = "Enter your ProductmodelName";
	 
	return false;
	}
	else{
	document.getElementById("Name_error").innerHTML = "";
	return true;}	
}

function checkContact() {
	var name = document.forms["myForm"]["price"].value;
	if (name==""||name==null)
	  {
	  document.getElementById("Productmodel_Price_error").innerHTML = "Enter your ProductmodelPrice";
	 
	return false;
	}
	else{
	document.getElementById("Productmodel_Price_error").innerHTML = "";
	return true;}	
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


function checkRid() {
	var rid = document.forms["myForm"]["Des"].value;
	if (rid==null||rid=="")
	  {
	  document.getElementById("Description_error").innerHTML = "Enter the model Description";
	 
	return false;
	}
	else{
	document.getElementById("Description_error").innerHTML = "";
	return true;}	
}
function checkid() {
	var id = document.forms["myForm"]["feat"].value;
	if (rid==null||rid=="")
	  {
	  document.getElementById("Productmodel_Features_error").innerHTML = "Enter the model Features";
	 
	return false;
	}
	else{
	document.getElementById("Productmodel_Features_error").innerHTML = "";
	return true;}	
}
function threshold() {
	var rid = document.forms["myForm"]["Threshold"].value;
	if (rid==null||rid=="")
	  {
	  document.getElementById("threshold_error").innerHTML = "Enter the Threshold limit";
	 
	return false;
	}
	else{
	document.getElementById("threshold_error").innerHTML = "";
	return true;}	
}

</script>
<head>
<style type="text/css">@import url("<%=request.getContextPath() %>/Inventory/style.css");</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADDING THE PRODUCT</title>


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
							
							<h2 align="center">ADDING THE PRODUCT</h2>
							
<form  name="myForm" method="post" action="<%=request.getContextPath() %>/InventoryController" onsubmit="return validate()">
<table align="center"><tr><td>Productmodel_ID:<font color="red"><sup>*</sup></td><td><input type="text"  id="id" name="Productmodel_ID" onblur="return checkPass()" ></input><SPAN STYLE=color:red ID="ID_error"></SPAN></td> </tr>
<tr><td>Product Name:<font color="red"><sup>*</sup></td><td> <input type="text" id="name" name="Productmodel_Name" onblur="return checkName()"></input><SPAN STYLE=color:red ID="Name_error"></SPAN></td> </tr>
<tr><td>Product Description:<font color="red"><sup>*</sup> </td><td><input type="text" id="Des" name="Productmodel_Description" onblur="return checkRid()"></input><SPAN STYLE=color:red ID="Description_error"></SPAN></td> </tr>
<tr><td>Product Features:<font color="red"><sup>*</sup></td><td> <input type="text"   id="feat" name="Productmodel_Features" onblur="return checkId()"></input><SPAN STYLE=color:red ID="Productmodel_Features_error"></SPAN></td> </tr>
<tr><td>Product Price:<font color="red"><sup>*</sup> </td><td><input type="text"  id="price" name="Productmodel_Price" onblur="return checkContact()"></input><SPAN STYLE=color:red ID="Productmodel_Price_error"></SPAN></td> </tr>
<tr><td>Product Threshold:<font color="red"><sup>*</sup></td><td> <input type="text" id="Threshold" name="Productmodel_Threshold" onblur="return threshold()" ></input><SPAN STYLE=color:red ID="threshold_error"></SPAN></td> </tr>

<tr><td> </td>

<td><input  type="submit"  value="submit"  align="center"></input></td></tr></table>
<br></br>
<br></br>
<font color="red"><sup>*</sup>Fields Mandatory </font>
<input type="hidden" name="name" value="addproduct">
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
				&copy; Globe Telecom Services | AllRightsReserved</a>
			</div>
		</div>

</body>
</html>