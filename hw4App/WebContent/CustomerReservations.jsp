<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="myPackage.reservations,java.util.List,myPackage.Customer"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Customer Reservations</title>
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
		List<reservations> cReservations = (List<reservations>)request.getAttribute("cReservations");
	%>
	<br>
	<div class="table_container">
		<table class="responsive-table">
			<thead>
				<tr>
					<th scope="col">Κατάστημα</th>
					<th scope="col">Ημερομηνία και ώρα δήλωσης</th>
					<th scope="col">Κωδ. Κράτησης</th>
					<th scope="col">Ημερομηνία κράτησης</th>
					<th scope="col">Ώρα κράτησης</th>
					<th scope="col">Αριθμός ατόμων</th>
					
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0;i<cReservations.size();i++) {
						reservations res = cReservations.get(i); 
				%>
				<tr> 
					<th scope="row"><%= res.getStore_name() %></th>
					<td data-title="Ημερομηνία και ώρα δήλωσης"><%= res.getDate() %></td>
					<td data-title="Κωδ. Κράτησης"><%= res.getResID() %></td>
					<td data-title="Ημερομηνία κράτησης"><%= res.getResDate() %></td>
					<td data-title="Ώρα κράτησης"><%= res.getResTime() %></td>
					<td data-title="Αριθμός ατόμων"><%= res.getPersons() %></td>
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