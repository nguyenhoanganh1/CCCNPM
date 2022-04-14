<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<s:message code="layout.cart.view" var="view"/>

<div class="panel panel-primary">
    <div class="panel-body">
        <div class="col-xs-5" style="font-size: 50px;">
            <b class="glyphicon glyphicon-shopping-cart nn-cart-icon"></b>
        </div>
        <ul class="col-xs-7">
            <li><b class="cart-cnt">0</b> items</li>
            <li><b class="cart-amt">0</b> USD</li>
            <li><a href="/cart/view">${view}</a></li>
        </ul>
    </div>
</div>

<style id="cart-effect">
	.cart-effect{
		background-image: url("/static/images/items/1008.jpg");
		background-size: 100% 100%;
	}
</style>