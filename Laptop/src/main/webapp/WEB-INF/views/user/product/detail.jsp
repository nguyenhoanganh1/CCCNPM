<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">

$(document).ready(function() {
	connect();
});
	
	function connect(event) {
		var socket = new SockJS('http://localhost:8080/ws');
		stompClient = Stomp.over(socket);
		stompClient.connect({}, this.onConnected);
		
		var oo = document.getElementById("roomId").value;
		var nho = `/channel/` + oo;		
		var ngu = `/app/chat/` + oo;		

		    this.stompClient.connect({}, () => {
		       this.stompClient.subscribe(nho, this.onMessageReceived);
		        /* this.stompClient.send(ngu + `/addUser`,{},
		                          JSON.stringify({sender: this.name,body: 'success' , messageType: 'JOIN'}));
 */
		    }); 
	}


	onConnected = () => {
		var user = document.getElementById("username-room").value;
		var ro = document.getElementById("roomId").value;
		
		var api = `/app/chat/` + ro;		
		stompClient.send(api + `/addUser`, {}, JSON.stringify({
			sender : user,
			body : '',
			type : 'JOIN',
		}));
		
		var sub = 'http://localhost:8080/channel/' + ro;
		stompClient.subscribe(sub, onMessageReceived);
	    console.log("Connect Success !!! + this.onMessageReceived");

	}



	function sendMessage(event) {
		let keycode = (event.keyCode ? event.keyCode : event.which);
		var message = document.getElementById("submit-message");
	
		if (keycode == '13' && message.value.length > 0) {
			var user = document.getElementById("username-room").value;
			var message = document.getElementById("submit-message");
			
			var chatMessage = {
				sender : user,
				body : message.value,
				type : 'CHAT'
			};
			var room = document.getElementById("roomId").value;
			var url = `/app/chat/` + room + `/sendMessage`;
			stompClient.send(url, {}, JSON.stringify(chatMessage));
			message.value = '';
		}
		
	}

	onMessageReceived = (payload) => {
		var message = JSON.parse(payload.body);
		console.log("Nhận được tin nhắn từ socket server " + message.body);
		var node = document.getElementsByClassName("message")[0];
		let date_ob = new Date();
		let date = ("0" + date_ob.getDate()).slice(-2);
		let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
		let year = date_ob.getFullYear();
		let hours = date_ob.getHours();
		let minutes = date_ob.getMinutes();
		let seconds = date_ob.getSeconds();

		// prints date & time in YYYY-MM-DD HH:MM:SS format
		var today = year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds;
		node.innerHTML += `		
			<div class="message"">
			<div class="messageContent">` +
				message.body
			+ `
				<div class="time"> ` +  today  + `</div>
			</div>
		</div>
		
		`;

	}

	
</script>

<input id="username-room" hidden="hidden" type="text"
	value="${sessionScope.user.id}" />
<input id="roomId" type="text" hidden="hidden" value="${prod.id}" />

<div class="panel panel-default nn-prod-detail">
	<div class="panel-heading">
		<h3 class="panel-title">
			<strong>Chi tiết sản phẩm</strong>
		</h3>
	</div>
	<div class="panel-body">
		<div class="row" data-item="${prod.id}">
			<div class="col-sm-6 text-center">
				<img class="nn-prod-detail-img"
					src="/static/images/items/${prod.image}">
			</div>
			<div class="col-sm-6">
				<ul>
					<%-- 					<li><b>Mã sản phẩm</b>: <i>${prod.id}</i></li> --%>
					<li><b>Tên sản phẩm</b>: <i>${prod.name}</i></li>
					<c:set var="price" value="${prod.unitPrice}" />
					<li><b>Giá</b>: <i> <fmt:formatNumber value="${price}"
								type="number" /> VND
					</i></li>
					<li><b>Giảm giá</b>: <i>${prod.discount * 100} %</i></li>
					<li><b>Số lượng còn</b>: <i>${prod.quantity}</i></li>
					<li><b>Ngày nhập</b>: <i>${prod.productDate}</i></li>
					<li><b>Loại sản phẩm</b>: <i>${prod.category.nameVN}</i></li>
					<%--  <li><b>Special?</b>: <i>${prod.special?'Có':'No'}</i></li>
                    <li><b>Latest?</b>: <i>${prod.latest?'Yes':'No'}</i></li>
                    <li><b>View Count?</b>: <i>${prod.clickCount}</i></li> --%>
					
				</ul>
			</div>
		</div>
	</div>
	<div class="panel-body text-justify">${prod.description}</div>
	<div class="panel-footer text-right" data-item="${prod.id}">
		<div class="btn-group btn-group-sm">
			<button
				class="btn btn-primary glyphicon glyphicon-shopping-cart nn-cart-add"></button>
				 
		</div>
	</div>
</div>

<div id="container">
	<div id="header">
		<h3 style="margin-left: 20px;">Bình luận</h3>
	</div>
	<div id="body">
		<div class="message">
			<c:forEach var="c" items="${comments}">
				<div class="messageContent">
					<p>${c.body}</p>
					<div class="time">${c.dateTime}</div>
				</div>
			</c:forEach>

		</div>

	</div>
	<div id="footer">
		<div id="smileyIcon"></div>
		<div id="textarea">
			<textarea id="submit-message" onkeypress="sendMessage(event)"
				style="overflow: hidden"></textarea>
		</div>
		<div id="micIcon">
			<img src="/static/images/voiceIcon.svg" />
		</div>
	</div>
</div>

<div class="nn-prod-detail">
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#tab1"> <i
				class="glyphicon glyphicon-th-list"></i> Sản phẩm cùng loại
		</a></li>
		<li><a data-toggle="tab" href="#tab2"> <i
				class="glyphicon glyphicon-edit"></i> Các sản phẩm đã xem
		</a></li>
	</ul>

	<div class="tab-content">
		<div id="tab1" class="tab-pane fade in active">
			<c:set scope="request" var="prods" value="${prod.category.products}" />
			<jsp:include page="_thumb.jsp" />
		</div>
		<div id="tab2" class="tab-pane fade">
			<c:set scope="request" var="prods" value="${visits}" />
			<jsp:include page="_thumb.jsp" />
		</div>
	</div>
</div>

<jsp:include page="_send-dialog.jsp" />