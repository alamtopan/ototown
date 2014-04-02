$(document).ready(function(){
	
	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
	$(".infinite-page").css("float","none");

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});
	
	//Calculator Cicilan Mobil
	
	
	var price = 130000000;var uangmuka = 39000000;		$("#calc-price").click(function(){
		$(this).val(removeCommas($(this).val()));
	});
	$("#calc-uangmuka").click(function(){
		$(this).val(removeCommas($(this).val()));
	});
	$("#calc-angsuran").click(function(){
		$(this).val(removeCommas($(this).val()));
	});
	$("#calc-price").blur(function(){
		price = $(this).val();
		var temp = addCommas(price);
		$(this).val(temp);
	});
	$("#calc-uangmuka").blur(function(){
		uangmuka = $(this).val();
		var temp = addCommas(uangmuka);
		$(this).val(temp);
	});
	$("#calc-angsuran").blur(function(){
		angsuran = $(this).val();
		var temp = addCommas(angsuran);
		$(this).val(temp);
	});
	$("#cicilan1").click(function(){	
			var flag = 1;
			var bulan = $("#calc-tenor1").val();
			var bunga = $("#calc-tenor2").val();
			
			/*$.ajax({url:'/calculator-cicilan-mobil/'+price+'/'+bulan+'/'+bunga+'/'+uangmuka+'/'+flag, success:function(result){
					$("#calc-angsuran").val(result);																								
			}});*/
			if(uangmuka=="") uangmuka=0;
			var data = getAmortization(price,bulan,bunga,uangmuka);
			$("#amortizationtable").html(data);
	});
	
    $("#cicilan2").click(function(){
		var flag = 2;
		var price = $("#calc-price2").val();
		var bulan = $("#calc-tenor1-2").val();
		var bunga = $("#calc-tenor2-2").val();
		var angsuran = $("#calc-angsuran-2").val();
		$.ajax({url:'/calculator-cicilan-mobil/'+price+'/'+bulan+'/'+bunga+'/'+angsuran+'/'+flag, success:function(result){
				$("#calc-uangmuka-2").val(result);																								
		}});												
	});
	
	$(".calc-desc").css("color", "#666");
});
