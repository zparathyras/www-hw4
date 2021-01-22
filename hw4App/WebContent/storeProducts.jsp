<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="myPackage.food,java.util.List,myPackage.Store"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Store Products</title>
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
		List<food> storedFoods = (List<food>)request.getAttribute("storedFoods");
	%>
	
	<br>
	
	<div class="table_container">
		<table class="responsive-table">
			<thead>
				<tr>
					<th scope="col">Όνομα προϊόντος</th>
					<th scope="col">Τιμή</th>
					<th scope="col">Κατηγορία</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0;i<storedFoods.size();i++) {
		        		food food_item = storedFoods.get(i); 
				%>
				<tr> 
					<th scope="row"><%= food_item.getName() %></th>
					<td data-title="Τιμή"><%= food_item.getCost() %></td>
					<td data-title="Κατηγορία"><%= food_item.getCategory() %></td>
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