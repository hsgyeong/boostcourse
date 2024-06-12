function init(){
	var target = document.querySelector(".outside");
	var btn = document.querySelector("button");
	btn.addEventListener("click", function(){
		var pre = parseInt(target.style.left);
		target.style.left = pre + 200 + "px";
	})
}

/*btn.addEventListener("click", function(){
	var pre = parseInt(target.style.left);
	target.style.left = pre + 200 + "px";
	
});*/

/*window.addEventListener("DOMContentLoaded", function(){
	console.log("DOM Loaded");
});*/

document.addEventListener("DOMContentLoaded", function(){
	console.log("DOM Loaded");
	init();
});
