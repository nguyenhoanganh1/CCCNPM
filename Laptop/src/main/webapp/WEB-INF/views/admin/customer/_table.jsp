<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><b>CUSTOMER LIST</b></h3>
    </div>
    <table class="table table-hover">
        <thead class="bg-success">
            <tr>
                <th>Tên đăng nhập</th>
                <th>Mật khẩu</th>
                <th>Họ và tên</th>
                <th>Địa chỉ email</th>
                <th>Ảnh đại diện</th>
                <th>Trạng thái</th>
                <th>Quyền</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${items}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.password}</td>
                    <td>${item.fullname}</td>
                    <td>${item.email}</td>
                    <td>${item.photo}</td>
                    <td>${item.activated?'Active':'Inactive'}</td>
                    <td>${item.admin?'Administrator':'User'}</td>
                    <td class="text-center">
                        <div class="btn-group btn-group-xs">
						    <a href="${url}/edit/${item.id}" class="btn btn-primary">
						        <i class="glyphicon glyphicon-edit"></i>
						    </a>
						    <a href="${url}/delete/${item.id}" class="btn btn-danger">
						        <i class="glyphicon glyphicon-trash"></i>
						    </a>
						</div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<div class="btn-group btn-group-sm">
		Page ${pager.page + 1} of ${pager.count} pages 
		
			<a href="${url}/index?page=0" class="btn btn-warning"> 
				<i class="glyphicon glyphicon-hand-up"></i>
			</a> 
			<a href="${url}/index?page=${pager.page - 1}" class="btn btn-info">
				<i class="glyphicon glyphicon-hand-left"></i>
			</a> 
			
			<a class="btn btn-success">${pager.page + 1}/${pager.pageCount}</a>
			
			 <a href="${url}/index?page=${pager.page + 1}" class="btn btn-info">
				<i class="glyphicon glyphicon-hand-right"></i>
			</a> 
			
			<a href="${url}/index?page=${pager.pageCount - 1}" class="btn btn-warning"> 
				<i class="glyphicon glyphicon-hand-down"></i>
			</a>
			
		</div>