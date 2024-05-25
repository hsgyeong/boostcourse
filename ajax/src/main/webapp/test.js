function ajax(){
	var oReq = new XMLHttpRequest();
	
	oReq.addEventListener("load", function(){
		var jsonobj = JSON.parse(this.responseText);
		var fruit = jsonobj.favorites[1];
		var outside = document.querySelector(".outside");
		outside.innerHTML += ("<span>"+ fruit + "</span>");
	});
	
	oReq.open("GET", "./json.txt");
	oReq.send();
}	