var souvlakia_src = 'food/souvlaki.jpg'; //Κατηγορία = Σουβλάκια
var pizza_src='food/pizza.jfif'; //Κατηγορία = Pizza
var crepe_src='food/crepe.jfif'; //Κατηγορία = Crepe
var moms_src='food/moms.jpg'; //Κατηγορία = Μαγειρευτά
var grill_src = 'food/grill.jfif'; //Κατηγορία = Grill
var seafood_src = 'food/seafood.jfif'; //Κατηγορία = Θαλλασινά
var coffe_src = 'food/coffe.jfif';  //Κατηγορία = Καφές
var vegan_src = 'food/vegan.jfif';  //Κατηγορία = Vegan
var pasta_src = 'food/spaghetti.jfif';  //Κατηγορία = Ζυμαρικά
var burger_src='food/burger.jfif'; //Κατηγορία = Burgers
var bakery_src='food/bakery.jfif'; //Κατηγορία =Αρτοποιήματα



//This function uses google maps distance matrix api and finds the driving distance from origin to destination
function calculate() {
	const meters_div = document.getElementById("result_meters");
	console.log(meters_div);
	const service = new google.maps.DistanceMatrixService();
	var store_addresses = a.split("&"); //array of strings
	var names_array=names.split("&");
	var catg_array=categories.split("&");
	var minutes_array=minutes.split("&");
	var min_array=minimum.split("&");
	console.log(store_addresses);
	console.log(names_array);
	console.log(catg_array);
	console.log(minutes_array);
	console.log(min_array);
	console.log(b);
	var str1="Ελάχιστη ";
	var str2=" €";
	var str3=" Λεπτά";
	
	service.getDistanceMatrix(
	{
		origins: store_addresses,
		destinations: [b],
		travelMode: google.maps.TravelMode.DRIVING,
		unitSystem: google.maps.UnitSystem.METRIC,
		avoidHighways: false,
		avoidTolls: false,
	},
	(response, status) => {
		if (status !== "OK") {
			outputDiv.value="error";
		}
		else {
			const originList = response.originAddresses;
			const destinationList = response.destinationAddresses;
			var meters="";
			var h5="";

			for (let i = 0; i < originList.length; i++) {
			const results = response.rows[i].elements;
				console.log("i= "+i);
				for (let j = 0; j < results.length; j++) {
					meters+=results[j].distance.value;
					meters+="-";
					if (results[j].distance.value<=2100) {
						h5=catg_array[i]+" - "+str1+min_array[i]+str2+" - "+minutes_array[i]+str3;
						create(names_array[i],h5,catg_array[i]);
					}
					
				}
				
			}
			meters_div.value=meters;
		}
	}
	);
	
}

function create(h3_text,h5_text,img_source_path){
	const column2 = document.getElementById("cl2");
	//const metersDiv = document.getElementById("result_meters");
	//console.log(meters);
	
	var form = document.createElement("form");
	var forname =  "cgm_" + h3_text;
    form.setAttribute("name", forname); 
	form.setAttribute("id", forname); 
    form.setAttribute("action", "getMenu"); 
	var myinput = document.createElement("INPUT");
	myinput.setAttribute("type", "hidden");
	myinput.name = "cgm";
	myinput.value = h3_text;

	var row2 = document.createElement('div');
	row2.className = 'row2';
	row2.setAttribute("name",img_source_path);
	
	var str= "call_getMenu_servlet(" + "'"+ "cgm_" + h3_text + "'" +")";
	row2.setAttribute("onclick",str);
	var astore = document.createElement('div');
	astore.className = 'astore';
	var row = document.createElement('div');
	row.className = 'row';
	var column3 = document.createElement('div');
	column3.className = 'column3';
	var column4 = document.createElement('div');
	column4.className = 'column4';
	var img = document.createElement('img'); 
	switch (img_source_path) {
		case "Αρτοποιήματα":
			img.src = bakery_src;
	    	break;
		case "Μαγειρευτά":
			img.src = moms_src ;
			break;
		case "Θαλλασινά":
			img.src = seafood_src ;
			break;
		case "Σουβλάκια":
			img.src = souvlakia_src ;
			break;
		case "Καφές":
			img.src = coffe_src ;
			break;
		case "Ζυμαρικά":
			img.src = pasta_src ;
			break;	
		default:
			img_source_path=img_source_path.toLowerCase();
			img.src ='food/'+ img_source_path +'.jfif';
	}
		
	var h3 = document.createElement("h3");
	var t3 = document.createTextNode(h3_text);
	h3.appendChild(t3);
	var h5 = document.createElement("h5");
	var t5 = document.createTextNode(h5_text);
	h5.appendChild(t5);
		
	column2.appendChild(form);
	form.appendChild(myinput);
	form.appendChild(row2);
	row2.appendChild(astore);
	astore.appendChild(row);
	row.appendChild(column3);
	column3.appendChild(img);
	row.appendChild(column4);
	column4.appendChild(h3);
	column4.appendChild(h5);
	
}

function call_getMenu_servlet(formname){	
	var form = document.getElementById(formname);
	form.action="getMenu";
	form.submit();
}
