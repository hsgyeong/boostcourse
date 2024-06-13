var log = document.querySelector(".log");
var lists = document.querySelectorAll("ul > li");
var ul = document.querySelector("ul");
var img = document.querySelector("img");

img.addEventListener("click", function(){
	console.log("img tag clicked!");
})

ul.addEventListener("click", function(evt){
	console.log(evt.currentTarget.tagName, evt.target.tagName);
});
	
/*for(var i = 0, len=lists.length; i<lists.length; i++){
	lists[i].addEventListener("click", function(evt){
		console.log(evt.currentTarget);
		log.innerHTML = "clicked" + evt.currentTarget.firstElementChild.src;
	});
}*/