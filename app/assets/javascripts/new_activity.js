$(document).ready(function () {
	$("a.new_activity").click(function (e) {
		e.preventDefault();
		$.ajax({
			type: "GET",
			url: "/entries/new",
			dataType: "html",
			success: function (data) {
				console.log(data)
				$("#new-form").html(data);
			},
			error: function (response) {
				console.log(response)
				alert("oops!")
			}
		})
	});

	$('form').submit(function (e) {
		e.preventDefault();
		// alert("stopped");
		let user_id = this.elements.activity_entry_user_id.value
		var values = $(this).serialize();

		var posting = $.post(this.action, values);

		posting.done(function (data) {

			loadUserActivityEntries(user_id)

			var entry = data;
			console.log(data)
			$("#name").text(entry["name"]);
			$("#calories").text(entry["calories_burned"]);
			$("#created_at").text(entry["created_at"]);
		});
	});
});

function loadUserActivityEntries(user_id) {

	$.ajax({
		url: `http://localhost:3000/users/${user_id}.json`,
		// dataType: 'json',
		method: 'get'
	}).done(function (data) {


		debugger;

	})

}
