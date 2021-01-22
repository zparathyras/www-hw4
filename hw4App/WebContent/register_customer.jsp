<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Customer Register</title>
	<link rel="stylesheet" href="style/customerReg.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9I2D4m8UtbuugWlGXrIh1OqXne5iXn6c&region=GR&language=el&callback=initMap&libraries=places&v=weekly"
      defer
    ></script>
    <link rel="stylesheet" type="text/css" href="style/gstyle2.css" />
    <script src="JsFiles/geocoder.js"></script>
</head>
<body>

	<%
		String error = (String)session.getAttribute("error");
		if (error!=null) {System.out.println(error);}
	%>
	<script type="text/javascript">
		var error_msg="<%=error%>";
	</script>
	<script src="JsFiles/errorUtility.js"></script>
	<script type="text/javascript">showError();</script>
	
	<header id="mainHeader">
		<div class="container">
			<h1>Deli & Dine</h1>
		</div>
	</header>
	
	<div class="aboutContainer">
		<h3>Για να ολοκληρώσετε την εγγραφή σας παρακαλώ συμπληρώστε τα παρακάτω κενά.</h3>
	</div>
	
	<form class="my-form" action="RegisterCustomer">
		<div class="input_container">
			<div class="colum1">
				<br>
				<div class="row">
					<label>Όνομα:</label>
					<input type="text" name="fname" placeholder="Συμπληρώστε Όνομα" required>
				</div>
				<br>
				<div class="row">
					<label>Επώνυμο:</label>
					<input type="text" name="lname" placeholder="Συμπληρώστε Επώνυμο" required>
				</div>
				<br>
				<div class="row">
					<label>Ηλικία:</label>
					<input type="number" min="18" step="1" name="age" placeholder="Συμπληρώστε Ηλικία" required>
				</div>
				<br>
				<div class="row">
					<label>Τηλέφωνο:</label>
					<input type="tel" name="phone" pattern="[0-9]{10}" placeholder="Συμπληρώστε Τηλέφωνο" required>
				</div>
				<br>
				<div class="row">
					<label>Email:</label>
					<input type="email" name="email" placeholder="Συμπληρώστε Email" required>
				</div>
				<br>
				<div class="row">
					<label>Password:</label>
					<input type="password" name="pwd" placeholder="Συμπληρώστε Password" required>
				</div>
				<br>
			</div>
			<div class="colum2">
				<div style="display: none">
			      <input
			        id="pac-input"
			        name="address"
			        class="controls"
			        type="text"
			        placeholder="Enter a location"
			      />
			    </div>
			    <div id="map"></div>
			    <div id="infowindow-content">
			      <span id="place-name" class="title"></span><br />
			      <strong>Place ID</strong>: <span id="place-id"></span><br />
			      <span id="place-address"></span>
			    </div>
			    <input id="formated" name="formated_address" type="text"/> <!--not displayed input used from geocoder.js to store data -->
			    <input id="adm_area" name="perifereia" type="text"/> <!--not displayed input used from geocoder.js to store data -->
			</div>
			<div class="colum3">
				<br>
				<div class="row">
					<label>Όροφος:</label>
					<input type="number" min="0" max="10" name="floor" required>
					
				</div>
				<br>
				<div class="row">
					<label>Όνομα στο κουδούνι:</label>
					<input type="text" name="buzzer" placeholder="Συμπληρώστε κουδούνι" required>
				</div>
				<br>
				<div class="row">
					<p>Αν πατήσετε Εγγραφή, δηλώνετε ότι συμφωνείτε με τους Όρους χρήσης. Μάθετε πώς συλλέγουμε, χρησιμοποιούμε και κοινοποιούμε τα δεδομένα σας ανατρέχοντας στην Πολιτική δεδομένων και πώς χρησιμοποιούμε τα cookies και άλλες παρόμοιες τεχνολογίες ανατρέχοντας στην Πολιτική για τα cookies.</p>
				</div>
				<br>
				<div class="row">
					<div class="submit">
						<input type="submit" value="Εγγραφή">
					</div>
				</div>
				<br>
			</div>
		</div>
	</form>
</body>
</html>