$(document).ready(function(){
	$("tr.lvl2").hide();
	$("tr.lvl1").show();

	$("tr.lvl1").click(function(){
                $(this).next("tr.lvl2").toggle();
                $(this).next("tr.lvl2").next("tr.lvl2").toggle();
                $(this).next("tr.lvl2").next("tr.lvl2").next("tr.lvl2").toggle();
                $(this).next("tr.lvl2").next("tr.lvl2").next("tr.lvl2").next("tr.lvl2").toggle();
	});
});
