<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Store Register</title>
	<link rel="stylesheet" href="style/storeReg.css">
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
	
	<form class="my-form" action="RegisterStore">
		<div class="input_container">
			<div class="colum1">
				<br>
				<div class="row">
					<label>Όνομα Καταστήματος:</label>
					<input type="text" name="store_name" placeholder="Συμπληρώστε Όνομα Καταστήματος" required>
				</div>
				<br>
				<div class="row">
					<label>Όνομα Υπεύθυνου:</label>
					<input type="text" name="fname" placeholder="Συμπληρώστε Όνομα Υπεύθυνου" required>
				</div>
				<br>
				<div class="row">
					<label>Επώνυμο Υπεύθυνου:</label>
					<input type="text" name="lname" placeholder="Συμπληρώστε Επώνυμο Υπεύθυνου" required>
				</div>
				<br>
				<div class="row">
					<label>Τηλέφωνο Καταστήματος:</label>
					<input type="tel" name="sPhone"  pattern="[0-9]{10}" placeholder="Συμπληρώστε Τηλέφωνο" required>
				</div>
				<br>
				<div class="row">
					<label for="category">Κατηγορία φαγητού:</label>
					<select id="category" name="category" required>
						<option value="">Κατηγορία</option>
						<option value="Αρτοποιήματα">Αρτοποιήματα</option>
						<option value="Ζυμαρικά">Ζυμαρικά</option>
						<option value="Θαλλασινά">Θαλλασινά</option>
						<option value="Καφές">Καφές</option>
						<option value="Μαγειρευτά">Μαγειρευτά</option>
						<option value="Σουβλάκια">Σουβλάκια</option>
						<option value="Burgers">Burgers</option>
						<option value="Crepe">Crepe</option>
						<option value="Grill">Grill</option>
						<option value="Pizza">Pizza</option>
						<option value="Vegan">Vegan</option>	
					</select>
				</div>
				<br>
				<div class="row">
					<label for="reservation">Δεχόμαστε κρατήσεις:</label>
					<select id="reservation" name="reservation" required>
						<option value="">Απάντηση</option>
						<option value="ΝΑΙ">ΝΑΙ</option>
						<option value="ΟΧΙ">ΟΧΙ</option>
					</select>
				</div>
				<br>
				<div class="row">
					<label>Email:</label>
					<input type="email" name="sEmail" placeholder="Συμπληρώστε Email" required>
				</div>
				<br>
				<div class="row">
					<label>Password:</label>
					<input type="password" name="sPwd" placeholder="Συμπληρώστε Password" required>
				</div>
				<br>
			</div>
			<div class="colum2">
				<div style="display: none">
			      <input
			        id="pac-input"
			        name="pac_input"
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
					<label>Ελάχιστο κόστος παραγγελίας:</label>
					<input type="number" min="0" step="0.1" name="cost" placeholder="Σε ευρώ" required>
					
				</div>
				<br>
				<div class="row">
					<label>Μέσος χρόνος αναμονής:</label>
					<input type="number" min="0" step="1" name="time" placeholder="Σε λεπτά" required>
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