<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="myPackage.Customer, myPackage.Store, java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Reservation Sent</title>
	<link rel="stylesheet" href="style/reservationSent.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<%
		Store res_picked_store = (Store)session.getAttribute("res_picked_store");
		Customer Session_customer = (Customer)session.getAttribute("ses_customer");
		String res_sent = (String)session.getAttribute("res_sent");
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = formatter.format(date);
		System.out.println(strDate);
	%>
	<script type="text/javascript">
		var res_sent="<%=res_sent%>";
	</script>
	
	<header id="mainHeader">
		<div class="container">
			<h1>Deli & Dine</h1>
		</div>
	</header>
	
	<div id="saveRes">
	<form  class="my-form" action="saveReservation">
		<input type="hidden" id="customerID" name="customerID" value="<%=Session_customer.getId()%>">
		<input type="hidden" id="storeID" name="storeID" value="<%=res_picked_store.getId()%>">
		<input type="hidden" id="store_name" name="store_name" value="<%=res_picked_store.getSname()%>">
		<label for="persons">Aριθμός ατόμων:</label>
		<input type="number" min="1" max="10" step="1" id="persons" name="persons" required>
		<label for="resDate">Ημερομηνία κράτησης:</label>
		<input type="date" min="<%=strDate%>" value="<%=strDate%>" id="resDate" name="resDate" required>
		<label for="resTime">Ώρα κράτησης:</label>
  		<input type="time" id="resTime" name="resTime" required>
			
		<div class="submit">
			<input type="submit" value="Αποστολή κράτησης">
		</div>
	</form>
	</div>

	<h3 id="sent">Η κράτηση σας στάλθηκε στο κατάστημα και θα ενημερωθείτε με email μόλις το κατάστημα την αποδεχτεί.</h3>
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

	<script src="JsFiles/reservation2.js"></script>
</body>
</html>