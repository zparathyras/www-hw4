<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="myPackage.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Delivery or Dine</title>
	<link rel="stylesheet" href="style/choose.css">
</head>
<body>

	<%
		Customer Session_customer = (Customer)session.getAttribute("ses_customer");
	%>
	
	<header id="mainHeader">
		<div class="container">
			<h1>Deli & Dine</h1>
		</div>
	</header>
	
	<div id="desc" class="customer_desc">

		<h2>Καλωσόρισες: <%= Session_customer.getFname()%></h2>
		<h4><%= Session_customer.getAddress()%></h4>
	</div>
	
	<form class="my-form1" action="find_stores_for_delivery">
		<div class="submit">
			<input type="submit" value="Delivery">
		</div>
	</form>
	<form class="my-form2" action="redirect_to_dine">
		<div class="submit">
			<input type="submit" value="Reservation">
		</div>
	</form>
</body>
</html>