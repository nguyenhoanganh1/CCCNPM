$(function() {
	$("#submit-message").on("keypress", function(event) {
		let keycode = (event.keyCode ? event.keyCode : event.which);
		if (keycode == '13') {
			var message = $('textarea#submit-message').val();
			var roomId = $('#roomId').val();

			event.preventDefault();
			var data = {
				roomId: roomId,
				body: message,
			}

			console.log(data);

			if (message.length > 0) {
				$.ajax({
					url: 'http://localhost:8080/api/v1/comment/send-message',
					data: JSON.stringify(data),
					method: 'post',
					contentType: 'application/json; charset=utf-8',
					dataType: 'json',
					success: function(resp) {
						$('textarea#submit-message').val('');
					},
				})
			}

		}
	});

})