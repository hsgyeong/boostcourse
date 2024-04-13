/*
var el = document.querySelector(".outside");

el.addEventListener("click", function(){
	console.log("clicked");
});
*/

var el = document.querySelector(".outside");

el.addEventListener("click", function(e){
	var target = e.target;
	console.log(target.className, target.nodeName);
	console.log(target.innerText);
});	