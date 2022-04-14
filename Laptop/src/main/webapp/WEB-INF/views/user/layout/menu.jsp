<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<nav class="navbar navbar-inverse menu " data-spy="affix">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target="#hmenu">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">LapTop88</a>
		</div>
		<div class="collapse navbar-collapse" id="hmenu">
			<ul class="nav navbar-nav">
				<li><a href="/home/index"><i
						class="glyphicon glyphicon-home"></i> <s:message
							code="layout.menu.home" /> </a></li>
				<li><a href="/home/about"><i
						class="glyphicon glyphicon-info-sign"></i> Giới thiệu</a></li>
				<li><a href="/home/contact"><i
						class="glyphicon glyphicon-envelope"></i> Liên hệ</a></li>
				<li><a href="/home/feedback"><i
						class="glyphicon glyphicon-send"></i> Góp ý</a></li>
				<!--<li><a href="/home/faq"><i class="glyphicon glyphicon-question-sign"></i> Hỏi đáp</a></li>
 -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Hàng đặc biệt<span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="/product/find-by-special/0"> Sản phẩm bán
								chạy </a></li>
						<li><a href="/product/find-by-special/1">Sản phẩm mới
								nhất</a></li>
						<li><a href="/product/find-by-special/2">Sản phẩm giảm
								giá</a></li>
						<li><a href="/product/find-by-special/3">Sản phẩm nhiều
								người xem</a></li>
						<li><a href="/product/find-by-special/4">Sản phẩm đặc
								biệt</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<form method="post" action="/product/find-by-keywords"
						class="panel-body">
						<input class="search" value="${param.keywords}" name="keywords"
							placeholder="Tìm kiếm ..." class="form-control" />

					</form> <span class="glyphicon glyphicon-search icon-search"></span>
				</li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <c:choose>
							<c:when test="${empty sessionScope.user}">
       								Tài khoản
							</c:when>
							<c:otherwise>
       								${sessionScope.user.fullname}
							</c:otherwise>
						</c:choose> <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<c:choose>
							<c:when test="${empty sessionScope.user}">
								<li><a href="/account/login">Đăng nhập</a></li>
								<li><a href="/account/forgot">Quên mật khẩu</a></li>
								<li><a href="/account/register">Đăng ký</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/account/logoff">Đăng xuất</a></li>
								<li><a href="/account/change">Đổi mật khẩu</a></li>
								<li><a href="/account/edit">Cập nhật tài khoản</a></li>
								<li class="divider"></li>
								<li><a href="/order/list">Đơn đặt hàng</a></li>
								<li><a href="/order/items">Hàng đã mua</a></li>
								<li><a href="/admin/home/index">Trang quản trị</a></li>
							</c:otherwise>
						</c:choose>
					</ul></li>
				<li><a href="/cart/view"><b
						class="glyphicon glyphicon-shopping-cart nn-cart-icon"></b><span
						class="qty-cart">0</span></a></li>

				<!-- <li><a href="/home/index?lang=en"><i
						class="glyphicon glyphicon-user"></i> English</a></li>
				<li><a href="/home/index?lang=vi"><i
						class="glyphicon glyphicon-log-in"></i> Tiếng Việt</a></li> -->
			</ul>
		</div>
	</div>
</nav>

<script>
	$(function() {
		$("a[href*=lang]").click(function(e) {
			e.preventDefault();
			var href = $(this).attr("href");
			$.ajax({
				url : href,
				success : function() {
					location.reload();
				}
			})
			//return false;
		})

	})

	
</script>