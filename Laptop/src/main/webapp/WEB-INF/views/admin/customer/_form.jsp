<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form action="${url}/index" modelAttribute="form" enctype="multipart/form-data">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <b>Chỉnh sửa thông tin</b>
            <i class="text-danger pull-right">${message}</i>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6 text-center">
                    <label for="photo_file">
                        <img src="/static/images/users/${form.photo}" style="height: 220px; max-width: 200px;">
                    </label>
                    <input id="photo_file" name="photo_file" type="file" class="form-control">
                    <form:hidden path="photo"/>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Tên đăng nhập:</label>
                        <form:input path="id" placeholder="Nhập tên đăng nhập?" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu:</label>
                        <form:input path="password" placeholder="Nhập mật khẩu?" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Xác nhận mật khẩu:</label>
                        <input name="confirm" value="${param.confirm}" placeholder="Xác nhận mật khẩu?" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Họ và tên:</label>
                    <form:input path="fullname" placeholder="Full Name?" class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                    <label>Địa chỉ Email:</label>
                    <form:input path="email" placeholder="Nhập email?" class="form-control"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Status:</label>
                    <div class="form-control">
                        <form:radiobutton path="activated" value="true" label="Kích hoạt" class="radio-inline"/>
                        <form:radiobutton path="activated" value="false" label="Không được kích hoạt" class="radio-inline"/>
                    </div>
                </div>
                <div class="form-group col-sm-6">
                    <label>Role:</label>
                    <div class="form-control">
                        <form:radiobutton path="admin" value="true" label="Administrator" class="radio-inline"/>
                        <form:radiobutton path="admin" value="false" label="User" class="radio-inline"/>
                    </div>
                </div>
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