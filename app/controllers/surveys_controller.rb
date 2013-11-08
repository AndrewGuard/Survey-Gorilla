# Create a new survey with its questions an associated responses

get '/surveys/new' do
  # NO AJAX/JS YET OR I WILL END YOU

  erb :new_survey
end

# Save the survey with all its associated questions
post '/surveys/new' do
  session[:user_id] = 1 #DELETE THIS AFTER DEBUGGING
  @current_user = User.find(session[:user_id])

  survey_title = params[:survey_title]

  image_path = params[:image_file_name]

  unless image_path.nil? || image_path == ""
    File.open("" + image_path[:filename], "w") do |f|
      f.write(image_path[:tempfile].read)
    end

    file_name = image_path[:filename]
  end

  question_prompt = params[:question_0_text]
  question_possible_choices_str = params[:question_0_possible_responses]
  question_possible_choices = question_possible_choices_str.split("\n")

  new_created_survey = @current_user.created_surveys.create(:title => survey_title, :image_file_name => file_name)
  new_question = Question.new(:prompt => question_prompt)

  question_possible_choices.each do |choice|
    new_possible_choice = PossibleChoice.new(:text => choice.strip)
    new_question.possible_choices << new_possible_choice
  end
  new_created_survey.questions << new_question
  new_created_survey.save

  redirect to "/user/#{session[:user_id]}"
end

# Display a list of all surveys
get '/surveys' do
  # display a list of links to all surveys
end

# Display the stats about a given survey
get '/surveys/:id/results' do
  @survey = Survey.find(params[:id])
  # returns a survey object
  @questions = @survey.questions
  # returns an array of that survey's questions

  completed_surveys = CompletedSurvey.where("survey_id = ?", params[:id])
  #returns an array of completed survey objects for this survey
  @all_responses = []
  # empty container to hold all response objects

  # go through each completed surveys for this survey
  completed_surveys.each do |completed_survey|
    # get responses for each completed survey and throw into container
    @all_responses += completed_survey.responses
  end

  

  # display a page with charts showing user responses for the given survey
end

# Display a page for the user to take a survey
get '/surveys/:id' do

end

# Save the user's responses to the survey
post '/surveys/:id' do

end
