<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form action="${url}/index" modelAttribute="form" enctype="multipart/form-data">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <b>Chỉnh sửa thông tin</b>
            <i class="text-danger pull-right">${message}</i>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group col-sm-6 text-center">
                        <label for="image_file">
                            <img src="/static/images/items/${form.image}" style="height: 200px; max-width: 95%">
                        </label>
                        <input id="image_file" name="image_file" type="file" class="form-control">
                        <form:hidden path="image"/>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Mã sản phẩm:</label>
                        <form:input path="id" placeholder="Tự động điền" readonly="true" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Tên:</label>
                        <form:input path="name" placeholder="Nhập tên sản phẩm?" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Giá:</label>
                        <form:input path="unitPrice" placeholder="Nhập số tiền ?" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>giảm giá:</label>
                        <form:input path="discount" placeholder="Nhập giảm giá?" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Số lượng:</label>
                    <form:input path="quantity" placeholder="Nhập số lượng?" class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                    <label>Ngày nhâp:</label>
                    <form:input path="productDate" placeholder="Nhập ngày nhập hàng?" class="form-control"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Loại:</label>
                    <form:select path="category.id" class="form-control">
                        <form:options items="${cates}" itemValue="id" itemLabel="nameVN"/>
                    </form:select>
                </div>
                <div class="form-group col-sm-6">
                    <label>Số lượng người xem:</label>
                    <form:input path="clickCount" placeholder="Số người xem?" class="form-control"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Sản phẩm mới nhất:</label>
                    <div class="form-control">
                        <form:radiobutton path="latest" value="true" label="Yes" class="radio-inline"/>
                        <form:radiobutton path="latest" value="false" label="No" class="radio-inline"/>
                    </div>
                </div>
                <div class="form-group col-sm-6">
                    <label>Sản phẩm đặc biệt:</label>
                    <div class="form-control">
                        <form:radiobutton path="special" value="true" label="Yes" class="radio-inline"/>
                        <form:radiobutton path="special" value="false" label="No" class="radio-inline"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-12">
                    <label>Description:</label>
                    <form:textarea path="description" rows="3" placeholder="Description?" class="form-control"></form:textarea>
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