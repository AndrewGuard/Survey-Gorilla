# Create a new survey with its questions an associated responses

get '/surveys/new' do
  # NO AJAX/JS YET OR I WILL END YOU

  erb :new_survey
end

# Save the survey with all its associated questions
post '/surveys/new' do
  session[:user_id] = 1 #DELETE THIS AFTER DEBUGGING
  @current_user = User.find(session[:user_id])

  if request.xhr?

  else
    puts "REQUEST:"
    p request
    survey_title = params[:survey_title]

    image_path = params[:image_file_name]

    unless image_path.nil? || image_path == ""
      File.open("" + image_path[:filename], "w") do |f|
        f.write(image_path[:tempfile].read)
      end

      file_name = image_path[:filename]
    end

    # original
    # question_prompt = params[:question_0_text]
    # question_possible_choices_str = params[:question_0_possible_responses]
    # question_possible_choices = question_possible_choices_str.split("\n")

    new_created_survey = @current_user.created_surveys.create(:title => survey_title, :image_file_name => file_name)
    # new_question = Question.new(:prompt => question_prompt)

    # question_possible_choices.each do |choice|
    #   new_possible_choice = PossibleChoice.new(:text => choice.strip)
    #   new_question.possible_choices << new_possible_choice
    # end
    # new_created_survey.questions << new_question
    # new_created_survey.save


    # "psuedocode"
    params[:question].each do |params_question|
      question = new_created_survey.questions.create(:prompt => params_question[:text])

      params_question[:possible_responses].split("\n").each do |possible_response|
        question.possible_choices.create(:text => possible_response)
      end
    end


    redirect to "/user/#{session[:user_id]}"
  end
end

# Display a list of all surveys
get '/surveys' do
  @surveys = CreatedSurvey.all
  erb :surveys
end

# Display the stats about a given survey
get '/surveys/:id/results' do
  @survey = CreatedSurvey.find(params[:id])
  @questions = @survey.questions
  completed_surveys = CompletedSurvey.where("created_survey_id = ?", params[:id])
  all_responses = []
  completed_surveys.each do |completed_survey|
    all_responses += completed_survey.responses
  end
  @all_responses_hash = all_responses.group_by { |response| response.possible_choice_id }
  # @all_responses_hash = all_responses.group_by { |response| response.question_id }

  erb :results
end

# Display a page for the user to take a survey
get '/surveys/:id' do
  @survey = CreatedSurvey.find(params[:id])
  @questions = @survey.questions

  erb :show
end

# Save the user's responses to the survey
post '/surveys/:id' do
  completed_survey = CompletedSurvey.create(user_id: session[:user_id], created_survey_id: params[:id])

  choices_hash = params[:choices].first

  choices_hash.each_pair do |question_id, choice_id|
    completed_survey.responses.create(question_id: question_id, possible_choice_id: choice_id)
  end

  redirect "user/#{session[:user_id]}"
end
