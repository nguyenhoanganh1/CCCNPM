<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target="#hmenu">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/home/index">Trang chủ</a>
        </div>
        <div class="collapse navbar-collapse" id="hmenu">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        Quản lý
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/admin/product/index">Quản lý sản phẩm</a></li>
                        <li><a href="/admin/category/index">Quản lý loại sản phẩm</a></li>
                        <li><a href="/admin/customer/index">Quản lý khách hàng</a></li>
                        <li><a href="/admin/order/index">Quản lý đơn hàng</a></li>
                    </ul>
                </li>
                <li><a href="/admin/report/index">Thống kê và Báo cáo</a></li>
                 <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                       Xuất file báo cáo excel
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/admin/report/export/inventory-by-category">Hàng tồn kho</a></li>
                        <li class="divider"></li>
                        <li><a href="/admin/report/export/revenue-by-category">Doanh thu từng loại</a></li>
                        <li><a href="/admin/report/export/revenue-by-customer">Doanh thu từng khách hàng</a></li>
                        <li><a href="/admin/report/export/revenue-by-year">Doanh thu từng năm</a></li>
                        <li><a href="/admin/report/export/revenue-by-quarter">Doanh thu từng quý</a></li>
                        <li><a href="/admin/report/export/revenue-by-month">Doanh thu từng tháng</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        Phân quyền
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/account/logoff">Đăng xuất</a></li>
                        <li><a href="/account/change">Đổi mật khẩu</a></li>
                        <li><a href="/admin/master/index">Phân quyền sử dụng</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>