$(document).ready(function() {

  $("#add_question_button").on("click", function(event){
    event.preventDefault();
    $("#questions-box").append($("#first-question").html());
  });

  $("#remove_question_button").on("click", function(event){
    event.preventDefault();
    $(".question").last().remove();
  });

  // $("#create_survey_button").on("click", function(event){
  //   event.preventDefault();
  //   $.post("/surveys/new", function(response) {

  //   });


  });


// });

// to_send = {title: "the title of the survey", image_filename: "image_file_name", questions:
//   {{prompt: "question prompt", valid_choices: "possible choices"}, {prompt: "question prompt", valid_choices: "possible choices"}}
// }.toJSON()