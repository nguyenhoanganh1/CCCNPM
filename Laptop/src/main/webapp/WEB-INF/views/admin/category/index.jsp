<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:set value="/admin/category" var="url" scope="request" />
<h2 class="alert alert-success">Quản lý loại sản phẩm</h2>

<div class="tab-content">
	<jsp:include page="_form.jsp" />
	<jsp:include page="_table.jsp" />
</div>
