<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<div id="carousel-example-generic" class="carousel slide "
	data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">
		<div class="item active">
			<img
				src="https://theme.hstatic.net/1000233206/1000806987/14/collection_banner4.jpg?v=425"
				alt="...">
			<div class="carousel-caption">
				<h3>Caption Text</h3>
			</div>
		</div>
		<div class="item">
			<img
				src="https://theme.hstatic.net/1000233206/1000806987/14/collection_banner1.jpg?v=425"
				alt="...">
			<div class="carousel-caption">
				<h3>Caption Text</h3>
			</div>
		</div>

		<!-- https://placehold.it/1200x315 -->
		<div class="item">
			<img
				src="https://theme.hstatic.net/1000233206/1000806987/14/collection_banner2.jpg?v=425"
				alt="...">
			<div class="carousel-caption">
				<h3>Caption Text</h3>
			</div>
		</div>
	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-example-generic"
		role="button" data-slide="prev"> <span
		class="glyphicon glyphicon-chevron-left"></span>
	</a> <a class="right carousel-control" href="#carousel-example-generic"
		role="button" data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right"></span>
	</a>
</div>
<!-- Carousel -->


<!--Slide show-->
<jsp:include page="_home-slideshow.jsp" />

<!--Specials-->
<div class="panel panel-default">
	<!-- <div class="panel-heading">
		<h3 class="panel-title">HÀNG ĐẶC BIỆT</h3>
	</div> -->
	<div class="panel-body">
		<jsp:include page="../product/list.jsp" />
	</div>
</div>

