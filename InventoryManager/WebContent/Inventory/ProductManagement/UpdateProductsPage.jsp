<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@page import="com.inventory.controller.*"%>
<%@page import="com.inventory.dao.*"%>
<%@page import="com.inventory.model.*"%>
<html>
<head>
<SCRIPT type="text/javascript">
     window.history.forward();    
     function noBack() { window.history.forward(); } 
</SCRIPT>
<style type="text/css">@import url("<%=request.getContextPath() %>/Inventory/style.css");</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product</title>
<script>

</script>
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
					</div><div id="search">
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
<form action="<%=request.getContextPath()%>/InventoryController" method="post" >
<%
	Product pObj = (Product)request.getSession().getAttribute("Product");
%>
<center>
Productmodel_ID: <input type="text" name="Productmodel_ID"0 value="<%=pObj. getProductmodel_ID()%>" ></input><br></br>
Productmodel_Name: <input type="text" name="Productmodel_Name" value="<%=pObj. getProductmodel_Name()%>" ></input><br></br>
Productmodel_Description: <input type="text" name="Productmodel_Description" value="<%=pObj.getProductmodel_Description()%>" ></input><br></br>
Productmodel_Features: <input type="text" name="Productmodel_Features" value="<%=pObj.getProductmodel_Features()%>" ></input><br></br>
Productmodel_Price: <input type="text" name="Productmodel_Price" value="<%=pObj.getProductmodel_Price()%>"></input><br></br>
Productmodel_Threshold: <input type="text" name="Productmodel_Threshold" value="<%=pObj.getProductmodel_Threshold()%>" ></input><br></br>

<input type='hidden' name='name' value="updateproduct">
<input type="submit" value="submit" >
<br></br>
<br></br>
<font color="red"><sup>*</sup>Fields Mandatory </font>


</center>
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