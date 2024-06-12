window.addEventListener("DOMContentLoaded", function(){
	console.log("DOM Loaded");
});

var target = document.querySelector(".outside");
var btn = document.querySelector("button");

btn.addEventListener("click", function(){
	var pre = parseInt(target.style.left);
	target.style.left = pre + 200 + "px";
	
});

document.addEventListener("DOMContentLoaded", function(){
	console.log("DOM Loaded");
});