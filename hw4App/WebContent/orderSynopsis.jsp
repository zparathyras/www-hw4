<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="myPackage.Customer, myPackage.Store" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Menu</title>
	<link rel="stylesheet" href="style/synospsis.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
		String order_sent = (String)session.getAttribute("order_sent");
		Customer Session_customer = (Customer)session.getAttribute("ses_customer");
		Store picked_store = (Store)session.getAttribute("picked_store");
		
		String customerID = String.valueOf(Session_customer.getId());
		String storeID = String.valueOf(picked_store.getId());
		String store_name = picked_store.getSname();
		String customer_address = Session_customer.getAddress();
		String customer_buzzer = Session_customer.getBuzzer();
		String customer_floor = Session_customer.getFloor();
	%>
	<script type="text/javascript">
		var order_sent="<%=order_sent%>";
	</script>
	
	<header id="mainHeader">
		<div class="container">
			<h1>Deli & Dine</h1>
		</div>
	</header>
	
	<div class="row" id="row1">
		<!-- CART DATA -->
		<h3>Σύνοψη Παραγγελίας</h3>
	</div>
	<br>
	<div class="row" id="row2">
		<!-- 2 Columns -->
		<!-- column1 = customer address -->
		<!-- column2 =  payment methods -->
		<div class="column1">
			<h3>Στοιχεία Πελάτη</h3>
			<div class="stoixeia">
				<h4>Διεύθυνση:</h4>
				<h5><%=Session_customer.getAddress()%></h5>
			</div>
			<div class="stoixeia">
				<h4>Όροφος:</h4>
				<h5><%= Session_customer.getFloor()%></h5>
			</div>
			<div class="stoixeia">
				<h4>Κουδούνι:</h4>
				<h5><%= Session_customer.getBuzzer()%></h5>
			</div>
			<form class="my-form" action="saveOrder">
				<input type="text" id="foods" name="foods">
				<input type="text" id="cost_total" name="cost_total">
				<input type="text" id="customerID" name="customerID" value="<%=customerID%>">
				<input type="text" id="storeID" name="storeID" value="<%=storeID%>">
				<input type="hidden" id="store_name" name="store_name" value="<%=store_name%>">
				<input type="hidden" id="customer_address" name="customer_address" value="<%=customer_address%>">
				<input type="hidden" id="customer_buzzer" name="customer_buzzer" value="<%=customer_buzzer%>">
				<input type="hidden" id="customer_floor" name="customer_floor" value="<%=customer_floor%>">
				<div class="submit">
					<input id="save" type="submit" value="Αποστολή Παραγγελίας">
				</div>
			</form>
		</div>
		<div class="column2">
			<h3>Τρόποι Πληρωμής</h3>
			<input type="checkbox" id="cash" name="cash" onclick="checkbox(this.id);" checked>
			<label for="cash">Μετρητά</label><br>
			<div id="cashDiv" class="cashDiv">
				<h5>Επιλέξατε πληρωμή με μετρητά κατά την παράδοση.</h5>
			</div>
			<input type="checkbox" id="card" name="card" onclick="checkbox(this.id);">
			<label for="card">Κάρτα Πιστωτική/Χρεωστική</label><br>
			<div id="cardDiv">

				<h4>Accepted Cards: </h4>
				<div class="icon-container">
					<i class="fa fa-cc-visa" style="color:navy;"></i>
					<i class="fa fa-cc-amex" style="color:blue;"></i>
					<i class="fa fa-cc-mastercard" style="color:red;"></i>
					<i class="fa fa-cc-discover" style="color:orange;"></i>
				</div>

				<div class="crow">
					<div class="col-50">
		            	<label for="cname">Name on Card</label>
		            	<input type="text" id="cname" name="cardname" placeholder="John More Doe">
						<label for="expiration">Expiration Date</label>
		   				<input type="text" id="expiration" name="expiration" placeholder="MM/YY">
					</div>
					<div class="col-50">
						 <label for="ccnum">Card number</label>
						<input type="text" id="ccnum" name="cardnumber" placeholder="Valid Card Number">
						<label for="cvv">CV Code</label>
						<input type="text" id="cvv" name="cvv" placeholder="CVV">
					</div>
				</div>
			</div>
		</div>
	</div>
	<h3 id="sent">Η παραγγελία σας στάλθηκε στο κατάστημα και θα ενημερωθείτε με email μόλις το κατάστημα την αποδεχτεί.</h3>
	<h5 id="thanks">Ευχαριστούμε για την προτίμηση σας. </h5>
	<form id="fnew" class="my-form" action="redirect_to_CustomerProfile">
		<div class="submit">
			<input type="submit" value="Επιστροφή στο προφίλ">
		</div>
	</form>
	<form id="logout" class="my-form" action="Logout">
		<div class="submit">
			<input type="submit" value="Έξοδος/Αποσύνδεση">
		</div>
	</form>
	
	<script src="JsFiles/synospsis.js"></script>
</body>
</html>