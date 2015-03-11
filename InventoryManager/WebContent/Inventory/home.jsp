<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
<head>
<SCRIPT type="text/javascript">
     window.history.forward();    
     function noBack() { window.history.forward(); } 
</SCRIPT>
<style type="text/css">@import url("<%=request.getContextPath() %>/Inventory/style.css");</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>INVENTORY MANAGEMENT</title>


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
							
							<h2 >WELCOME INVENTORY MANAGER</h2>


<p><h3><b>
                    Inventory management software is a computer-based system for tracking inventory levels, orders, sales and
deliveries.It can also be used in the manufacturing industry to create a work order, bill of materials and other production-
related documents. Companies use inventory management software to avoid product overstock and outages. It is a tool for
organizing inventory data that before was generally stored in hard-copy form or in spreadsheets. It is often associated with and is 
similar to distribution software.
</b></h2></pre></div>
						<div id="box2">
							
						</div>
						
						<br class="clear" />
					</div>
					<br class="clear" />
				</div>
			</div>
			<div id="copyright">
				&copy; Globe Telecom Services | All Rights Reserved</a>
			</div>
		</div>

</body>
</html>