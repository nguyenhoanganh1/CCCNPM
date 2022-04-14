<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
            window.paypalLoadScript({ "client-id": "ASFlFvGjH0evpHdzdDLv2cqa33C74FA3xKedInVAg_1X_Bh5WhrAgirljJaXZcLvBOHnvV7RGncPU1Z1" }).then((paypal) => {
                paypal.Buttons().render("#paypal-buttons");
            });
        </script>
<div class="panel panel-warning">
	<div class="panel-heading">
		<h3 class="panel-title">
			<b>GIỎ HÀNG</b>
		</h3>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>STT</th>
				<th>Tên</th>
				<th>Ảnh</th>
				<th>Giá</th>
				<th>Giảm giá</th>
				<th>Số lượng</th>
				<th>Thành tiền</th>
				<th></th>
			</tr>
		</thead>
		<tbody class="nn-cart-items">
			<c:forEach var="item" items="${cart.items}" varStatus="st">

				<tr
					data-item='{"id":${item.id}, "price":${item.price}, "disc":${item.disc}}'>
					<td>${st.index + 1}</td>
					<td><a href="/product/detail/${item.id}">${item.name}</a></td>
					<td><a href="/product/detail/${item.id}"> <img
							class="img-cart" src="/static/images/items/${item.image}">
					</a></td>
					<c:set var="price" value="${item.price}" />
					<td><fmt:formatNumber value="${price}" type="number" /> VND</td>
					<td>${item.disc * 100}%</td>
					<td><input class="nn-cart-change" value="${item.qty}"
						type="number" min="1" style="width: 50px"></td>
					<c:set var="balance" value="${item.amount}" />
					<td class="nn-item-amt"><fmt:formatNumber value="${balance}"
							type="number" /> VND</td>
					<td class="text-center">
						<button
							class="btn btn-xs btn-danger glyphicon glyphicon-trash nn-cart-remove"></button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panel-footer text-right">
		<a href="/" class="btn btn-sm btn-info"> <i
			class="glyphicon glyphicon-hand-left"></i> Mua thêm
		</a>
		<button class="btn btn-sm btn-warning nn-cart-clear">
			<i class="glyphicon glyphicon-trash"></i> Xóa giỏ hàng
		</button>
		
		<c:if test="${empty sessionScope.user }">
			<a href="/order/checkout" class="btn btn-sm btn-success"> <i
				class="glyphicon glyphicon-ok"></i> Thanh toán
			</a>
			
		</c:if>
		<c:set var="amt" value="${item.amount}" />
		<b class="pull-left">Tổng số tiền: <i class="cart-amt"><fmt:formatNumber
					value="${amt}" type="number" />? VND</i></b>
	</div>
</div>
<div id="paypal-buttons"></div>
<c:if test="${!empty sessionScope.user }">
	<form action="/order/purchase" method="post">
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3 class="panel-title">
					<b>Thông tin đơn hàng</b>
				</h3>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<label>Địa chỉ nhận hàng:</label> <input name="address"
						placeholder="Shipping Address?" class="form-control">
				</div>
				<div class="form-group">
					<label>Ghi chú:</label>
					<textarea name="notes" placeholder="Write something here?" rows="3"
						class="form-control"></textarea>
				</div>
			</div>
			<div class="panel-footer text-right">
				<button class="btn btn-danger">
					<i class="glyphicon glyphicon-gbp"></i> Thánh toán
				</button>
			</div>
		</div>
	</form>
</c:if>