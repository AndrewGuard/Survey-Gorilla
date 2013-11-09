$(document).ready(function() {

  $("#add_question_button").on("click", function(event){
    event.preventDefault();
    $("#questions-box").append($("#first-question").html());
  });

  $("#remove_question_button").on("click", function(event){
    event.preventDefault();
    $(".question").last().remove();
  });

  $(".bar").each(function(){
    $(this).animate({ width: $(this).data("width") }, 3000);
  });

});

