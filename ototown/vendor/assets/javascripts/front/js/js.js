
jQuery(document).ready(function(){
	/*jQuery('.slider').mobilyslider({
		content: '.sliderContent',
		children: 'div',
		transition: 'horizontal',
		animationSpeed: 500,
		autoplay: false,
		autoplaySpeed: 3000,
		pauseOnHover: false,
		bullets: true,
		arrows: false,
		arrowsHide: true,
		prev: 'prev',
		next: 'next',
		animationStart: function(){},
		animationComplete: function(){}
	});*/
	$('.slider_1').bxSlider({
   	 	slideWidth: 940,
    	minSlides: 1,
    	maxSlides: 1,
    	slideMargin: 0,
    	controls : false
  	});
  	$('.slider_2').bxSlider({
   	 	slideWidth: 940,
    	minSlides: 1,
    	maxSlides: 1,
    	slideMargin: 0,
    	controls : false
  	});
	jQuery('.select_1').selectik({
		width: 'auto',
		maxItems: 5,
		customScroll: 1,
		speedAnimation: 100,
		smartPosition: false
	});
	jQuery('.select_2').selectik({
		width: 'auto',
		maxItems: 5,
		customScroll: 1,
		speedAnimation: 100,
		smartPosition: false
	});
	jQuery('.select_3').selectik({
		width: 'auto',
		maxItems: 5,
		customScroll: 1,
		speedAnimation: 100,
		smartPosition: false
	});
	jQuery('.select_4').selectik({
		width: 'auto',
		maxItems: 5,
		customScroll: 1,
		speedAnimation: 100,
		smartPosition: false
	});
	jQuery('.select_5').selectik({
		containerClass: 'custom-select sell_select',
		width: 205,
		maxItems: 5,
		customScroll: 1,
		speedAnimation: 100,
		smartPosition: false
	});
	/*$('.recent_carousel').elastislide({
		imageW 		: 220,
		border		: 0,
		margin		: 20
	});*/
	$('.recent_carousel').bxSlider({
   	 	slideWidth: 220,
    	minSlides: 1,
    	maxSlides: 4,
    	slideMargin: 20,
    	controls : true,
    	pager : false,
    	infiniteLoop: false
  	});
	/*$('.tabs_carousel').elastislide({
		imageW 		: 150,
		border		: 0,
		margin		: 20
	});*/
	var slider=$('.tabs_carousel').bxSlider({
   	 	slideWidth: 150,
    	minSlides: 1,
    	maxSlides: 4,
    	slideMargin: 20,
    	controls : true,
    	pager : false,
    	infiniteLoop: false
  	});
	$('ul.tabs').delegate('li:not(.current)', 'click', function() {
	    $(this).addClass('current').siblings().removeClass('current').parents('div.section').find('div.box').eq($(this).index()).fadeIn(150).siblings('div.box').hide();
	});
	$(".video_box .preview a").fancybox({
		'width'				: '75%',
		'height'			: '75%',
		'autoScale'			: false,
		'transitionIn'		: 'elastic',
		'transitionOut'		: 'elastic',
		'type'				: 'iframe'
	});
	$("a[rel=car_group]").fancybox({
		'autoScale'			: false,
		'transitionIn'		: 'elastic',
		'transitionOut'		: 'elastic'
	});

	var austDay = new Date();
	austDay = new Date(austDay.getFullYear(),austDay.getMonth(), austDay.getDate()+36,austDay.getHours()+7,austDay.getMinutes()+24,austDay.getSeconds()+59);
	$('#counter').countdown({
		until: austDay, 
		format: 'dHMS'
	});

	$('.drop_list .selected span').click(function(e){
		e.preventDefault();
		$(this).parent('.selected').addClass('active');
	});
	$('.drop_list .selected ul li').click(function(e){
		e.preventDefault();
		$(this).closest('.selected').removeClass('active');
	});
	$( ".accordion h4" ).click(function(){
		$('.accordion .acc_box').each(function(){
			$(this).removeClass('active').children('div').slideUp(500);
		})
		$(this).parent().addClass('active').children('div').slideDown(500);
	});
	$('#navigation span').click(function(){
		if($(this).parent().hasClass('open')){
			$(this).parent().removeClass('open').children('ul').slideUp();
		}
		else{
			$(this).parent().addClass('open').children('ul').slideDown();
		}
	});
});
