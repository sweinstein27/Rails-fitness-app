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
        href = this.action
        e.preventDefault();
		var values = $(this).serialize();

		var posting = $.post(this.action, values);
		posting.done(function (data) {
			loadChallenges(href)

			
		});
	});
});

function loadChallenges(href) {
    
	$.ajax({
		url: href,
        method: 'get',
        dataType: 'json',
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
    	});


	});

};

