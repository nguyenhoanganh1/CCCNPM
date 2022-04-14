<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="url" value="/admin/customer" scope="request"/>
<h3 class="alert alert-success">Quản lý khách hàng</h3>

<div class="tab-content">
<jsp:include page="_form.jsp"/>
<jsp:include page="_table.jsp"/>
</div>