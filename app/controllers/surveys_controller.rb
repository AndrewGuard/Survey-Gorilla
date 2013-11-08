# Create a new survey with its questions an associated responses

get '/surveys/new' do
  # NO AJAX/JS YET OR I WILL END YOU

  erb :new_survey
end

# Save the survey with all its associated questions
post '/surveys/new' do

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
