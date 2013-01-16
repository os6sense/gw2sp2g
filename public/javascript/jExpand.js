$(document).ready(function(){
	$("tr.lvl2").hide();
	//$("tr:first-child").show();
	$("tr.lvl1").show();
            
	$("tr.lvl1").click(function(){
                $(this).next("tr").toggle();
                $(this).next("tr").next("tr").toggle();
                $(this).next("tr").next("tr").next("tr").toggle();
	});
});
