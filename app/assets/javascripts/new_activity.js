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

	$('form#new_activity_entry').submit(function (e) {
		e.preventDefault();
		let user_id = this.elements.activity_entry_user_id.value
		var values = $(this).serialize();

		var posting = $.post(this.action, values);
		posting.done(function (data) {
			loadUserActivityEntries(user_id);

			
		});
	});
});

function loadUserActivityEntries(user_id) {
	$.ajax({
		url: `http://localhost:3000/users/${user_id}`,
		dataType: 'json',
		method: 'get'
	}).done(function (data) {
		$("#table-body").empty()
		data.activity_entries.forEach(function(entry) {
			let newActivity = new Activity(entry)
			newActivity.formatTime()
			$("#table-body").append(newActivity.formatIndex()) 

		})


	})

}

  class Activity {
	constructor(obj) {
	  this.id = obj.id
	  this.name = obj.name
	  this.minutes = obj.minutes
	  this.calories_burned = obj.calories_burned
	  this.user_id = obj.user_id
	  this.activity_datum_id = obj.activity_datum_id
	  this.created_at = obj.created_at
  
	}

	formatIndex() {
		return (`
		<tr id="activity-table">
			<td class="name" style="text-align: left;"><a href='/activity_datum/${this.activity_datum_id}'>${this.name}</a></td>
			<td class="calories" style="text-align: right;"> ${this.calories_burned} </td>
			<td class="created_at" style="text-align: right;"> ${this.created_at}</td>
			<td style="text-align: right;"><a href='/users/${this.user_id}/activity_entries/${this.id}/destroy'>Delete</td>
		</tr>
		`)
	}
  }

//   Activity.prototype.formatIndex = function() {
// 	return (`
// 	<tr id="activity-table">
// 		<td class="name" style="text-align: left;"><a href='/activity_datum/${this.activity_datum_id}'>${this.name}</a></td>
// 		<td class="calories" style="text-align: right;"> ${this.calories_burned} </td>
// 		<td class="created_at" style="text-align: right;"> ${this.created_at}</td>
// 		<td style="text-align: right;"><a href='/users/${this.user_id}/activity_entries/${this.id}/destroy'>Delete</td>
// 	</tr>
// 	`)
// }

Activity.prototype.formatTime = function() {
	start_date = this.created_at
	year = start_date.split("-")[0]
	month = start_date.split("-")[1]
	day = start_date.split("-")[2].split("T")[0]
	this.created_at = month + "/" + day + "/" + year
}