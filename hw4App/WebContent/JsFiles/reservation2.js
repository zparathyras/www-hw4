check_res_status();

function check_res_status(){
	console.log(res_sent);
	var div_saveRes = document.getElementById("saveRes");
	var fnew = document.getElementById("fnew");
	var logout = document.getElementById("logout");
	var sent = document.getElementById("sent");
	var thanks = document.getElementById("thanks");
	
	 if (res_sent=="yes") {
		fnew.style.display="block";
		logout.style.display="block";
		sent.style.display="block";
		thanks.style.display="block";
		div_saveRes.style.display="none";
	}
	else {
		fnew.style.display="none";
		logout.style.display="none";
		sent.style.display="none";
		thanks.style.display="none";
		div_saveRes.style.display="block";
	}
}