<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="myPackage.orders,java.util.List,myPackage.Store"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Store Orders</title>
	<link rel="stylesheet" href="style/storeProf.css">
	<link rel="stylesheet" href="style/table.css">
</head>
<body>
	<header id="mainHeader">
		<div class="container">
			<h1>Deli & Dine</h1>
		</div>
	</header>
	<%
		Store session_store = (Store)session.getAttribute("ses_store");
		List<orders> storedOrders = (List<orders>)request.getAttribute("storedOrders");
	%>
	<br>
	<div class="table_container">
		<table class="responsive-table">
			<thead>
				<tr>
					<th scope="col">Ημερομηνία και ώρα</th>
					<th scope="col">Κωδ. Παραγγελίας</th>
					<th scope="col">Προϊόντα</th>
					<th scope="col">Συνολικό κόστος</th>
					<th scope="col">Διεύθυνση</th>
					<th scope="col">Κουδούνι</th>
					<th scope="col">Όροφος</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0;i<storedOrders.size();i++) {
						orders order = storedOrders.get(i); 
				%>
				<tr> 
					<th scope="row"><%= order.getDate() %></th>
					<td data-title="Κωδ. Παραγγελίας"><%= order.getOrderID() %></td>
					<td data-title="Προϊόντα"><%= order.getFood_items()%></td>
					<td data-title="Συνολικό κόστος"><%= order.getCost_sum() %></td>
					<td data-title="Διεύθυνση"><%= order.getCustomer_address() %></td>
					<td data-title="Κουδούνι"><%= order.getCustomer_buzzer() %></td>
					<td data-title="Όροφος"><%= order.getCustomer_floor() %></td>
				</tr>
				<%     
					}
				%>
			</tbody>
		</table>
	</div>
	
	<form class="my-form1" action="redirect_to_StoreProfile">
		<div class="submit">
			<input type="submit" value="Επιστροφή στο προφίλ">
		</div>
	</form>
</body>
</html>