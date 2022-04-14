<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form action="${url}/index" modelAttribute="form">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <b>Chỉnh sửa thông tin</b>
            <i class="pull-right" style="color:yellow">${message}${param.message}</i>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label>Mã loại:</label>
                <form:input path="id" placeholder="Mã tự động" readonly="true" class="form-control"/>
            </div>
            <div class="form-group">
                <label>Tên tiếng anh:</label>
                <form:input path="name" placeholder="Nhập tên tiếng anh?" class="form-control"/>
                <form:errors path="name"/>
            </div>
            <div class="form-group">
                <label>Tên tiếng việt:</label>
                <form:input path="nameVN" placeholder="Tên tiêng việt?" class="form-control"/>
            </div>
        </div>
        <div class="panel-footer text-right">
            <button formaction="${url}/create" ${empty form.id ? '' : 'disabled'} class="btn btn-primary">
			    <i class="glyphicon glyphicon-plus"></i> Tạo mới
			</button>
			<button formaction="${url}/update" ${empty form.id ? 'disabled' : ''} class="btn btn-success">
			    <i class="glyphicon glyphicon-saved"></i> Sửa
			</button>
			<a href="${url}/delete/${form.id}" ${empty form.id ? 'disabled' : ''} class="btn btn-danger">
			    <i class="glyphicon glyphicon-trash"></i> Xóa
			</a>
			<a href="${url}/index" class="btn btn-info">
			    <i class="glyphicon glyphicon-retweet"></i> Cập nhật
			</a>
        </div>
    </div>    
</form:form>