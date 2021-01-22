var cart_total = sessionStorage.getItem("cart_total");
var cart_names = sessionStorage.getItem("cart_names").split(",");
var cart_prices = sessionStorage.getItem("cart_prices").split(",");
var cart_quantities = sessionStorage.getItem("cart_quantities").split(",");
var cardDiv =  document.getElementById("cardDiv");
cardDiv.style.display="none";
	
console.log(cart_total);
console.log(cart_names);
console.log(cart_prices);
console.log(cart_quantities);


check_order_status();
initialize_row();
init_form_inputs();

function check_order_status(){
	console.log(order_sent);
	var save = document.getElementById("save");
	var fnew = document.getElementById("fnew");
	var logout = document.getElementById("logout");
	var sent = document.getElementById("sent");
	var thanks = document.getElementById("thanks");
	
	 if (order_sent=="yes") {
		fnew.style.display="block";
		logout.style.display="block";
		sent.style.display="block";
		thanks.style.display="block";
		save.style.display="none";
	}
	else {
		fnew.style.display="none";
		logout.style.display="none";
		sent.style.display="none";
		thanks.style.display="none";
		save.style.display="initial";
	}
}

function init_form_inputs(){
	var foods =  document.getElementById("foods");
	var cost_total = document.getElementById("cost_total");
	
	var foods_str="";
	var cost_str = cart_total;
	for (var i=0; i<cart_names.length; i++){
		foods_str+=cart_quantities[i] + " x " + cart_names[i];
		if (i<cart_names.length-1) {
			foods_str+=",";
		}
	}
	foods.value = foods_str;
	cost_total.value = cost_str;
}

function initialize_row(){
	var row1 = document.getElementById("row1");
	var table = document.createElement("table");
	var tbody = document.createElement('tbody');
	
	var initial_row = document.createElement('tr');
	var Name = document.createElement('td');
	Name.appendChild(document.createTextNode('Όνομα Προϊόντος'));
	var Quantity = document.createElement('td');
	Quantity.appendChild(document.createTextNode('Ποσότητα'));
	var Price = document.createElement('td');
	Price.appendChild(document.createTextNode('Τιμή Προϊόντος'));
	initial_row.appendChild(Name);
	initial_row.appendChild(Quantity);
	initial_row.appendChild(Price);
	tbody.appendChild(initial_row);
	
	for (var i=0; i<cart_names.length; i++){
		
		var table_row = document.createElement('tr');
		var row_name = document.createElement('td');
		row_name.appendChild(document.createTextNode(cart_names[i]));
		var row_quan = document.createElement('td');
		row_quan.appendChild(document.createTextNode(cart_quantities[i]));
		var row_price = document.createElement('td');
		row_price.appendChild(document.createTextNode(cart_prices[i]));
		table_row.appendChild(row_name);
		table_row.appendChild(row_quan);
		table_row.appendChild(row_price);
		tbody.appendChild(table_row);
	}
	table.appendChild(tbody);
	row1.appendChild(table);
	
	var cart_total_text = document.createElement("h3");
	var str="Σύνολο: " + cart_total;
	cart_total_text.appendChild(document.createTextNode(str));
	row1.appendChild(cart_total_text);
}

function checkbox(checked_id){
	var cash_checkbox = document.getElementById("cash");
	var card_checkbox = document.getElementById("card");
	//var checked = document.getElementById(checked_id);
	var cashDiv = document.getElementById("cashDiv");
	var cardDiv =  document.getElementById("cardDiv");
	
	if (checked_id=="cash"){
		card_checkbox.checked=false;
		cardDiv.style.display="none";
		cashDiv.style.display="block";
	}
	else if (checked_id=="card"){
		cash_checkbox.checked=false;
		cashDiv.style.display="none";
		cardDiv.style.display="block";
	}
}