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
	var counter = 0
	$.ajax({
		url: `http://localhost:3000/users/${user_id}.json`,
		// dataType: 'json',
		method: 'get'
	}).done(function (data) {
		$("#table-body").empty()
		data.activity_entries.forEach(function(entry) {
			let newActivity = new Activity(entry)
			$("#table-body").append(newActivity.formatIndex()) 
			// createName(entry)
			// createCalories(entry)
			// $(".name").text(entry.name);
			// $(".calories").text(entry.calories_burned);
			// $(".created_at").text(entry.created_at);

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
  }

  Activity.prototype.formatIndex = function() {
	return (`
	<tr id="activity-table">
		<td class="name" style="text-align: left;"><a href='/activity_datum/${this.activity_datum_id}'>${this.name}</a></td>
		<td class="calories" style="text-align: right;"> ${this.calories_burned} </td>
		<td class="created_at" style="text-align: right;"> ${this.created_at}</td>
		<td style="text-align: right;"><a href='/users/${this.user_id}/activity_entries/${this.id}/destroy'>Delete</td>
	</tr>
	`)
}


// function createName(entry) {
// 	debugger
// 	var newDiv = document.createElement('div')
// 	var newName = entry.name
// 	$(newDiv).append(newName)

// 	var currentDiv = document.getElementsByClassName("name");
// 	document.body.insertBefore(newDiv, currentDiv);
// }

// function createCalories(entry){
// 	debugger
// 	var newDiv = document.createElement('div')
// 	var newCal = entry.calories_burned
// 	$(newDiv).append(newCal)

// 	var currentDiv = document.getElementsByClassName("calories");
// 	document.body.insertBefore(newDiv, currentDiv);
// }