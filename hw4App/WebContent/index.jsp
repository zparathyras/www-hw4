<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Deli and Dine</title>
	<link rel="stylesheet" href="style/mystyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
			<div class="container_column1">
				<h1>Deli & Dine</h1>
			</div>
			<div class="container_column2">
				<p>Το Deli and Dine είναι μια online υπηρεσία που σου παρέχει την δυνατότητα παραγγελίας delivery και κράτησης σε εστιατόρια.</p>
				<p>Σκοπός μας είναι να παρέχουμε μια υπηρεσία φιλική πρός το χρήστη και να κάνουμε τις παραγγελίες/κρατήσεις πιο εύκολες και γρήγορες.</p>
			</div>
		</div>
	</header>

	<div class="aboutContainer">
		
	</div>

	<div class="r_l_container">
		<div class="colum">
			<div class="customer">
				<h3>Χρήστης</h3>
				<h5>Αν δεν είστε εγγεγραμένος/η πατήστε εγγραφή.</h5>
				<form class="my-form2" action="redirect_to_cust_reg">
					<div class="submit">
						<input type="submit" value="Εγγραφή">
					</div>
				</form>
				<h5>Αλλιώς πατήστε σύνδεση.</h5>
				<a href="#modal_l_customer" class="Register_click">Σύνδεση</a>
					
					<div class="modal" id="modal_l_customer">
						<div class="modal_content_l">
							<a href="#" class="modal_close">X</a>
							<div class="register">
								<h3>Για να συνδεθείτε παρακαλώ συμπληρώστε τα παρακάτω στοιχεία.</h3>
								<form class="my-form" action="LoginCustomer">
									<div class="row">
										<label>Email:</label>
										<input type="email" name="cEmail" placeholder="Συμπληρώστε Email" required>
									</div>
									<br>
									<div class="row">
										<label>Password:</label>
										<input type="password" name="cPwd" placeholder="Συμπληρώστε Password" required>
									</div>
									<br>
									<div class="submit">
										<input type="submit" value="Σύνδεση">
									</div>
								</form>
							</div>
						</div>
					</div>
					<h5>Με την εγγραφή ή σύνδεση συμφωνείτε στους Όροι χρήσης και Πολιτική απορρήτου</h5>
			</div>
		</div>
		<div class="colum">
			<div class="store">
				<h3>Κατάστημα</h3>
				<h5>Αν δεν είστε εγγεγραμένος/η πατήστε εγγραφή.</h5>
				<form class="my-form2" action="redirect_to_store_reg">
					<div class="submit">
						<input type="submit" value="Εγγραφή">
					</div>
				</form>
				<h5>Αλλιώς πατήστε σύνδεση.</h5>
				<a href="#modal_l_store" class="Register_click">Σύνδεση</a>
					
					<div class="modal" id="modal_l_store">
						<div class="modal_content_l">
							<a href="#" class="modal_close">X</a>
							<div class="register">
								<h3>Για να συνδεθείτε παρακαλώ συμπληρώστε τα παρακάτω στοιχεία.</h3>
								<form class="my-form" action="LoginStore">
									<div class="row">
										<label>Email:</label>
										<input type="email" name="slEmail" placeholder="Συμπληρώστε Email" required>
									</div>
									<br>
									<div class="row">
										<label>Password:</label>
										<input type="password" name="slPwd" placeholder="Συμπληρώστε Password" required>
									</div>
									<br>
									<div class="submit">
										<input type="submit" value="Σύνδεση">
									</div>
								</form>
							</div>
						</div>
					</div>
					<h5>Με την εγγραφή ή σύνδεση συμφωνείτε στους Όροι χρήσης και Πολιτική απορρήτου</h5>
			</div>
		</div>
	</div>

	<div class="info">
		<div class="colum">
			<div class="social">
				<h3>Βρείτε μας στα social media.</h3>
					<a href="" class="fa fa-facebook" ></a>
					<a href="" class="fa fa-instagram"></a>	
			</div>
		</div>
		<div class="colum">
			<div class="r_l_container">
				<div class="colum" style="box-shadow:none;">
					<ul>
						<li><a href="" >Ποιοί είμαστε</a></li>
						<li><a href="" >Πώς λειτουργεί</a></li>
						<li><a href="" >FAQs</a></li>
						<li><a href="" >Blog</a></li>
						<li><a href="" >Επικοινωνία</a></li>
						
					</ul>
				</div>
				<div class="colum" style="box-shadow:none;">
					<ul>
						<li><a href="" >Όροι χρήσης</a></li>
						<li><a href="" >Αλλεργιογόνα</a></li>
						<li><a href="" >Πολιτική απορρήτου</a></li>
						<li><a href="" >Πολιτική προστασίας</a></li>
						<li><a href="" >Πολιτική cookies</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>