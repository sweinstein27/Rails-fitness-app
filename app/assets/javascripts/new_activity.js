$(document).ready(function(){
    $( "#new_activity" ).click(function(e){
        e.preventDefault();
        $.ajax({
            type: "GET",
            url: "/entries/new",
            dataType: "html",
            success: function(data) {
                console.log(data)
                $("#new-form").html(data);
            },
            error: function(response) {
                console.log(response)
                alert("oops!")
            }
        })
    });

    $('form').submit(function(e) {
        e.preventDefault();
        alert("stopped");

        var values = $(this).serialize();
        
        var posting = $.post(this.action, values);

        posting.done(function(data) {
            var entry = data;
            console.log(data)
            $("#name").text(entry["name"]);
            $("#calories").text(entry["calories_burned"]);
            $("#created_at").text(entry["created_at"]);
        });
    });
  });

