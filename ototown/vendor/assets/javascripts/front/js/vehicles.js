jQuery(function() {
	jQuery("#step_1").click(function(e) {
		e.preventDefault();
		jQuery('#step_2,#step_3').removeClass('active');
		jQuery('.step_2,.step_3').hide();
		jQuery('.step_1').show();
	});
	jQuery("#step_2").click(function(e) {
		e.preventDefault();
		jQuery('#step_2').addClass('active');
		jQuery('#step_3').removeClass('active');
		jQuery('.step_1,.step_3').hide();
		jQuery('.step_2').show();
	});
	jQuery("#step_3").click(function(e) {
		e.preventDefault();
		jQuery('#step_3,#step_2').addClass('active');
		jQuery('.step_1,.step_2').hide();
		jQuery('.step_3').show();
	});
	jQuery(".step_2 .btn3").click(function(e) {
		e.preventDefault();
		jQuery("#step_1").click();
	});
	jQuery(".step_1 .btn1,.step_3 .btn3").click(function(e) {
		e.preventDefault();
		jQuery("#step_2").click();
	});
	jQuery(".step_2 .btn1").click(function(e) {
		e.preventDefault();
		jQuery("#step_3").click();
	});
	jQuery(".step_3 .btn1").click(function(e) {
		e.preventDefault();
		if (!jQuery("#vehicle-form").valid()) {
			alert( 'Enter required fields!' );
		} else {
			jQuery('.form_loading').css({'display': 'inline-block'});
			jQuery('#vehicle-form').ajaxForm(options_ajax).submit();
		}
	});
});