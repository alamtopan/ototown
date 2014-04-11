jQuery(document).ready(function(){
	jQuery(".custom_chb").mousedown(function() {
		changeCheck(jQuery(this));
	});
	jQuery(".custom_chb_wrapper label").click(function() {
		changeCheck(jQuery(this).parent('.custom_chb_wrapper').children('.custom_chb'));
	});
	jQuery(".custom_chb").each(function() {
	    changeCheckStart(jQuery(this));
	});
});
function changeCheck(el){
	var el = el,input = el.find("input").eq(0);
	if(!input.attr("checked")) {
		el.addClass("active");   
		input.attr("checked", true);
	} 
	else {
		el.removeClass("active"); 
		input.attr("checked", false)
	}
	return true;
}
function changeCheckStart(el){
	var el = el, input = el.find("input").eq(0);
	if(input.attr("checked")) {
		el.addClass("active");   
	}
	return true;
}
