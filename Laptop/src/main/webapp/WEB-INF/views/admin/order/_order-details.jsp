<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><b>Chi tiết đơn hàng</b></h3>
    </div>
    <table class="table table-hover">
        <thead class="bg-success">
            <tr>
                <th>Mã sản phẩm</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Giảm giá</th>
                <th>Số lượng</th>
                <th>Tổng số tiền</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="d" items="${form.orderDetails}">
                <tr>
                    <td>${d.product.id}</td>
                    <td>${d.product.name}</td>
                    <c:set var="price" value="${d.unitPrice}" />
                    <td> <fmt:formatNumber value="${price}" type="number" /> VND</td>
                    <td>${d.discount * 100} %</td>
                    <td>${d.quantity}</td>
                    <td>
                    	<c:set var="total" value="${d.unitPrice * d.quantity * (1 - d.discount)}" />
                    	<fmt:formatNumber value="${total}" type="number" /> VND
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>