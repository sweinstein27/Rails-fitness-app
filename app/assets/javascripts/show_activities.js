$(function () {
    $( "#next" ).click(function(e){
        var nextId = parseInt($("#next").attr("data-id")) + 1;
        $.get("/activity_datum/" + nextId + "/data", function(data) {
            console.log(data)
           $("#dataName").text(data["name"]);
           $("#userName").text(data["users"]["userName"]);

           $("#next").attr("data-id", data["id"]);
        })
       
    });
  });