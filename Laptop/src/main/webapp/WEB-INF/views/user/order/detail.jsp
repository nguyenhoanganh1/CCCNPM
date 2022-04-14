<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><b>Thông tin đơn đặt hàng</b></h3>
    </div>
    <form:form class="panel-body" modelAttribute="order">
        <div class="row">
            <div class="form-group col-sm-4">
                <label>Order Id:</label>
                <form:input path="id" readonly="true" class="form-control"/>
            </div>
            <div class="form-group col-sm-4">
                <label>Người đặt:</label>
                <form:input path="customer.fullname" readonly="true" class="form-control"/>
            </div>
            <div class="form-group col-sm-4">
                <label>Ngày đặt:</label>
                <form:input path="orderDate" readonly="true" class="form-control"/>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-4">
                <label>Tổng số tiền:</label>
                <form:input path="amount" readonly="true" class="form-control"/>
            </div>
            <div class="form-group col-sm-4">
                <label>Tráng thái:</label>
                <form:input path="status" readonly="true" class="form-control"/>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-12">
                <label>Địa chỉ nhận hàng:</label>
                <form:input path="address" readonly="true" class="form-control"/>
            </div>
            <div class="form-group col-sm-12">
                <label>Ghi chú:</label>
                <form:textarea path="notes" readonly="true" rows="3" class="form-control"></form:textarea>
            </div>
        </div>
    </form:form>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><b>Chi tiết đơn đặt hàng</b></h3>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Giảm giá</th>
                <th>Tổng số tiền</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="d" items="${order.orderDetails}">
            <tr>
                <td>${d.product.id}</td>
                <td>${d.product.name}</td>
                <c:set var="price" value="${d.unitPrice}" />
                <td><fmt:formatNumber value="${price}" type="number" /> VND</td>
                <td>${d.quantity}</td>
                <td>${d.discount * 100} %</td>
                 <c:set var="total" value="${d.unitPrice * d.quantity * (1 - d.discount)}" />
                <td><fmt:formatNumber value="${total}" type="number" /> VND</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<c:if test="${order.status == 0}">
<div class="panel panel-default">
    <div class="panel-heading">
        <a href="/order/cancel/${order.id}" class="btn btn-default">Cancel</a>
    </div>
</div>
</c:if>