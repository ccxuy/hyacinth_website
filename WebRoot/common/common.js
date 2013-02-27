// nav
$(function shownav(){
	var a1 = $("url");
	var a2 = $(".nav ul li");
	for(var i=0;i<a2.length;i++){
		if(a2[i] == a1){
			$(a2[i]).addClass("select");
			return;
		}
	}
	$(a2[0]).addClass("select");
})