<%@ page  pageEncoding="utf-8"%>
<form action="/account/change" method="post">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="glyphicon glyphicon-user"></i>
                <b>Đổi mật khẩu</b>
            </h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label><i class="glyphicon glyphicon-user"></i> Tên tài khoản:</label>
                <input name="username" placeholder="Nhập tên tài khoản" class="form-control">
            </div>
            <div class="form-group">
                <label><i class="glyphicon glyphicon-lock"></i> Mật khẩu:</label>
                <input name="password" placeholder="Nhập mật khẩu" type="password" class="form-control">
            </div>
            <div class="form-group">
                <label><i class="glyphicon glyphicon-lock"></i> Mật khẩu mới:</label>
                <input name="newpwd" placeholder="Nhập mật khẩu mới?" type="password" class="form-control">
            </div>
            <div class="form-group">
                <label><i class="glyphicon glyphicon-lock"></i> Xác nhận mật khẩu mới:</label>
                <input name="confirm" placeholder="Xác nhận mật khẩu mới?" type="password" class="form-control">
            </div>
        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-default">
                <i class="glyphicon glyphicon-ok"></i> Đổi mật khẩu
            </button>
            <b class="pull-left text-danger"><i>${message}</i></b>
        </div>
    </div>    
</form>