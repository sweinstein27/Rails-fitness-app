$(function () {
    $(".next").on("click", function() {
      var nextId = parseInt($(".next").attr("data-id")) + 1;
      $.get("/activity_datum/" + nextId + ".json", function(data) {
        var activity_datum = data;
        console.log("woo")
        // $(".productName").text(product["name"]);
        // re-set the id to current on the link
        $(".next").attr("data-id", product["id"]);
      });
    });
  });