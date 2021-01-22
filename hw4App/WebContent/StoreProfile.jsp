<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="myPackage.Store" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Store Profile</title>
	<link rel="stylesheet" href="style/storeProf.css">
</head>
<body>
	<header id="mainHeader">
		<div class="container">
			<h1>Deli & Dine</h1>
		</div>
	</header>
	
	<%
		Store session_store = (Store)session.getAttribute("ses_store");
	%>
	
	<div id="desc" class="store_desc">

		<h2>Καλωσόρισες: <%= session_store.getSname()%></h2>
		<h4><%= session_store.getAddress()%></h4>
	</div>
	
	<form class="my-form1" action="redirect_to_addProduct">
		<div class="submit">
			<input type="submit" value="Πρόσθεσε νέο προϊόν">
		</div>
	</form>
	
	<form class="my-form1" action="getStoreProducts">
		<input type="hidden" name="sname" value="<%=session_store.getSname()%>">
		<div class="submit">
			<input type="submit" value="Δές όλα τα αποθηκευμένα προίόντα">
		</div>
	</form>
	<form class="my-form1" action="getOrders_for_Store">
		<input type="hidden" name="storeID" value="<%=session_store.getId()%>">
		<div class="submit">
			<input type="submit" value="Δές όλες τις παραγγελίες">
		</div>
	</form>
	<form id="logout" class="my-form" action="Logout">
		<div class="submit">
			<input type="submit" value="Έξοδος/Αποσύνδεση">
		</div>
	</form>
	
</body>
</html>