$(function () {
    $( "#next" ).click(function(e){
        var nextId = parseInt($("#next").attr("data-id")) + 1;
        $.get("/activity_datum/" + nextId + "/data", function(data) {
           $("#dataName").text(data["name"]);
           $("#userName").empty();
           data.users.forEach(user => {
               debugger
            $("#userName").text(user["username"]);
           });


           $("#next").attr("data-id", data["id"]);
        })
       
    });
  });