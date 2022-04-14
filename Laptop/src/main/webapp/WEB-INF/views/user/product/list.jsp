<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
<c:forEach var="p" items="${prods}">
	<div class="col-sm-4">
    <div class="panel panel-default nn-prod">
        <div class="panel-heading text-center">
            ${p.name}
        </div>
        <div class="panel-body text-center">
            <a href="/product/detail/${p.id}">
                <img src="/static/images/items/${p.image}">
            </a>
        </div>
        <div class="panel-footer">
            <div class="row" data-item=${p.id}>
             <c:set var = "balance" value = "${p.unitPrice}" />
             
                <div class="col-xs-4 text-left "><fmt:formatNumber value = "${balance}" type = "number"/>đ</div>
               
                <div class="col-xs-8 text-right">
 					<jsp:include page="_actions.jsp"/>
                </div>
            </div>
        </div>
        <%-- <c:choose>
        	<c:when test="${p.special}">
        		<img src="/static/images/special_icon.gif">
        	</c:when>
        	<c:when test="${p.latest}">
        		<img src="/static/images/new_icon.gif">
        	</c:when>
        	<c:when test="${p.discount > 0}">
        		<img src="/static/images/promo_icon.gif">
        	</c:when>
        </c:choose> --%>
        
    </div>
</div>
</c:forEach></div>

<jsp:include page="_send-dialog.jsp"/>