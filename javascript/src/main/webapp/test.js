document.addEventListener("DOMContentLoaded", function(){
	var target = document.querySelector(".box2");
	var btn = document.querySelector("button");

	btn.addEventListener("click", function(){
		var pre = parseInt(target.style.left);
		target.style.left = pre + 200 + "px";
	
	})
});

