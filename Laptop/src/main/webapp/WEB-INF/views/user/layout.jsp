<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Shopping Center</title>
<tiles:insertAttribute name="head" />
</head>
<body>
	<!--  <header class="row">
        <h1 class="alert alert-success">
            <b class="glyphicon glyphicon-shopping-cart"></b>
            <span>Online Shopping Cart</span>
        </h1>
    </header> -->


	<nav class="row">
		<tiles:insertAttribute name="menu" />
	</nav>

	<div class="container">
		<main class="row" style="margin-top: 80px;">

			<aside class="col-sm-3">
				<div class="row" style="margin-right: 2px;">
					<tiles:insertAttribute name="right" />
				</div>
			</aside>

			<article class="col-sm-9">
				<div class="row">
					<tiles:insertAttribute name="main" />
				</div>
			</article>

		</main>
		<footer class="row text-center">
			<div class="panel panel-default">
				<div class="panel-body"> <b> Hoàng Anh - Vỹ Khang - Minh Trường </b> &copy; 2021. All rights
					reserved.</div>
			</div>
		</footer>
	</div>

</body>
</html>