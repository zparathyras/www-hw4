<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="myPackage.orders,java.util.List,myPackage.Customer"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Customer Orders</title>
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
		Customer Session_customer = (Customer)session.getAttribute("ses_customer");
		List<orders> customerOrders = (List<orders>)request.getAttribute("customerOrders");
	%>
	<br>
	<div class="table_container">
		<table class="responsive-table">
			<thead>
				<tr>
					<th scope="col">Ημερομηνία και ώρα</th>
					<th scope="col">Κωδ. Παραγγελίας</th>
					<th scope="col">Κατάστημα</th>
					<th scope="col">Προϊόντα</th>
					<th scope="col">Συνολικό κόστος</th>
					
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0;i<customerOrders.size();i++) {
						orders order = customerOrders.get(i); 
				%>
				<tr> 
					<th scope="row"><%= order.getDate() %></th>
					<td data-title="Κωδ. Παραγγελίας"><%= order.getOrderID() %></td>
					<td data-title="Κατάστημα"><%= order.getStore_name() %></td>
					<td data-title="Προϊόντα"><%= order.getFood_items()%></td>
					<td data-title="Συνολικό κόστος"><%= order.getCost_sum() %></td>
				</tr>
				<%     
					}
				%>
			</tbody>
		</table>
	</div>
	<form class="my-form1" action="redirect_to_CustomerProfile">
		<div class="submit">
			<input type="submit" value="Επιστροφή στο προφίλ">
		</div>
	</form>
</body>
</html>