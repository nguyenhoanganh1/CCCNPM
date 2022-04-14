<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form action="${url}/index" modelAttribute="form">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <b>Chỉnh sửa thông tin</b>
            <i class="text-danger pull-right">${message}</i>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Mã đơn hàng:</label>
                    <form:input path="id" placeholder="Auto Number" readonly="true" class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                    <label>Ngày đặt:</label>
                    <form:input path="orderDate" readonly="true" placeholder="Order Date?" class="form-control"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Mã khách hàng:</label>
                    <form:input path="customer.id" readonly="true" placeholder="Customer Id?" class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                    <label>Địa chỉ nhận hàng:</label>
                    <form:input path="address" placeholder="Nhập địa chỉ nhận hàng?" class="form-control"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Tổng số tiền:</label>
                    <form:input path="amount" readonly="true" placeholder="Total Amount?" class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                    <label>Trạng thái đơn hàng:</label>
                    <form:select path="status" class="form-control">
                        <form:options items="${status}"/>
                    </form:select>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-12">
                    <label>Ghi chú:</label>
                    <form:textarea path="notes" rows="3" placeholder="Nhập ghi chú?" class="form-control"></form:textarea>
                </div>
            </div>
        </div>
        <div class="panel-footer text-right">
            <button formaction="${url}/create" ${empty form.id ? '' : 'disabled'} class="btn btn-primary">
			    <i class="glyphicon glyphicon-plus"></i> Create
			</button>
			<button formaction="${url}/update" ${empty form.id ? 'disabled' : ''} class="btn btn-success">
			    <i class="glyphicon glyphicon-saved"></i> Update
			</button>
			<a href="${url}/delete/${form.id}" ${empty form.id ? 'disabled' : ''} class="btn btn-danger">
			    <i class="glyphicon glyphicon-trash"></i> Delete
			</a>
			<a href="${url}/index" class="btn btn-info">
			    <i class="glyphicon glyphicon-retweet"></i> Reset
			</a>
        </div>
    </div>    
    <jsp:include page="_order-details.jsp"/>
</form:form>


