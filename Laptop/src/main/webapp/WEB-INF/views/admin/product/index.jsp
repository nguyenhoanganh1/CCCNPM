<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:set var="url" value="/admin/product" scope="request" />
<h3 class="alert alert-primary">Quản lý sản phẩm</h3>
<div class="tab-content">

	<jsp:include page="_form.jsp" />

	<jsp:include page="_table.jsp" />

</div>