<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<div class="carousel slide media-carousel" id="media">
	<div class="carousel-inner">
		<div class="item  active">
			<div class="row">
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt=""
						src="https://product.hstatic.net/1000233206/product/lg_gram_2021_16z90p-g.ah73a5-3_ff25507954dd41d5a4c3677c77d93de5_large.png"></a>
				</div>
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt=""
						src="https://product.hstatic.net/1000233206/product/msi-bravo-15-b5dd-276vn-r5-5600h-2_c631fab63ba245b186334ea0b5a873a6_large.png"></a>
				</div>
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt=""
						src="https://product.hstatic.net/1000233206/product/lenovo-ideapad-5-14itl05-82fe016pvn-i5-1135g7-1_819fc75760e84dc4ab6a5004a99371d9_large.png"></a>
				</div>
			</div>
		</div>
		<c:forEach var="c" items="${list}">
			<div class="item">
				<div class="row">
					<c:forEach var="p" items="${c.products}">
						<div class="col-md-4">
							<a class="thumbnail" href="/product/detail/${p.id}"> <img
								src="/static/images/items/${p.image}" />
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
	<a data-slide="prev" href="#media" class="left carousel-control">‹</a>
	<a data-slide="next" href="#media" class="right carousel-control">›</a>
</div>

<!--Slide show-->
<%-- <div class="mi-slider">
	<c:forEach var="c" items="${list}">
		<ul>
			<c:forEach var="p" items="${c.products}">
				<li><a href="/product/detail/${p.id}"> <img
						src="/static/images/items/${p.image}" />
						<h4>${p.unitPrice}</h4>
				</a></li>
			</c:forEach>
		</ul>
	</c:forEach>
	<nav>
		<c:forEach var="c" items="${list}">
			<a href="#">${c.name}</a>
		</c:forEach>
	</nav>
</div> --%>
<style>
.mi-slider {
	height: 330px;
}

.mi-slider ul li img {
	height: 200px;
}
</style>
<script>
	$(function() {
		showCatSlider('.mi-slider', 5000);

		
	});
	/* $('#media').carousel({
			pause : true,
			interval : false,
		}); */
</script>