$(document).ready(function () {
	$("a#new_challenge").click(function (e) {
        url = this.href
        e.preventDefault();
        
		$.ajax({
            type: "GET",
			url: url,
			dataType: "html",
			success: function (data) {
				$("#new-challenge-form").html(data);
			},
			error: function (response) {
				alert("oops!")
			}
		})
    });

    $('form#new_challenge').submit(function (e) {
		user_id = this.challenge_user_id.value
        e.preventDefault();
		var values = $(this).serialize();

		var posting = $.post(this.action, values);
		posting.done(function (data) {
			loadChallenges(user_id)

			
		});
	});
});

function loadChallenges(user_id) {
	$.ajax({
		url: `http://localhost:3000/users/${user_id}/challenges.json`,
        method: 'get',
	}).done(function (data) {
		$('#challenge-body').empty()
		data.forEach(function(challenge) {
			let newChallenge = new Challenge(challenge)
			$("#challenge-body").append(newChallenge.formatIndex()) 
    	});


	});

};

class Challenge {
	constructor(obj) {
	  this.id = obj.id
	  this.name = obj.name
	  this.rules = obj.rules
	  this.start_date = obj.start_date
	  this.end_date = obj.end_date
	}
  }


  Challenge.prototype.formatIndex = function() {
	return (`
	<tr id="challenge-row">
		<td id="challenge-name" style="text-align: left;"><a href="/challenges/${this.id}"</a>${this.name}</td>
		<td id="challenge-start" style="text-align: right;">${this.start_date}</td>
		<td id="challenge-end" style="text-align: right;">${this.end_date}</td>
  	</tr>
	`)
	
}