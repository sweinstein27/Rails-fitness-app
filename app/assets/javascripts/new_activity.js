$(document).ready(function(){
    $( "#new_activity" ).click(function(e){
        debugger
        e.stopImmediatePropagation();
        alert("Not Today Satan");
        return false;
    });
  });