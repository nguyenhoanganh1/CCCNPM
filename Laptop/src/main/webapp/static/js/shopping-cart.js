$(function(){
	function show_cart_info(info){
		$(".cart-cnt").html(info.count);
		var formatter = new Intl.NumberFormat("vi-VN", { style: "currency", "currency":"VND" });
		var res =  formatter.format(Math.round(info.amount * 100) / 100);
		$(".cart-amt").html(res);
		$(".qty-cart").html(info.count);
	}
	// initializing
	$.ajax({
		url: `/cart/info`,
		success: function(resp){
			show_cart_info(resp);
		}
	})
	
	$(".nn-cart-add").click(function(){
		var id = $(this).parents("[data-item]").attr("data-item");
		$.ajax({
			url: `/cart/add/${id}`,
			success: function(resp){
				show_cart_info(resp);
			}
		});
		// Hiệu ứng giỏ hàng
		var img = $(this).parents(".nn-prod").find(".panel-body img");
		var effect_css = `
			.cart-effect{
				background-image: url("${img.attr("src")}");
				background-size: 100% 100%;
			}`;
		$("#cart-effect").html(effect_css);
		var options = {
				to:".nn-cart-icon",
				className: "cart-effect"
		}
		img.effect("transfer", options, 1000);
	});
	
	$(".nn-cart-remove").click(function(){
		var item = JSON.parse($(this).parents("[data-item]").attr("data-item"));
		$.ajax({
			url: `/cart/remove/${item.id}`,
			success: function(resp){
				show_cart_info(resp);
			}
		});
		$(this).parents("[data-item]").hide(500);
	});
	
	$(".nn-cart-change").on("input", function(){
		var item = JSON.parse($(this).parents("[data-item]").attr("data-item"));
		var qty = $(this).val();
		$.ajax({
			url: `/cart/update/${item.id}/${qty}`,
			success: function(resp){
				show_cart_info(resp);
			}
		});
		var amt = Math.round(100 * qty * item.price * (1 - item.disc)) / 100;
		$(this).parents("[data-item]").find(".nn-item-amt").html("$" + amt);
	});
	
	$(".nn-cart-clear").on("click", function(){
		$.ajax({
			url: `/cart/clear`,
			success: function(resp){
				show_cart_info(resp);
				$("tbody.nn-cart-items").empty();
			}
		});
	});
})