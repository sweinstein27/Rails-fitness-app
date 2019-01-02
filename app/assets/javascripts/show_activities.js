$(function () {
    $( "#next" ).click(function(e){
        e.preventDefault()
        var nextId = parseInt($("#next").attr("data-id")) + 1;
        $.get("/activity_datum/" + nextId, function(data) {
           $(".dataName").text(data["name"]);
        })
       
    });
  });